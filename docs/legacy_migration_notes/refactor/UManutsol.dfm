object FrmManutsol: TFrmManutsol
  Left = 15
  Top = 31
  Caption = '                            MANUTEN'#199#195'O DE SOLICITA'#199#213'ES'
  ClientHeight = 607
  ClientWidth = 994
  Color = clTeal
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
    Left = 160
    Top = 87
    Width = 809
    Height = 502
    DataSource = DModRosa.DsPesq_solicit
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
        Color = clYellow
        Expanded = False
        FieldName = 'DATSOL'
        Title.Caption = '      DATA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 114
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'VENDEDOR'
        Title.Caption = 'VEND'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 63
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'NUMERO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 114
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Color = clRed
        Expanded = False
        FieldName = 'NOMCLI'
        Title.Caption = '        NOME DO CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 358
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'SITU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 85
    Width = 146
    Height = 500
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
    object Label4: TLabel
      Left = 17
      Top = 313
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
      Left = 24
      Top = 20
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
      Left = 11
      Top = 44
      Width = 122
      Height = 41
      Caption = 'IMPLNTAR'
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
      Top = 85
      Width = 122
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
      Left = 11
      Top = 126
      Width = 122
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
      Left = 11
      Top = 168
      Width = 122
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
    object Button7: TButton
      Left = 11
      Top = 338
      Width = 122
      Height = 41
      Caption = 'SOLIC.LIMPA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 11
      Top = 210
      Width = 122
      Height = 41
      Caption = 'TABULA ART.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button8Click
    end
  end
  object Panel1: TPanel
    Left = 8
    Top = 8
    Width = 961
    Height = 73
    Caption = 
      '                                                                ' +
      '                                  '
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
      Height = 27
      CharCase = ecUpperCase
      TabOrder = 0
      Items.Strings = (
        'VENDEDOR'
        'CLIENTE'
        'NOME'
        'DATA')
    end
    object Edit1: TEdit
      Left = 384
      Top = 24
      Width = 297
      Height = 27
      TabOrder = 1
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 704
      Top = 24
      Width = 121
      Height = 27
      Color = clTeal
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
      'select * from CADLOGIN')
    Left = 208
    Top = 453
  end
  object IBQTabula: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXTABULA')
    Left = 656
    Top = 456
    object IBQTabulaARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Origin = '"AUXTABULA"."ARTIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQTabulaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXTABULA"."DESCRICAO"'
      Size = 40
    end
    object IBQTabulaPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      Origin = '"AUXTABULA"."PEQUENO"'
      Precision = 4
      Size = 1
    end
    object IBQTabulaMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      Origin = '"AUXTABULA"."MEDIO"'
      Precision = 4
      Size = 1
    end
    object IBQTabulaGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      Origin = '"AUXTABULA"."GRANDE"'
      Precision = 4
      Size = 1
    end
    object IBQTabulaXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      Origin = '"AUXTABULA"."XGRANDE"'
      Precision = 4
      Size = 1
    end
    object IBQTabulaOBSER: TIBStringField
      FieldName = 'OBSER'
      Origin = '"AUXTABULA"."OBSER"'
    end
    object IBQTabulaOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXTABULA"."OPER"'
      Size = 1
    end
    object IBQTabulaTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Origin = '"AUXTABULA"."TOTAL"'
      Precision = 4
      Size = 1
    end
  end
  object IBTTabula: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    ObjectView = True
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXTABULA'
    UniDirectional = False
    Left = 584
    Top = 456
    object IBTTabulaARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Required = True
      Size = 4
    end
    object IBTTabulaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTTabulaPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      Precision = 4
      Size = 1
    end
    object IBTTabulaMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      Precision = 4
      Size = 1
    end
    object IBTTabulaGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      Precision = 4
      Size = 1
    end
    object IBTTabulaXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      Precision = 4
      Size = 1
    end
    object IBTTabulaOBSER: TIBStringField
      FieldName = 'OBSER'
    end
    object IBTTabulaOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
    object IBTTabulaTOTAL: TIBBCDField
      FieldName = 'TOTAL'
      Precision = 4
      Size = 1
    end
  end
  object RvTabula: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43049.455161701400000000
    ReportOptions.LastChange = 43062.351721273150000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvTabulaGetValue
    Left = 728
    Top = 456
    Datasets = <
      item
        DataSet = DtsTabula
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
        Height = 68.204700000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 2.102350000000000000
          Width = 171.000000000000000000
          Height = 18.220470000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido  em: [Date]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 181.000000000000000000
          Top = 2.102350000000000000
          Width = 337.425170000000000000
          Height = 18.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TABULA'#199#194'O DE ARTIGOS SOLICITADOS')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 615.000000000000000000
          Top = 1.102350000000000000
          Width = 96.000000000000000000
          Height = 15.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG: [Page#]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 62.000000000000000000
          Top = 25.102350000000000000
          Width = 304.897650000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Peiodo: [Periodo]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 396.000000000000000000
          Top = 23.102350000000000000
          Width = 252.000000000000000000
          Height = 20.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor:[Vendedor]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 48.102350000000000000
          Width = 721.574830000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -2.000000000000000000
          Top = 67.102350000000000000
          Width = 722.456710000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 72.000000000000000000
          Top = 48.102350000000000000
          Height = 15.763760000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 365.000000000000000000
          Top = 48.102350000000000000
          Height = 18.763760000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 588.000000000000000000
          Top = 48.102350000000000000
          Height = 17.984230000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 49.102350000000000000
          Width = 55.661410000000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGO')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 146.000000000000000000
          Top = 49.102350000000000000
          Width = 91.204700000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 387.000000000000000000
          Top = 49.102350000000000000
          Width = 15.102350000000000000
          Height = 16.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 436.000000000000000000
          Top = 50.102350000000000000
          Width = 22.881880000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 491.000000000000000000
          Top = 50.102350000000000000
          Width = 20.220470000000000000
          Height = 15.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 538.000000000000000000
          Top = 49.102350000000000000
          Width = 30.440940000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 599.000000000000000000
          Top = 49.102350000000000000
          Width = 113.015770000000000000
          Height = 13.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 147.401670000000000000
        Width = 718.110700000000000000
        DataSet = DtsTabula
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 72.000000000000000000
          Top = 0.905380000000000000
          Height = 17.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 588.000000000000000000
          Top = 2.905380000000000000
          Height = 21.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 365.000000000000000000
          Top = 0.905380000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1ARTIGO: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 0.598330000000000000
          Width = 54.236240000000000000
          Height = 18.897650000000000000
          DataField = 'ARTIGO'
          DataSet = DtsTabula
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."ARTIGO"]')
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 76.000000000000000000
          Top = 0.598330000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = DtsTabula
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
        end
        object frxDBDataset1PEQUENO: TfrxMemoView
          AllowVectorExport = True
          Left = 373.000000000000000000
          Top = 0.598330000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DtsTabula
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
            '[frxDBDataset1."PEQUENO"]')
          ParentFont = False
        end
        object frxDBDataset1MEDIO: TfrxMemoView
          AllowVectorExport = True
          Left = 425.000000000000000000
          Top = 0.598330000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DtsTabula
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
            '[frxDBDataset1."MEDIO"]')
          ParentFont = False
        end
        object frxDBDataset1GRANDE: TfrxMemoView
          AllowVectorExport = True
          Left = 478.000000000000000000
          Top = 0.598330000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DtsTabula
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
            '[frxDBDataset1."GRANDE"]')
          ParentFont = False
        end
        object frxDBDataset1XGRANDE: TfrxMemoView
          AllowVectorExport = True
          Left = 535.000000000000000000
          Top = 1.598330000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DtsTabula
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
            '[frxDBDataset1."XGRANDE"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 76.000000000000000000
          Top = 3.243970000000000000
          Width = 191.338590000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOAL DE SOLICITA'#199#213'ES -->')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 278.000000000000000000
          Top = 1.243970000000000000
          Width = 52.527520000000000000
          Height = 20.000000000000000000
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
            '[Totsol]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 1.243970000000000000
          Width = 717.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object DtsTabula: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ARTIGO=ARTIGO'
      'DESCRICAO=DESCRICAO'
      'PEQUENO=PEQUENO'
      'MEDIO=MEDIO'
      'GRANDE=GRANDE'
      'XGRANDE=XGRANDE'
      'OBSER=OBSER'
      'OPER=OPER'
      'TOTAL=TOTAL')
    DataSet = IBQTabula
    BCDToCurrency = False
    Left = 792
    Top = 456
  end
  object IBTAuxsolicit: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXSOLICIT'
    UniDirectional = False
    Left = 336
    Top = 448
    object IBTAuxsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Required = True
      Size = 3
    end
    object IBTAuxsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 6
    end
    object IBTAuxsolicitCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Size = 4
    end
    object IBTAuxsolicitNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTAuxsolicitDATSOL: TDateField
      FieldName = 'DATSOL'
    end
    object IBTAuxsolicitSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
  end
  object IBQuery2: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 496
    Top = 456
  end
  object IBQAuxsolicit: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXSOLICIT')
    Left = 416
    Top = 448
    object IBQAuxsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"AUXSOLICIT"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"AUXSOLICIT"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxsolicitCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"AUXSOLICIT"."CLIENTE"'
      Size = 4
    end
    object IBQAuxsolicitNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXSOLICIT"."NOMCLI"'
      Size = 40
    end
    object IBQAuxsolicitDATSOL: TDateField
      FieldName = 'DATSOL'
      Origin = '"AUXSOLICIT"."DATSOL"'
    end
    object IBQAuxsolicitSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXSOLICIT"."SITU"'
      Size = 1
    end
  end
  object IBTAuxitsolicit: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITSOLICIT'
    UniDirectional = False
    Left = 664
    Top = 368
    object IBTAuxitsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Required = True
      Size = 3
    end
    object IBTAuxitsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 6
    end
    object IBTAuxitsolicitARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Required = True
      Size = 4
    end
    object IBTAuxitsolicitDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxitsolicitPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      DisplayFormat = '##0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitOBSER: TIBStringField
      FieldName = 'OBSER'
    end
    object IBTAuxitsolicitOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object IBQAuxitsolicit: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITSOLICIT')
    Left = 752
    Top = 368
    object IBQAuxitsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"AUXITSOLICIT"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxitsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"AUXITSOLICIT"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxitsolicitARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Origin = '"AUXITSOLICIT"."ARTIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxitsolicitDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITSOLICIT"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitsolicitPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      Origin = '"AUXITSOLICIT"."PEQUENO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      Origin = '"AUXITSOLICIT"."MEDIO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      Origin = '"AUXITSOLICIT"."GRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      Origin = '"AUXITSOLICIT"."XGRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitOBSER: TIBStringField
      FieldName = 'OBSER'
      Origin = '"AUXITSOLICIT"."OBSER"'
    end
    object IBQAuxitsolicitOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITSOLICIT"."OPER"'
      Size = 1
    end
  end
end
