object FrmRelartigos: TFrmRelartigos
  Left = 186
  Top = 133
  Caption = 
    'SEARCH Inform'#225'tica                                      MAPAS DE' +
    ' ARTIGOS'
  ClientHeight = 413
  ClientWidth = 635
  Color = clSilver
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 8
    Top = 119
    Width = 338
    Height = 286
    DataSource = DModRosa.DsPesq_contg
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnDblClick = DBGrid1DblClick
    Columns = <
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'DATCONT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '    DATCONT'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 101
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'TIPO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '  TIPO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 55
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = '         DESCRICAO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 160
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 338
    Height = 105
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 33
      Width = 94
      Height = 19
      Caption = 'CONTAGEM'
    end
    object Label2: TLabel
      Left = 16
      Top = 70
      Width = 110
      Height = 19
      Caption = 'DATA LIMITE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MaskEdit3: TMaskEdit
      Left = 149
      Top = 27
      Width = 160
      Height = 31
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
      OnExit = MaskEdit3Exit
    end
    object MaskEdit4: TMaskEdit
      Left = 149
      Top = 64
      Width = 160
      Height = 31
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object Button1: TButton
    Left = 362
    Top = 119
    Width = 265
    Height = 50
    Caption = 'RETOR. NO PERIODO(PROD)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 362
    Top = 178
    Width = 265
    Height = 50
    Caption = 'MOVIMENTO DO ESTOQUE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 362
    Top = 237
    Width = 265
    Height = 50
    Caption = 'MOVIMENTA'#199#195'O GERAL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 362
    Top = 296
    Width = 265
    Height = 50
    Caption = 'FUTURO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Button5: TButton
    Left = 362
    Top = 355
    Width = 265
    Height = 50
    Caption = 'FUTURO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
  end
  object IBTAuxart: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXMAPA'
    UniDirectional = False
    Left = 40
    Top = 344
    object IBTAuxartCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxartDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxartESTOQ: TIntegerField
      FieldName = 'ESTOQ'
    end
    object IBTAuxartCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object IBTAuxartDEFEITO: TIntegerField
      FieldName = 'DEFEITO'
    end
    object IBTAuxartRETDEV: TIntegerField
      FieldName = 'RETDEV'
    end
    object IBTAuxartSAIDA: TIntegerField
      FieldName = 'SAIDA'
    end
    object IBTAuxartQTDFIS: TIntegerField
      FieldName = 'QTDFIS'
    end
    object IBTAuxartVALFIS: TIntegerField
      FieldName = 'VALFIS'
    end
    object IBTAuxartQTDSAC: TIntegerField
      FieldName = 'QTDSAC'
    end
    object IBTAuxartVALSAC: TIBBCDField
      FieldName = 'VALSAC'
      Precision = 18
      Size = 2
    end
    object IBTAuxartQTDREAL: TIntegerField
      FieldName = 'QTDREAL'
    end
    object IBTAuxartVALREAL: TIBBCDField
      FieldName = 'VALREAL'
      Precision = 18
      Size = 2
    end
    object IBTAuxartQTDVEN: TIntegerField
      FieldName = 'QTDVEN'
    end
    object IBTAuxartVALVEN: TIBBCDField
      FieldName = 'VALVEN'
      Precision = 18
      Size = 2
    end
    object IBTAuxartCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object IBTAuxartMEDIA: TIntegerField
      FieldName = 'MEDIA'
    end
    object IBTAuxartAPURADO: TIntegerField
      FieldName = 'APURADO'
    end
    object IBTAuxartNASACOL: TIntegerField
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
    Left = 40
    Top = 247
  end
  object DtsMapg: TfrxDBDataset
    UserName = 'DtsMapg'
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
    DataSet = IBTAuxmapa
    BCDToCurrency = False
    Left = 416
    Top = 73
  end
  object RvMapg: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.569828865700000000
    ReportOptions.LastChange = 43768.721697789350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvMapgGetValue
    Left = 415
    Top = 8
    Datasets = <
      item
        DataSet = DtsMapg
        DataSetName = 'DtsMapg'
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
        Height = 113.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 2.102350000000000000
          Width = 148.472480000000000000
          Height = 16.779530000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em:[Date]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 17.333333320000000000
          Top = 18.602350000000000000
          Width = 643.640383340000000000
          Height = 23.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'SID-TEX CONFEC'#199#213'ES - Movimenta'#231#227'o  de artigos no estoque (QUANTI' +
              'DADES)')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 66.102350000000000000
          Width = 720.622140000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 107.102350000000000000
          Width = 719.535560000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 180.833333330000000000
          Top = 40.435683320000000000
          Width = 268.902906660000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Periodo:[Datrel]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 623.000000000000000000
          Top = 2.102350000000001000
          Width = 79.661410000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pag:[Page#]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 317.666666670000000000
          Top = 67.102350000000000000
          Height = 39.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 539.166666660000000000
          Top = 66.102350010000000000
          Height = 39.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 640.166666670000000000
          Top = 68.102350000000000000
          Height = 36.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 442.500000000000000000
          Top = 88.935683330000000000
          Width = 38.774273330000000000
          Height = 15.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SAIU')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 542.500000000000000000
          Top = 68.435683330000000000
          Width = 47.661410000000000000
          Height = 17.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SACOL')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 495.666666670000000000
          Top = 88.269016670000000000
          Width = 35.220470000000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 551.000000000000000000
          Top = 87.269016670000000000
          Width = 33.220470000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 652.666666660000000000
          Top = 70.435683340000000000
          Width = 52.548546660000000000
          Height = 14.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 485.500000000000000000
          Top = 68.602350000000000000
          Height = 37.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 493.000000000000000000
          Top = 70.435683330000000000
          Width = 42.150896670000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'APUR')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 88.102350000000000000
          Width = 43.000000000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COD.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 100.000000000000000000
          Top = 87.102350000000000000
          Width = 54.629870000000000000
          Height = 17.220470000000000000
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
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 648.166666670000000000
          Top = 87.602350000000000000
          Width = 33.484230000000000000
          Height = 15.446196670000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 692.333333330000000000
          Top = 91.435683330000000000
          Width = 21.548546670000000000
          Height = 11.666666670000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '%')
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 592.500000000000000000
          Top = 68.269016670000000000
          Height = 36.666666670000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 226.833333330000000000
          Top = 67.769016670000000000
          Height = 36.279530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 597.833333330000000000
          Top = 69.935683330000000000
          Width = 40.387136669999990000
          Height = 17.112863330000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'REAL')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 599.833333330000000000
          Top = 88.102350000000000000
          Width = 31.607606670000000000
          Height = 15.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 231.666666660000000000
          Top = 67.769016660000000000
          Width = 79.730983330000000000
          Height = 16.279530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CONTAGEM')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 232.166666670000000000
          Top = 87.269016670000000000
          Width = 35.833333330000000000
          Height = 17.112863330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'INIC')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 280.000000000000000000
          Top = 87.435683330000000000
          Width = 32.381880000000000000
          Height = 17.112863330000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'SAC')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 393.500000000000000000
          Top = 88.435683330000000000
          Width = 46.489486660000000000
          Height = 16.279530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'D.COB')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 358.666666670000000000
          Top = 87.602350000000000000
          Width = 33.215213330000000000
          Height = 16.666666670000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DEF')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 320.500000000000000000
          Top = 87.269016670000000000
          Width = 35.000000000000000000
          Height = 15.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COM')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 1.338590000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSet = DtsMapg
        DataSetName = 'DtsMapg'
        RowCount = 0
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 538.833333330000000000
          Top = 1.190166669999996000
          Height = 19.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 24.243970000000000000
          Width = 715.637910000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 227.000000000000000000
          Top = 1.023500000000013000
          Height = 21.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 1.243969999999990000
          Width = 40.236240000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DtsMapg."CODART"]')
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 49.000000000000000000
          Top = 1.243969999999990000
          Width = 172.480520000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DtsMapg."DESCRICAO"]')
        end
        object frxDBDataset1RETDEV: TfrxMemoView
          AllowVectorExport = True
          Left = 400.166666670000000000
          Top = 1.910636670000002000
          Width = 29.913420000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."RETDEV"]')
          ParentFont = False
        end
        object frxDBDataset1QTDSAC: TfrxMemoView
          AllowVectorExport = True
          Left = 541.833333340000000000
          Top = 1.243970000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataField = 'QTDSAC'
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."QTDSAC"]')
          ParentFont = False
        end
        object frxDBDataset1QTDVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 643.166666660000000000
          Top = 1.743969999999990000
          Width = 40.370130000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."QTDVEN"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 639.666666670000000000
          Top = 1.690166669999996000
          Height = 20.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DtsMapgMEDIA: TfrxMemoView
          AllowVectorExport = True
          Left = 688.000000000000000000
          Top = 1.243969999999990000
          Width = 25.026283330000000000
          Height = 18.897650000000000000
          DataField = 'MEDIA'
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[DtsMapg."MEDIA"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 592.333333330000000000
          Top = 0.743969999999990300
          Height = 20.387136670000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DtsMapgQTDREAL: TfrxMemoView
          AllowVectorExport = True
          Left = 594.833333330000000000
          Top = 1.743969999999990000
          Width = 43.418676670000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."QTDREAL"]')
          ParentFont = False
        end
        object DtsMapgAPURADO: TfrxMemoView
          AllowVectorExport = True
          Left = 490.666666670000000000
          Top = 0.243970000000000000
          Width = 43.746753330000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."APURADO"]')
          ParentFont = False
        end
        object DtsMapgSAIDA: TfrxMemoView
          AllowVectorExport = True
          Left = 432.887136670000000000
          Top = 2.743970000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."SAIDA"]')
          ParentFont = False
        end
        object DtsMapgESTOQ: TfrxMemoView
          AllowVectorExport = True
          Left = 230.333333330000000000
          Top = 1.743969999999990000
          Width = 38.982993330000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."ESTOQ"]')
          ParentFont = False
        end
        object DtsMapgNASACOL: TfrxMemoView
          AllowVectorExport = True
          Left = 270.833333330000000000
          Top = 1.243970000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."NASACOL"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 317.833333330000000000
          Top = 0.743969999999990300
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DtsMapgDEFEITO: TfrxMemoView
          AllowVectorExport = True
          Left = 361.500000000000000000
          Top = 2.410636670000000000
          Width = 33.923933330000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."DEFEITO"]')
          ParentFont = False
        end
        object DtsMapgCOMPRA: TfrxMemoView
          AllowVectorExport = True
          Left = 323.000000000000000000
          Top = 2.243970000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."COMPRA"]')
          ParentFont = False
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 486.000000000000000000
          Top = 0.023499999999999990
          Height = 22.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
    end
  end
  object RvMapa: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.569828865700000000
    ReportOptions.LastChange = 43693.729923981480000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvMapaGetValue
    Left = 464
    Top = 8
    Datasets = <
      item
        DataSet = DtsMapg
        DataSetName = 'DtsMapg'
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
        Height = 113.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 2.102350000000000000
          Width = 152.252010000000000000
          Height = 16.779530000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em:[Date]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 17.333333320000000000
          Top = 18.602350000000000000
          Width = 643.640383340000000000
          Height = 23.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'SID-TEX CONFEC'#199#213'ES - Movimenta'#231#227'o  de artigos no estoque (VALORE' +
              'S)')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 66.102350000000000000
          Width = 720.622140000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 107.102350000000000000
          Width = 719.535560000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 34.166666660000000000
          Top = 42.102349990000000000
          Width = 220.569573330000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Periodo:[Datrel]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 623.000000000000000000
          Top = 2.102350000000000000
          Width = 79.661410000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pag:[Page#]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 362.499999990000000000
          Top = 66.769016670000000000
          Height = 39.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 568.166666670000000000
          Top = 67.769016670000000000
          Height = 36.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 369.166666660000000000
          Top = 69.102350000000000000
          Width = 81.828076670000000000
          Height = 17.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SACOLEIRA')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 283.500000010000000000
          Top = 84.935683340000000000
          Width = 59.387136670000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 380.166666670000000000
          Top = 87.269016670000000000
          Width = 54.053803330000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 605.999999990000000000
          Top = 69.602350010000000000
          Width = 52.548546660000000000
          Height = 14.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 286.833333330000000000
          Top = 67.935683330000000000
          Width = 49.709956670000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'APURADO')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 88.102350000000000000
          Width = 43.000000000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COD.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 100.000000000000000000
          Top = 87.102350000000000000
          Width = 54.629870000000000000
          Height = 17.220470000000000000
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
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 579.833333340000000000
          Top = 86.769016670000000000
          Width = 51.817563330000000000
          Height = 15.446196670000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 669.000000000000000000
          Top = 88.602350000000000000
          Width = 21.548546670000000000
          Height = 11.666666670000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '%')
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 466.333333340000000000
          Top = 67.602350000000000000
          Height = 36.666666670000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 257.666666660000000000
          Top = 67.769016670000000000
          Height = 36.279530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 489.499999990000000000
          Top = 69.935683330000000000
          Width = 40.387136670000000000
          Height = 17.112863330000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'REAL')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 486.499999990000000000
          Top = 88.102350000000000000
          Width = 52.440940000000000000
          Height = 15.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 370.052566660000000000
          Top = 41.269016670000000000
          Width = 76.909400000000000000
          Height = 19.225726670000000000
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
            '[Valini]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 550.670686670000000000
          Top = 41.602350000000000000
          Width = 85.715213330000000000
          Height = 19.225726670000000000
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
            '[Valsac]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 283.464750000000000000
          Top = 43.354360000000000000
          Width = 79.370130000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CONTG.INI.')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 458.102660000000000000
          Top = 41.133890000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'CONTG.SAC')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 158.740260000000000000
          Top = 3.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'hh:mm'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[Time]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSet = DtsMapg
        DataSetName = 'DtsMapg'
        RowCount = 0
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 24.243970000000000000
          Width = 715.637910000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 257.166666670000000000
          Top = 2.356833330000000000
          Height = 21.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 466.500000000000000000
          Top = 1.023500000000000000
          Height = 19.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 1.243969999999990000
          Width = 40.236240000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DtsMapg."CODART"]')
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 49.000000000000000000
          Top = 1.243969999999990000
          Width = 198.937230000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
          Frame.Typ = []
          Memo.UTF8W = (
            '[DtsMapg."DESCRICAO"]')
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 568.500000000000000000
          Top = 1.577303330000000000
          Height = 20.387136670000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 362.833333330000000000
          Top = 1.743970000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DtsMapgVALSAC: TfrxMemoView
          AllowVectorExport = True
          Left = 371.000000000000000000
          Top = 0.743970000000000000
          Width = 78.116883340000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."VALSAC"]')
          ParentFont = False
        end
        object DtsMapgVALREAL: TfrxMemoView
          AllowVectorExport = True
          Left = 470.833333330000000000
          Top = 1.410636660000000000
          Width = 89.514533330000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."VALREAL"]')
          ParentFont = False
        end
        object DtsMapgVALVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 573.333333330000000000
          Top = 1.743970000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."VALVEN"]')
          ParentFont = False
        end
        object DtsMapgMEDIA: TfrxMemoView
          AllowVectorExport = True
          Left = 665.333333330000000000
          Top = 2.243970000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."MEDIA"]')
          ParentFont = False
        end
        object DtsMapgVALFIS: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 272.008040000000000000
          Top = 1.779530000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          DataSet = DtsMapg
          DataSetName = 'DtsMapg'
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
            '[DtsMapg."VALFIS"]')
          ParentFont = False
        end
      end
    end
  end
  object DtsRetor: TfrxDBDataset
    UserName = 'Dtsretor'
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
    DataSet = IBQAuxart
    BCDToCurrency = False
    Left = 368
    Top = 74
  end
  object RvRetor: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43105.380584560180000000
    ReportOptions.LastChange = 43105.729371527780000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvRetorGetValue
    Left = 368
    Top = 8
    Datasets = <
      item
        DataSet = DtsRetor
        DataSetName = 'Dtsretor'
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
        Height = 122.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 3.102350000000001000
          Width = 205.000000000000000000
          Height = 17.000000000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [Date]')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 21.000000000000000000
          Top = 22.102350000000000000
          Width = 573.000000000000000000
          Height = 29.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              'SID TEX CONFEC'#199#213'ES - Movimenta'#231#227'o de artigos no periodo (RETORNO' +
              ')')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 132.000000000000000000
          Top = 50.102350000000000000
          Width = 308.574830000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Periodo aferido: [Datrel]')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 75.102350000000000000
          Width = 713.795300000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 119.102350000000000000
          Width = 720.574830000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 622.000000000000000000
          Top = 4.102350000000001000
          Width = 85.000000000000000000
          Height = 18.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Pag: [page#]')
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 253.000000000000000000
          Top = 76.102350000000000000
          Height = 39.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 361.000000000000000000
          Top = 76.102350000000000000
          Height = 42.338590000000010000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 415.000000000000000000
          Top = 78.102350000000000000
          Height = 40.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 532.000000000000000000
          Top = 78.102350000000000000
          Height = 37.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 10.000000000000000000
          Top = 94.102350000000000000
          Width = 171.322820000000000000
          Height = 17.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'COD               DESCRI'#199#195'O')
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 257.000000000000000000
          Top = 98.102350000000000000
          Width = 95.559060000000000000
          Height = 16.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD     VALOR')
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 279.000000000000000000
          Top = 78.102350000000000000
          Width = 59.000000000000000000
          Height = 17.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'SAIDA')
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 366.000000000000000000
          Top = 99.102350000000000000
          Width = 45.338590000000010000
          Height = 16.779530000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'RT/DV')
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 426.000000000000000000
          Top = 99.102350000000000000
          Width = 91.118120000000000000
          Height = 17.220470000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD   VALOR')
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 429.000000000000000000
          Top = 79.102350000000000000
          Width = 80.000000000000000000
          Height = 16.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'SACOLEIRA')
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 547.000000000000000000
          Top = 98.102350000000000000
          Width = 158.543290000000000000
          Height = 17.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD      VALOR    MEDIA')
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 578.000000000000000000
          Top = 79.102350000000000000
          Width = 67.543290000000040000
          Height = 15.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDIDO')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456709999999990000
        Top = 204.094620000000000000
        Width = 718.110700000000000000
        DataSet = DtsRetor
        DataSetName = 'Dtsretor'
        RowCount = 0
        object DtsretorCODART: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 0.921150000000011500
          Width = 51.456710000000000000
          Height = 18.897650000000000000
          DataField = 'CODART'
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Dtsretor."CODART"]')
        end
        object DtsretorDESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 57.000000000000000000
          Top = 0.921150000000011500
          Width = 189.362400000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
          Frame.Typ = []
          Memo.UTF8W = (
            '[Dtsretor."DESCRICAO"]')
        end
        object DtsretorQTDFIS: TfrxMemoView
          AllowVectorExport = True
          Left = 256.000000000000000000
          Top = 0.921150000000011500
          Width = 38.031540000000000000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."QTDFIS"]')
          ParentFont = False
        end
        object DtsretorVALFIS: TfrxMemoView
          AllowVectorExport = True
          Left = 299.000000000000000000
          Top = 1.921150000000012000
          Width = 56.692950000000030000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."VALFIS"]')
          ParentFont = False
        end
        object DtsretorRETDEV: TfrxMemoView
          AllowVectorExport = True
          Left = 364.000000000000000000
          Top = 0.921150000000011500
          Width = 47.370130000000000000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."RETDEV"]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 361.000000000000000000
          Top = 0.921150000000011500
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 415.000000000000000000
          Top = 0.921150000000011500
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 533.000000000000000000
          Top = 0.905380000000008100
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DtsretorQTDSAC: TfrxMemoView
          AllowVectorExport = True
          Left = 417.000000000000000000
          Top = 0.905380000000008100
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."QTDSAC"]')
          ParentFont = False
        end
        object DtsretorQTDVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 537.000000000000000000
          Top = 0.905380000000008100
          Width = 42.370130000000000000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."QTDVEN"]')
          ParentFont = False
        end
        object DtsretorVALVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 584.000000000000000000
          Top = 0.905380000000008100
          Width = 68.031540000000010000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."VALVEN"]')
          ParentFont = False
        end
        object DtsretorMEDIA: TfrxMemoView
          AllowVectorExport = True
          Left = 659.000000000000000000
          Top = 1.905380000000008000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."MEDIA"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 22.905380000000010000
          Width = 714.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 252.000000000000000000
          Top = 0.921150000000011500
          Height = 19.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object DtsretorVALSAC: TfrxMemoView
          AllowVectorExport = True
          Left = 462.000000000000000000
          Top = 0.905380000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = DtsRetor
          DataSetName = 'Dtsretor'
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
            '[Dtsretor."VALSAC"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 20.677180000000000000
        Top = 253.228510000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 0.771490000000000000
          Width = 201.354360000000000000
          Height = 15.000000000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DE NOTAS ---> [Totnot]')
        end
      end
    end
  end
  object DtsMapa: TfrxDBDataset
    UserName = 'DtsMaapa'
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
    DataSet = IBTAuxmapa
    BCDToCurrency = False
    Left = 464
    Top = 73
  end
  object IBTAuxret: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXRELMAPA'
    UniDirectional = False
    Left = 179
    Top = 346
    object IBTAuxretITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 5
    end
    object IBTAuxretPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Size = 8
    end
    object IBTAuxretCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object IBTAuxretBASE: TIBStringField
      FieldName = 'BASE'
      Size = 10
    end
    object IBTAuxretQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object IBTAuxretPRECO: TIBBCDField
      FieldName = 'PRECO'
      Precision = 18
      Size = 2
    end
  end
  object IBQAuxart: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXMAPA')
    Left = 112
    Top = 344
    object IBQAuxartCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXMAPA"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxartDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXMAPA"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxartESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      Origin = '"AUXMAPA"."ESTOQ"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartCOMPRA: TIntegerField
      FieldName = 'COMPRA'
      Origin = '"AUXMAPA"."COMPRA"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartDEFEITO: TIntegerField
      FieldName = 'DEFEITO'
      Origin = '"AUXMAPA"."DEFEITO"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartRETDEV: TIntegerField
      FieldName = 'RETDEV'
      Origin = '"AUXMAPA"."RETDEV"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartSAIDA: TIntegerField
      FieldName = 'SAIDA'
      Origin = '"AUXMAPA"."SAIDA"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartQTDFIS: TIntegerField
      FieldName = 'QTDFIS'
      Origin = '"AUXMAPA"."QTDFIS"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartVALFIS: TIntegerField
      FieldName = 'VALFIS'
      Origin = '"AUXMAPA"."VALFIS"'
      DisplayFormat = '##,##0.00'
    end
    object IBQAuxartQTDSAC: TIntegerField
      FieldName = 'QTDSAC'
      Origin = '"AUXMAPA"."QTDSAC"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartVALSAC: TIBBCDField
      FieldName = 'VALSAC'
      Origin = '"AUXMAPA"."VALSAC"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxartQTDREAL: TIntegerField
      FieldName = 'QTDREAL'
      Origin = '"AUXMAPA"."QTDREAL"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartVALREAL: TIBBCDField
      FieldName = 'VALREAL'
      Origin = '"AUXMAPA"."VALREAL"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxartQTDVEN: TIntegerField
      FieldName = 'QTDVEN'
      Origin = '"AUXMAPA"."QTDVEN"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartVALVEN: TIBBCDField
      FieldName = 'VALVEN'
      Origin = '"AUXMAPA"."VALVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxartCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"AUXMAPA"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxartMEDIA: TIntegerField
      FieldName = 'MEDIA'
      Origin = '"AUXMAPA"."MEDIA"'
      DisplayFormat = '.0'
    end
    object IBQAuxartAPURADO: TIntegerField
      FieldName = 'APURADO'
      Origin = '"AUXMAPA"."APURADO"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxartNASACOL: TIntegerField
      FieldName = 'NASACOL'
      Origin = '"AUXMAPA"."NASACOL"'
      DisplayFormat = '###0.0'
    end
  end
  object IBQAuxret: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXRELMAPA')
    Left = 257
    Top = 346
    object IBQAuxretITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXRELMAPA"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object IBQAuxretPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXRELMAPA"."PEDIDO"'
      Size = 8
    end
    object IBQAuxretCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"AUXRELMAPA"."CODIGO"'
      Size = 4
    end
    object IBQAuxretBASE: TIBStringField
      FieldName = 'BASE'
      Origin = '"AUXRELMAPA"."BASE"'
      Size = 10
    end
    object IBQAuxretQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"AUXRELMAPA"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxretPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"AUXRELMAPA"."PRECO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBTAuxmapa: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXMAPA'
    UniDirectional = False
    Left = 40
    Top = 296
    object IBTAuxmapaCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxmapaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxmapaESTOQ: TIntegerField
      FieldName = 'ESTOQ'
    end
    object IBTAuxmapaCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object IBTAuxmapaDEFEITO: TIntegerField
      FieldName = 'DEFEITO'
    end
    object IBTAuxmapaRETDEV: TIntegerField
      FieldName = 'RETDEV'
    end
    object IBTAuxmapaSAIDA: TIntegerField
      FieldName = 'SAIDA'
    end
    object IBTAuxmapaQTDFIS: TIntegerField
      FieldName = 'QTDFIS'
    end
    object IBTAuxmapaVALFIS: TIntegerField
      FieldName = 'VALFIS'
    end
    object IBTAuxmapaQTDSAC: TIntegerField
      FieldName = 'QTDSAC'
    end
    object IBTAuxmapaVALSAC: TIBBCDField
      FieldName = 'VALSAC'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaQTDREAL: TIntegerField
      FieldName = 'QTDREAL'
    end
    object IBTAuxmapaVALREAL: TIBBCDField
      FieldName = 'VALREAL'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaQTDVEN: TIntegerField
      FieldName = 'QTDVEN'
    end
    object IBTAuxmapaVALVEN: TIBBCDField
      FieldName = 'VALVEN'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaMEDIA: TIntegerField
      FieldName = 'MEDIA'
    end
    object IBTAuxmapaAPURADO: TIntegerField
      FieldName = 'APURADO'
    end
    object IBTAuxmapaNASACOL: TIntegerField
      FieldName = 'NASACOL'
    end
  end
  object IBQAuxmapa: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXMAPA'
      'Order by Codart;')
    Left = 104
    Top = 296
  end
  object IBTAuxrelmerc: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'ITEM'
        Attributes = [faRequired]
        DataType = ftString
        Size = 5
      end
      item
        Name = 'PEDIDO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CODIGO'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'BASE'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'QUANT'
        DataType = ftInteger
      end
      item
        Name = 'PRECO'
        DataType = ftBCD
        Precision = 18
        Size = 2
      end>
    StoreDefs = True
    TableName = 'AUXRELMAPA'
    UniDirectional = False
    Left = 176
    Top = 296
    object IBTAuxrelmercITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 5
    end
    object IBTAuxrelmercPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Size = 8
    end
    object IBTAuxrelmercCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object IBTAuxrelmercBASE: TIBStringField
      FieldName = 'BASE'
      Size = 10
    end
    object IBTAuxrelmercQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object IBTAuxrelmercPRECO: TIBBCDField
      FieldName = 'PRECO'
      Precision = 18
      Size = 2
    end
  end
  object IBQAuxrelmerc: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXRELMAPA')
    Left = 256
    Top = 296
    object IBQAuxrelmercITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXRELMAPA"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object IBQAuxrelmercPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXRELMAPA"."PEDIDO"'
      Size = 8
    end
    object IBQAuxrelmercCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"AUXRELMAPA"."CODIGO"'
      Size = 4
    end
    object IBQAuxrelmercBASE: TIBStringField
      FieldName = 'BASE'
      Origin = '"AUXRELMAPA"."BASE"'
      Size = 10
    end
    object IBQAuxrelmercQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"AUXRELMAPA"."QUANT"'
    end
    object IBQAuxrelmercPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"AUXRELMAPA"."PRECO"'
      Precision = 18
      Size = 2
    end
  end
end
