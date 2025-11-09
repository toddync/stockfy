object FrmRelsaida: TFrmRelsaida
  Left = 148
  Top = 92
  Caption = 
    'SEARCH Informatica                                           REL' +
    'ATORIOS DE SAIDA'
  ClientHeight = 322
  ClientWidth = 702
  Color = clCream
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
  object GroupBox1: TGroupBox
    Left = 32
    Top = 4
    Width = 305
    Height = 87
    Color = clMaroon
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 25
      Top = 9
      Width = 47
      Height = 16
      Caption = 'PEDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 90
      Top = 14
      Width = 72
      Height = 19
      Caption = 'NUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit7: TEdit
      Left = 19
      Top = 30
      Width = 60
      Height = 35
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Edit1: TEdit
      Left = 168
      Top = 4
      Width = 121
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Button3: TButton
      Left = 85
      Top = 39
      Width = 204
      Height = 40
      Caption = 'IMPRIMIR'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object GroupBox2: TGroupBox
    Left = 32
    Top = 95
    Width = 305
    Height = 105
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 19
      Top = 9
      Width = 60
      Height = 16
      Caption = 'ETIQUETA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 96
      Top = 21
      Width = 65
      Height = 19
      Caption = 'INICIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 96
      Top = 58
      Width = 49
      Height = 19
      Caption = 'FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit4: TEdit
      Left = 19
      Top = 30
      Width = 60
      Height = 37
      Color = clGreen
      TabOrder = 2
    end
    object Edit2: TEdit
      Left = 168
      Top = 15
      Width = 121
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      OnExit = Edit2Exit
    end
    object Edit3: TEdit
      Left = 168
      Top = 52
      Width = 121
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 1
      OnExit = Edit3Exit
    end
  end
  object GroupBox4: TGroupBox
    Left = 33
    Top = 206
    Width = 449
    Height = 105
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Label4: TLabel
      Left = 24
      Top = 8
      Width = 129
      Height = 16
      Caption = 'PEDIDOS POR FAIXA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 206
      Top = 8
      Width = 65
      Height = 19
      Caption = 'INICIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 352
      Top = 8
      Width = 49
      Height = 19
      Caption = 'FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit11: TEdit
      Left = 19
      Top = 30
      Width = 134
      Height = 37
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object Edit9: TEdit
      Left = 184
      Top = 27
      Width = 121
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit9Exit
    end
    object Edit10: TEdit
      Left = 311
      Top = 27
      Width = 121
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit10Exit
    end
    object Button4: TButton
      Left = 184
      Top = 61
      Width = 121
      Height = 36
      Caption = 'RELA'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 311
      Top = 61
      Width = 121
      Height = 36
      Caption = 'PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button5Click
    end
  end
  object Button1: TButton
    Left = 496
    Top = 208
    Width = 177
    Height = 99
    Caption = 'RESTAURAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object RvEtiqueta: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42486.352663044000000000
    ReportOptions.LastChange = 43755.377306238400000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 376
    Top = 8
    Datasets = <
      item
        DataSet = DtsEtiqueta
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
      LeftMargin = 6.000000000000000000
      RightMargin = 6.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 63.300000000000000000
      ColumnPositions.Strings = (
        '0'
        '63,30'
        '126,70')
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 136.391156670000000000
        Top = 18.897650000000000000
        Width = 239.244249000000000000
        DataSet = DtsEtiqueta
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset1CODVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 162.826840000000000000
          Top = 42.559060000000000000
          Width = 59.661410000000000000
          Height = 18.897650000000000000
          DataSet = DtsEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODVEN"]')
          ParentFont = False
        end
        object frxDBDataset1CODETIQ: TfrxMemoView
          AllowVectorExport = True
          Left = 11.495980000000000000
          Top = 6.322820000000000000
          Width = 209.637910000000000000
          Height = 30.236240000000000000
          DataField = 'CODETIQ'
          DataSet = DtsEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODETIQ"]')
          ParentFont = False
        end
        object frxDBDataset1CODCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 9.666666670000000000
          Top = 47.102350000000000000
          Width = 46.188930000000000000
          Height = 18.897650000000000000
          DataSet = DtsEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODCLI"]')
          ParentFont = False
        end
        object frxDBDataset1NOMCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 8.000000000000000000
          Top = 68.102350000000000000
          Width = 213.047310000000000000
          Height = 18.897650000000000000
          DataSet = DtsEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOMCLI"]')
          ParentFont = False
        end
        object frxDBDataset1BAIRRO: TfrxMemoView
          AllowVectorExport = True
          Left = 9.000000000000000000
          Top = 111.102350000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'BAIRRO'
          DataSet = DtsEtiqueta
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."BAIRRO"]')
          ParentFont = False
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 3.333333340000000000
          Top = 4.269016670000000000
          Width = 231.618120000000000000
          Height = 127.279530000000000000
          Frame.Typ = []
        end
      end
    end
  end
  object RvFaixa: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43088.422887060200000000
    ReportOptions.LastChange = 43090.336623900460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvFaixaGetValue
    Left = 379
    Top = 55
    Datasets = <
      item
        DataSet = DTsFaixa
        DataSetName = 'frxDBDataset2'
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
        Height = 94.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 33.000000000000000000
          Top = 23.102350000000000000
          Width = 508.000000000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX  CONFEC'#199#213'ES - Rela'#231#227'o de Pedidos Emitidos por Faixa')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 588.000000000000000000
          Top = 3.102350000000001000
          Width = 84.000000000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pag: [Page#]')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 49.102350000000000000
          Width = 425.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Faixa Atendida: [Datrel]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 35.000000000000000000
          Top = 1.102350000000001000
          Width = 200.708720000000000000
          Height = 19.779530000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EMITIDO EM: [Date]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 69.102350000000000000
          Width = 717.897650000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 93.102350000000000000
          Width = 720.354360000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 114.000000000000000000
          Top = 70.102350000000000000
          Height = 21.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 339.000000000000000000
          Top = 69.102350000000000000
          Height = 22.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 467.000000000000000000
          Top = 70.102350000000000000
          Height = 21.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 73.102350000000000000
          Width = 47.661410000000000000
          Height = 14.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 60.000000000000000000
          Top = 73.102350000000000000
          Width = 47.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vend.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 205.000000000000000000
          Top = 72.102350000000000000
          Width = 53.850340000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 368.000000000000000000
          Top = 71.102350000000000000
          Width = 49.763760000000000000
          Height = 18.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pra'#231'a')
          ParentFont = False
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 494.000000000000000000
          Top = 70.102350000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 470.000000000000000000
          Top = 74.102350000000000000
          Width = 21.779530000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sit')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 500.000000000000000000
          Top = 73.102350000000000000
          Width = 56.000000000000000000
          Height = 15.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Emiss'#227'o')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 563.000000000000000000
          Top = 72.102350000000000000
          Width = 70.456710000000000000
          Height = 17.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Devolucao')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 638.000000000000000000
          Top = 73.102350000000000000
          Width = 75.338590000000000000
          Height = 16.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Vencimento')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 25.141620000000000000
        Top = 173.858380000000000000
        Width = 718.110700000000000000
        DataSet = DTsFaixa
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 114.000000000000000000
          Top = 1.362089999999995000
          Height = 20.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 339.000000000000000000
          Top = 1.362089999999995000
          Height = 21.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 467.000000000000000000
          Top = 1.362089999999995000
          Height = 20.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset2PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 2.141619999999989000
          Width = 59.354360000000000000
          Height = 18.897650000000000000
          DataField = 'PEDIDO'
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."PEDIDO"]')
        end
        object frxDBDataset2CODVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 65.000000000000000000
          Top = 3.141619999999989000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataField = 'CODVEN'
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."CODVEN"]')
        end
        object frxDBDataset2CODCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 116.000000000000000000
          Top = 1.141619999999989000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataField = 'CODCLI'
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset2."CODCLI"]')
          ParentFont = False
        end
        object frxDBDataset2NOMCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 157.000000000000000000
          Top = 1.141619999999989000
          Width = 178.346630000000000000
          Height = 18.897650000000000000
          DataField = 'NOMCLI'
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."NOMCLI"]')
        end
        object frxDBDataset2BAICLI: TfrxMemoView
          AllowVectorExport = True
          Left = 343.000000000000000000
          Top = 1.141619999999989000
          Width = 120.299320000000000000
          Height = 18.897650000000000000
          DataField = 'BAICLI'
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."BAICLI"]')
          ParentFont = False
        end
        object frxDBDataset2BASE: TfrxMemoView
          AllowVectorExport = True
          Left = 497.000000000000000000
          Top = 2.141619999999989000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataField = 'BASE'
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."BASE"]')
        end
        object frxDBDataset2RECOL: TfrxMemoView
          AllowVectorExport = True
          Left = 572.000000000000000000
          Top = 1.141619999999989000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'RECOL'
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."RECOL"]')
        end
        object frxDBDataset2COBRAN: TfrxMemoView
          AllowVectorExport = True
          Left = 647.000000000000000000
          Top = 2.141619999999989000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."COBRAN"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 494.000000000000000000
          Top = 1.141619999999989000
          Height = 21.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset2SITU: TfrxMemoView
          AllowVectorExport = True
          Left = 470.000000000000000000
          Top = 0.141619999999989000
          Width = 19.000000000000000000
          Height = 22.677180000000000000
          DataSet = DTsFaixa
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."SITU"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 60.677180000000000000
        Top = 222.992270000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 4.007730000000010000
          Width = 719.574830000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 222.000000000000000000
          Top = 9.007730000000009000
          Width = 127.102350000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total de Pedidos -->')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 437.000000000000000000
          Top = 9.007730000000009000
          Width = 159.188930000000000000
          Height = 16.543290000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor total dos pedidos ->')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 355.000000000000000000
          Top = 8.007730000000009000
          Width = 64.661410000000000000
          Height = 17.779530000000000000
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
          Left = 604.000000000000000000
          Top = 10.007730000000010000
          Width = 70.102350000000000000
          Height = 17.559060000000000000
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
            '[Totpedido]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 164.000000000000000000
          Top = 35.007730000000010000
          Width = 130.456710000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Total do Retorno ->')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 300.000000000000000000
          Top = 35.007730000000000000
          Width = 71.661410000000000000
          Height = 17.559060000000000000
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
            '[Totretorno]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 389.000000000000000000
          Top = 35.007730000000010000
          Width = 106.000000000000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total Vendido ->')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 502.000000000000000000
          Top = 34.007730000000010000
          Width = 68.866110000000000000
          Height = 23.220470000000000000
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
            '[Totvenda]')
          ParentFont = False
        end
      end
    end
  end
  object RvPedvenda: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43088.422956782400000000
    ReportOptions.LastChange = 44089.562033379630000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvPedvendaGetValue
    Left = 381
    Top = 107
    Datasets = <
      item
        DataSet = DtsPedvenda
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Pedvenda: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 5.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 211.322820000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 35.102350000000000000
          Width = 717.574830000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 142.102350000000000000
          Width = 714.456710000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 187.102350000000000000
          Width = 720.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 125.000000000000000000
          Top = 6.102350000000000000
          Width = 276.000000000000000000
          Height = 24.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PEDIDO DE MERCADORIA NUM:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 407.000000000000000000
          Top = 5.102350000000000000
          Width = 105.000000000000000000
          Height = 24.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Numped]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 565.000000000000000000
          Top = 7.102350000000000000
          Width = 60.543290000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Num.Via:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 635.000000000000000000
          Top = 6.102350000000000000
          Width = 35.661410000000000000
          Height = 20.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Via]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 22.000000000000000000
          Top = 39.102350000000000000
          Width = 47.086580000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 58.102350000000000000
          Width = 68.307050000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 58.102350000000000000
          Width = 386.000000000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Endcli]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 39.102350000000000000
          Width = 385.000000000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Nomcli]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 80.102350000000000000
          Width = 352.118120000000000000
          Height = 21.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Complemento]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 437.000000000000000000
          Top = 81.102350000000000000
          Width = 257.000000000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Horario]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 468.000000000000000000
          Top = 38.102350000000000000
          Width = 224.000000000000000000
          Height = 19.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vend: [Vendedor]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 26.000000000000000000
          Top = 101.102350000000000000
          Width = 247.000000000000000000
          Height = 16.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro: [Baicli]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 276.000000000000000000
          Top = 101.102350000000000000
          Width = 260.000000000000000000
          Height = 18.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade: [Cidcli]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 543.000000000000000000
          Top = 101.102350000000000000
          Width = 116.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Est: [Estcli]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 27.000000000000000000
          Top = 120.102350000000000000
          Width = 118.440940000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP: [Cepcli]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 149.000000000000000000
          Top = 119.935683330000000000
          Width = 175.559060000000000000
          Height = 18.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Rg.Num: [Rgncli]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 329.000000000000000000
          Top = 121.102350000000000000
          Width = 145.574830000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF: [Cpfcli]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 481.000000000000000000
          Top = 120.102350000000000000
          Width = 223.000000000000000000
          Height = 17.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel: [Telcli]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 89.833333330000000000
          Top = 143.102350000000000000
          Height = 42.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 196.000000000000000000
          Top = 146.102350000000000000
          Height = 40.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 454.000000000000000000
          Top = 146.102350000000000000
          Height = 40.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 564.000000000000000000
          Top = 146.102350000000000000
          Height = 43.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 10.000000000000000000
          Top = 144.102350000000000000
          Width = 66.559060000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EMISS'#195'O')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 96.000000000000000000
          Top = 145.102350000000000000
          Width = 88.220470000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DEVOLU'#199#195'O')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 200.000000000000000000
          Top = 160.102350000000000000
          Width = 248.692950000000000000
          Height = 22.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel: [Contato]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 163.102350000000000000
          Width = 74.000000000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Emissao]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 98.000000000000000000
          Top = 167.102350000000000000
          Width = 81.000000000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Devolucao]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 460.000000000000000000
          Top = 148.102350000000000000
          Width = 97.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENCIMENTO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 467.000000000000000000
          Top = 166.102350000000000000
          Width = 102.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vencimento]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 570.833333330000000000
          Top = 147.935683330000000000
          Width = 66.425170000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CLIENTE')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 642.000000000000000000
          Top = 164.102350000000000000
          Width = 71.102350000000000000
          Height = 19.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CLiente]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 189.102350000000000000
          Width = 42.204700000000000000
          Height = 17.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COD.')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 51.166666670000000000
          Top = 189.102350000000000000
          Width = 53.940940000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QT.SAI')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 181.000000000000000000
          Top = 189.102350000000000000
          Width = 100.732220000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 638.000000000000000000
          Top = 187.102350000000000000
          Height = 21.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 578.000000000000000000
          Top = 189.102350000000000000
          Height = 19.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 515.000000000000000000
          Top = 188.102350000000000000
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 641.000000000000000000
          Top = 188.102350000000000000
          Width = 74.897650000000000000
          Height = 20.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Val.VEND.')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 582.000000000000000000
          Top = 189.102350000000000000
          Width = 54.000000000000000000
          Height = 19.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Qt.VEN')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 519.833333330000000000
          Top = 189.102350000000000000
          Width = 56.118120000000000000
          Height = 18.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Qt.DEV')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 395.333333330000000000
          Top = 189.769016670000000000
          Width = 55.984230000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 456.333333330000000000
          Top = 189.269016670000000000
          Width = 54.220470000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 209.102350000000000000
          Width = 720.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 1.102350000000000000
          Width = 100.984230000000000000
          Height = 30.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Sidtex')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        DataSet = DtsPedvenda
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object frxDBDataset3CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 5.333333330000000000
          Top = 2.363326669999990000
          Width = 45.236240000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."CODART"]')
          ParentFont = False
        end
        object frxDBDataset3QTDSAI: TfrxMemoView
          AllowVectorExport = True
          Left = 53.833333330000000000
          Top = 2.363326669999990000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."QTDSAI"]')
          ParentFont = False
        end
        object frxDBDataset3DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 111.000000000000000000
          Top = 2.196660000000010000
          Width = 272.732530000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."DESCRICAO"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 515.000000000000000000
          Top = 2.196660000000010000
          Height = 17.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 638.000000000000000000
          Top = 3.196660000000010000
          Height = 18.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset3QTDRET: TfrxMemoView
          AllowVectorExport = True
          Left = 521.000000000000000000
          Top = 2.196660000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."QTDRET"]')
          ParentFont = False
        end
        object frxDBDataset3QTDANT: TfrxMemoView
          AllowVectorExport = True
          Left = 581.000000000000000000
          Top = 1.196660000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."QTDANT"]')
          ParentFont = False
        end
        object frxDBDataset3VENANT: TfrxMemoView
          AllowVectorExport = True
          Left = 641.333333340000000000
          Top = 2.696660000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."VENANT"]')
          ParentFont = False
        end
        object frxDBDataset3PRECUS: TfrxMemoView
          AllowVectorExport = True
          Left = 392.000000000000000000
          Top = 3.196660000000010000
          Width = 57.370130000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."PRECUS"]')
          ParentFont = False
        end
        object frxDBDataset3PREVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 454.500000000000000000
          Top = 2.863326669999990000
          Width = 56.031540000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."PREVEN"]')
          ParentFont = False
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 575.000000000000000000
          Top = 1.858070000000000000
          Height = 18.661410000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -1.166666670000000000
          Top = 23.863326670000000000
          Width = 718.392703330000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 136.440940000000000000
        Top = 340.157700000000000000
        Width = 718.110700000000000000
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 27.858070000000000000
          Width = 723.826840000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 4.842300000000000000
          Width = 79.645640000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGOS->')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 90.000000000000000000
          Top = 4.842300000000020000
          Width = 48.763760000000000000
          Height = 16.779530000000000000
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
            '[Artigos]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 145.000000000000000000
          Top = 4.842300000000020000
          Width = 66.102350000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QUANT->')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 216.000000000000000000
          Top = 4.842300000000020000
          Width = 48.307050000000000000
          Height = 15.779530000000000000
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
            '[Quant]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 274.000000000000000000
          Top = 4.842300000000020000
          Width = 64.322820000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO->')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 343.000000000000000000
          Top = 4.842300000000020000
          Width = 61.645640000000000000
          Height = 15.000000000000000000
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
            '[Total]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 411.000000000000000000
          Top = 3.842300000000020000
          Width = 66.000000000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VENDA->')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 481.000000000000000000
          Top = 4.842300000000020000
          Width = 68.118120000000000000
          Height = 16.000000000000000000
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
            '[Vendeu]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 565.000000000000000000
          Top = 3.842300000000020000
          Width = 38.220470000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'DIF->')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 611.000000000000000000
          Top = 4.842300000000020000
          Width = 61.661410000000000000
          Height = 17.559060000000000000
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
            '[Lucro]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 90.553803330000000000
          Top = 67.901360010000000000
          Width = 381.188930000000000000
          Height = 20.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Referencias]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 14.833333330000000000
          Top = 90.234693330000000000
          Width = 458.322820000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COMPROVANTE:[Pedido]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 112.734693330000000000
          Width = 458.622140000000000000
          Height = 20.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Numcliente]')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 510.000000000000000000
          Top = 113.401360000000000000
          Width = 194.811070000000000000
          Height = 20.118120000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Retornou em: [Datret]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 556.000000000000000000
          Top = 4.724179999999990000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 0.724179999999990000
          Width = 711.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = 89.833333330000000000
          Top = 60.724180000000000000
          Width = 352.166666670000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          AllowVectorExport = True
          Left = 334.166666670000000000
          Top = 43.724180010000000000
          Width = -6.833333330000000000
          Height = 16.833333330000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line21: TfrxLineView
          AllowVectorExport = True
          Left = 376.666666670000000000
          Top = 45.224180000000000000
          Width = -5.833333340000000000
          Height = 14.446196670000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 6.500000010000000000
          Top = 40.390846670000000000
          Width = 81.543290000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ASS.DATA')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 567.371366670000000000
          Top = 35.444650000000000000
          Width = 146.897650000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA     VAL.VENDIDO')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 485.220780000000000000
          Top = 35.677180000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'RETORNO')
          ParentFont = False
        end
        object Line22: TfrxLineView
          AllowVectorExport = True
          Left = 556.047620000000000000
          Top = 30.897650000000000000
          Height = 64.252010000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          AllowVectorExport = True
          Left = 619.842920000000000000
          Top = 60.472480000000000000
          Height = 34.015770000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 489.539123810000000000
          Top = 70.191271430000000000
          Width = 50.393733330000000000
          Height = 18.177739520000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[zretor]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 561.930619050000000000
          Top = 68.191271430000000000
          Width = 46.794180950000000000
          Height = 18.537694760000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[zvendeu]')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 635.101644290000000000
          Top = 68.011293810000000000
          Width = 61.012412860000000000
          Height = 18.177739520000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[zvalven]')
          ParentFont = False
        end
      end
    end
  end
  object DtsEtiqueta: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODETIQ=CODETIQ'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'SOBNOM=SOBNOM'
      'BAIRRO=BAIRRO'
      'CODVEN=CODVEN'
      'NOMVEN=NOMVEN')
    DataSet = IBQAuxetiqueta
    BCDToCurrency = False
    Left = 448
    Top = 8
  end
  object DTsFaixa: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PEDIDO=PEDIDO'
      'CODVEN=CODVEN'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'ENDCLI=ENDCLI'
      'BAICLI=BAICLI'
      'CIDCLI=CIDCLI'
      'ESTCLI=ESTCLI'
      'BASE=BASE'
      'RECOL=RECOL'
      'COBRAN=COBRAN'
      'TOTPED=TOTPED'
      'SITU=SITU'
      'DATPED=DATPED'
      'SOLICIT=SOLICIT'
      'RETORNO=RETORNO'
      'TOTVEN=TOTVEN'
      'DATPAG=DATPAG'
      'VALPAG=VALPAG'
      'RESIDUO=RESIDUO'
      'COB=COB'
      'LIMITE=LIMITE')
    DataSet = IBTAuxmaped
    BCDToCurrency = False
    Left = 445
    Top = 55
  end
  object DtsPedvenda: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ITEM=ITEM'
      'CODART=CODART'
      'DESCRICAO=DESCRICAO'
      'QTDSAI=QTDSAI'
      'QTDRET=QTDRET'
      'PRECUS=PRECUS'
      'PREVEN=PREVEN'
      'QTDANT=QTDANT'
      'CUSANT=CUSANT'
      'VENANT=VENANT'
      'OPER=OPER')
    DataSet = IBTAuxrecibo
    BCDToCurrency = False
    Left = 449
    Top = 107
  end
  object RvPedvenda1: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43088.422956782400000000
    ReportOptions.LastChange = 43610.998453414350000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvPedvenda1GetValue
    Left = 386
    Top = 157
    Datasets = <
      item
        DataSet = DtsPevenda1
        DataSetName = 'frxDBDataset4'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Pedvenda1: TfrxReportPage
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
        Height = 218.881880000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 37.102350000000000000
          Width = 717.574830000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 148.102350000000000000
          Width = 714.456710000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 193.102350000000000000
          Width = 720.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 125.000000000000000000
          Top = 8.102350000000001000
          Width = 276.000000000000000000
          Height = 24.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PEDIDO DE MERCADORIA NUM:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 407.000000000000000000
          Top = 5.102350000000001000
          Width = 105.000000000000000000
          Height = 24.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Numped]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 565.000000000000000000
          Top = 7.102350000000001000
          Width = 60.543290000000000000
          Height = 18.559060000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
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
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 22.000000000000000000
          Top = 39.102350000000000000
          Width = 47.086580000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 60.102350000000000000
          Width = 68.307050000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 60.102350000000000000
          Width = 386.000000000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Endcli]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 39.102350000000000000
          Width = 385.000000000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Nomcli]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 84.102350000000000000
          Width = 352.118120000000000000
          Height = 21.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Complemento]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 437.000000000000000000
          Top = 84.102350000000000000
          Width = 257.000000000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Horario]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 468.000000000000000000
          Top = 39.102350000000000000
          Width = 224.000000000000000000
          Height = 19.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vend: [Vendedor]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 24.000000000000000000
          Top = 108.102350000000000000
          Width = 247.000000000000000000
          Height = 16.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro: [Baicli]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 276.000000000000000000
          Top = 107.102350000000000000
          Width = 260.000000000000000000
          Height = 18.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade: [Cidcli]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 543.000000000000000000
          Top = 107.102350000000000000
          Width = 116.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Est: [Estcli]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 31.000000000000000000
          Top = 127.102350000000000000
          Width = 118.440940000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP: [Cepcli]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 152.000000000000000000
          Top = 127.102350000000000000
          Width = 175.559060000000000000
          Height = 18.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Rg.Num: [Rgncli]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 336.000000000000000000
          Top = 126.102350000000000000
          Width = 145.574830000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF: [Cpfcli]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 487.000000000000000000
          Top = 125.102350000000000000
          Width = 223.000000000000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel: [Telcli]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 89.000000000000000000
          Top = 149.102350000000000000
          Height = 42.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 196.000000000000000000
          Top = 150.102350000000000000
          Height = 40.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 454.000000000000000000
          Top = 151.102350000000000000
          Height = 40.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 564.000000000000000000
          Top = 149.102350000000000000
          Height = 43.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 10.000000000000000000
          Top = 151.102350000000000000
          Width = 66.559060000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EMISS'#195'O')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 96.000000000000000000
          Top = 153.102350000000000000
          Width = 88.220470000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DEVOLU'#199#195'O')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 200.000000000000000000
          Top = 163.102350000000000000
          Width = 248.692950000000000000
          Height = 22.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel: [Contato]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 171.102350000000000000
          Width = 74.000000000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Emissao]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 100.000000000000000000
          Top = 173.102350000000000000
          Width = 77.881880000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Devolucao]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 460.000000000000000000
          Top = 151.102350000000000000
          Width = 97.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENCIMENTO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 465.000000000000000000
          Top = 170.102350000000000000
          Width = 86.881880000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vencimento]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 570.000000000000000000
          Top = 151.102350000000000000
          Width = 66.425170000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CLIENTE')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 641.000000000000000000
          Top = 167.102350000000000000
          Width = 71.102350000000000000
          Height = 19.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CLiente]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 196.102350000000000000
          Width = 45.984230000000000000
          Height = 17.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COD.')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 55.000000000000000000
          Top = 196.102350000000000000
          Width = 61.661410000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QUANT.')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 181.000000000000000000
          Top = 196.102350000000000000
          Width = 100.732220000000000000
          Height = 17.779530000000000000
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
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 531.000000000000000000
          Top = 196.102350000000000000
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 575.000000000000000000
          Top = 195.102350000000000000
          Width = 135.370130000000000000
          Height = 16.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 465.000000000000000000
          Top = 196.102350000000000000
          Width = 54.220470000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Venda')
          ParentFont = False
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Top = 218.102350000000000000
          Width = 720.559060000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 2.102350000000001000
          Width = 100.984230000000000000
          Height = 30.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -29
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Sidtex')
          ParentFont = False
          VAlign = vaCenter
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        DataSet = DtsPevenda1
        DataSetName = 'frxDBDataset4'
        RowCount = 0
        object frxDBDataset3CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 7.000000000000000000
          Top = 0.196660000000008500
          Width = 45.236240000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."CODART"]')
          ParentFont = False
        end
        object frxDBDataset3QTDSAI: TfrxMemoView
          AllowVectorExport = True
          Left = 56.000000000000000000
          Top = 0.196660000000008500
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset4."QTDSAI"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 531.000000000000000000
          Top = 2.196660000000009000
          Height = 17.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset3PREVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 456.000000000000000000
          Top = 1.417129999999986000
          Width = 71.149660000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset4."PREVEN"]')
          ParentFont = False
        end
        object frxDBDataset3DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 122.000000000000000000
          Top = 0.417129999999986000
          Width = 321.866420000000000000
          Height = 22.677180000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."DESCRICAO"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 80.000000000000000000
        Top = 343.937230000000000000
        Width = 718.110700000000000000
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -2.000000000000000000
          Top = 76.858070000000000000
          Width = 721.756030000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 25.858070000000000000
          Width = 723.826840000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 4.008966670000006000
          Width = 79.645640000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGOS->')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 90.000000000000000000
          Top = 3.842300000000023000
          Width = 48.763760000000000000
          Height = 16.779530000000000000
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
            '[Artigos]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 145.000000000000000000
          Top = 3.842300000000023000
          Width = 69.881880000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QUANT->')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 217.000000000000000000
          Top = 3.842300000000023000
          Width = 48.307050000000000000
          Height = 19.559060000000000000
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
            '[Quant]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 274.000000000000000000
          Top = 3.842300000000023000
          Width = 64.322820000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO->')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 342.000000000000000000
          Top = 3.842300000000023000
          Width = 61.645640000000000000
          Height = 18.779530000000000000
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
            '[Total]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 411.000000000000000000
          Top = 3.842300000000023000
          Width = 66.000000000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VENDA->')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 481.000000000000000000
          Top = 3.842300000000023000
          Width = 68.118120000000000000
          Height = 19.779530000000000000
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
            '[Vendeu]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 558.000000000000000000
          Top = 3.842300000000023000
          Width = 38.220470000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'DIF->')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 602.000000000000000000
          Top = 2.842300000000023000
          Width = 61.661410000000000000
          Height = 17.559060000000000000
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
            '[Lucro]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 19.000000000000000000
          Top = 53.842300000000030000
          Width = 652.000000000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            
              '  '#201' INDISPENS'#193'VELA SUA PRESEN'#199'A ( OU RESPONS'#193'VEL ) NA DEVOLU'#199#194'O ' +
              'E NO VENCIMENTO DO PEDIDO')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 463.000000000000000000
          Top = 30.842300000000000000
          Width = 244.614100000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR DO VENDIDO: ____________')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 26.000000000000000000
          Top = 29.842300000000030000
          Width = 185.000000000000000000
          Height = 21.000000000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [Date]')
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 553.000000000000000000
          Top = 2.283239999999978000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Top = 1.299009999999953000
          Width = 717.299320000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object DtsPevenda1: TfrxDBDataset
    UserName = 'frxDBDataset4'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ITEM=ITEM'
      'CODART=CODART'
      'DESCRICAO=DESCRICAO'
      'QTDSAI=QTDSAI'
      'QTDRET=QTDRET'
      'PRECUS=PRECUS'
      'PREVEN=PREVEN'
      'QTDANT=QTDANT'
      'CUSANT=CUSANT'
      'VENANT=VENANT'
      'OPER=OPER')
    DataSet = IBQAuxrecibo
    BCDToCurrency = False
    Left = 456
    Top = 156
  end
  object IBQAuxetiqueta: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXETIQUETA')
    Left = 607
    Top = 8
  end
  object IBQAuxmaped: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXPEDIDO')
    Left = 604
    Top = 54
    object IBQAuxmapedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxmapedCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"AUXPEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQAuxmapedCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXPEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQAuxmapedNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXPEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQAuxmapedENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"AUXPEDIDO"."ENDCLI"'
      Size = 40
    end
    object IBQAuxmapedBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"AUXPEDIDO"."BAICLI"'
    end
    object IBQAuxmapedCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"AUXPEDIDO"."CIDCLI"'
    end
    object IBQAuxmapedESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Origin = '"AUXPEDIDO"."ESTCLI"'
      Size = 2
    end
    object IBQAuxmapedBASE: TDateField
      FieldName = 'BASE'
      Origin = '"AUXPEDIDO"."BASE"'
    end
    object IBQAuxmapedRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"AUXPEDIDO"."RECOL"'
    end
    object IBQAuxmapedCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"AUXPEDIDO"."COBRAN"'
      DisplayFormat = '##,##0.00'
    end
    object IBQAuxmapedTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"AUXPEDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXPEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQAuxmapedDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"AUXPEDIDO"."DATPED"'
      Size = 10
    end
    object IBQAuxmapedSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"AUXPEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQAuxmapedRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"AUXPEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQAuxmapedTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"AUXPEDIDO"."TOTVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXPEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQAuxmapedVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"AUXPEDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"AUXPEDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"AUXPEDIDO"."COB"'
      Size = 1
    end
    object IBQAuxmapedLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"AUXPEDIDO"."LIMITE"'
      Size = 10
    end
  end
  object IBQAuxrecibo: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXRECIBO')
    Left = 603
    Top = 106
    object IBQAuxreciboITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXRECIBO"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxreciboCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXRECIBO"."CODART"'
      Size = 4
    end
    object IBQAuxreciboDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXRECIBO"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxreciboQTDSAI: TIBStringField
      FieldName = 'QTDSAI'
      Origin = '"AUXRECIBO"."QTDSAI"'
      Size = 8
    end
    object IBQAuxreciboQTDRET: TIBStringField
      FieldName = 'QTDRET'
      Origin = '"AUXRECIBO"."QTDRET"'
      Size = 8
    end
    object IBQAuxreciboPRECUS: TIBStringField
      FieldName = 'PRECUS'
      Origin = '"AUXRECIBO"."PRECUS"'
      Size = 12
    end
    object IBQAuxreciboPREVEN: TIBStringField
      FieldName = 'PREVEN'
      Origin = '"AUXRECIBO"."PREVEN"'
      Size = 12
    end
    object IBQAuxreciboQTDANT: TIBStringField
      FieldName = 'QTDANT'
      Origin = '"AUXRECIBO"."QTDANT"'
      Size = 8
    end
    object IBQAuxreciboCUSANT: TIBStringField
      FieldName = 'CUSANT'
      Origin = '"AUXRECIBO"."CUSANT"'
      Size = 12
    end
    object IBQAuxreciboVENANT: TIBStringField
      FieldName = 'VENANT'
      Origin = '"AUXRECIBO"."VENANT"'
      Size = 12
    end
    object IBQAuxreciboOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXRECIBO"."OPER"'
      Size = 1
    end
  end
  object IBTAuxetiqueta: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXETIQUETA'
    UniDirectional = False
    Left = 520
    Top = 8
    object IBTAuxetiquetaCODETIQ: TIBStringField
      FieldName = 'CODETIQ'
      Required = True
      Size = 6
    end
    object IBTAuxetiquetaCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTAuxetiquetaNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
    end
    object IBTAuxetiquetaSOBNOM: TIBStringField
      FieldName = 'SOBNOM'
      Size = 15
    end
    object IBTAuxetiquetaBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
    end
    object IBTAuxetiquetaCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTAuxetiquetaNOMVEN: TIBStringField
      FieldName = 'NOMVEN'
      Size = 35
    end
  end
  object IBTAuxmaped: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXPEDIDO'
    UniDirectional = False
    Left = 522
    Top = 54
    object IBTAuxmapedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxmapedCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTAuxmapedCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTAuxmapedNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTAuxmapedENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Size = 40
    end
    object IBTAuxmapedBAICLI: TIBStringField
      FieldName = 'BAICLI'
    end
    object IBTAuxmapedCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
    end
    object IBTAuxmapedESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Size = 2
    end
    object IBTAuxmapedBASE: TDateField
      FieldName = 'BASE'
    end
    object IBTAuxmapedRECOL: TDateField
      FieldName = 'RECOL'
    end
    object IBTAuxmapedCOBRAN: TDateField
      FieldName = 'COBRAN'
      DisplayFormat = '##,##0.00'
    end
    object IBTAuxmapedTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTAuxmapedDATPED: TIBStringField
      FieldName = 'DATPED'
      Size = 10
    end
    object IBTAuxmapedSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Size = 6
    end
    object IBTAuxmapedRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTAuxmapedTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTAuxmapedVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedCOB: TIBStringField
      FieldName = 'COB'
      Size = 1
    end
    object IBTAuxmapedLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Size = 10
    end
  end
  object IBTAuxrecibo: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXRECIBO'
    UniDirectional = False
    Left = 523
    Top = 105
    object IBTAuxreciboITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 3
    end
    object IBTAuxreciboCODART: TIBStringField
      FieldName = 'CODART'
      Size = 4
    end
    object IBTAuxreciboDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxreciboQTDSAI: TIBStringField
      FieldName = 'QTDSAI'
      Size = 8
    end
    object IBTAuxreciboQTDRET: TIBStringField
      FieldName = 'QTDRET'
      Size = 8
    end
    object IBTAuxreciboPRECUS: TIBStringField
      FieldName = 'PRECUS'
      Size = 12
    end
    object IBTAuxreciboPREVEN: TIBStringField
      FieldName = 'PREVEN'
      Size = 12
    end
    object IBTAuxreciboQTDANT: TIBStringField
      FieldName = 'QTDANT'
      Size = 8
    end
    object IBTAuxreciboCUSANT: TIBStringField
      FieldName = 'CUSANT'
      Size = 12
    end
    object IBTAuxreciboVENANT: TIBStringField
      FieldName = 'VENANT'
      Size = 12
    end
    object IBTAuxreciboOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object DtsEtiqped2: TfrxDBDataset
    UserName = 'frxDBDataset8'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODETIQ=CODETIQ'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'SOBNOM=SOBNOM'
      'BAIRRO=BAIRRO'
      'CODVEN=CODVEN'
      'NOMVEN=NOMVEN')
    DataSet = IBQAuxetiqueta
    BCDToCurrency = False
    Left = 608
    Top = 152
  end
  object RvEtiqped2: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43107.081126631900000000
    ReportOptions.LastChange = 43881.400105312500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 536
    Top = 152
    Datasets = <
      item
        DataSet = DtsEtiqped2
        DataSetName = 'frxDBDataset8'
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
      LeftMargin = 6.000000000000000000
      RightMargin = 6.000000000000000000
      TopMargin = 15.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 3
      ColumnWidth = 66.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '66'
        '132')
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 146.069573330000000000
        Top = 18.897650000000000000
        Width = 249.448980000000000000
        DataSet = DtsEtiqped2
        DataSetName = 'frxDBDataset8'
        RowCount = 0
        object frxDBDataset8CODVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 147.713976660000000000
          Top = 116.429190000000000000
          Width = 87.526283330000000000
          Height = 22.677180000000000000
          DataSet = DtsEtiqped2
          DataSetName = 'frxDBDataset8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset8."CODVEN"]')
          ParentFont = False
        end
        object frxDBDataset8CODETIQ: TfrxMemoView
          AllowVectorExport = True
          Left = 13.490723340000000000
          Top = 23.553803330000000000
          Width = 196.240260000000000000
          Height = 26.397650000000000000
          DataSet = DtsEtiqped2
          DataSetName = 'frxDBDataset8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset8."CODETIQ"]')
          ParentFont = False
        end
        object frxDBDataset8NOMCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 14.355596670000000000
          Top = 59.097093330000000000
          Width = 228.025046670000000000
          Height = 22.677180000000000000
          DataField = 'NOMCLI'
          DataSet = DtsEtiqped2
          DataSetName = 'frxDBDataset8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset8."NOMCLI"]')
          ParentFont = False
        end
        object frxDBDataset8BAIRRO: TfrxMemoView
          AllowVectorExport = True
          Left = 15.500000000000000000
          Top = 89.038033330000000000
          Width = 225.525046670000000000
          Height = 22.677180000000000000
          DataField = 'BAIRRO'
          DataSet = DtsEtiqped2
          DataSetName = 'frxDBDataset8'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset8."BAIRRO"]')
          ParentFont = False
        end
      end
    end
  end
end
