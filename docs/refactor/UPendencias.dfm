object FrmPendencias: TFrmPendencias
  Left = 416
  Top = 107
  Caption = 'Search Informatica'
  ClientHeight = 404
  ClientWidth = 527
  Color = clYellow
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
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 88
    Top = 8
    Width = 332
    Height = 19
    Caption = 'RELA'#199#195'O DAS PENDENCIAS POR PRA'#199'A'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 94
    Top = 294
    Width = 277
    Height = 16
    Caption = 'OBS: RELAT'#211'RIO APURADO COM BASE NA:  '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 128
    Top = 316
    Width = 212
    Height = 16
    Caption = 'DATA DE VENCIMENTO DO PEDIDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 200
    Top = 344
    Width = 82
    Height = 19
    Caption = 'AGUARDE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 88
    Top = 28
    Width = 332
    Height = 156
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label4: TLabel
      Left = 45
      Top = 20
      Width = 102
      Height = 19
      Caption = 'LIMIT.VENC.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 18
      Top = 67
      Width = 65
      Height = 23
      Caption = 'PRA'#199'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 98
      Top = 67
      Width = 64
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 18
      Top = 104
      Width = 299
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object MaskEdit1: TMaskEdit
      Left = 152
      Top = 13
      Width = 120
      Height = 31
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 0
      Text = '  /  /    '
    end
  end
  object Button1: TButton
    Left = 88
    Top = 186
    Width = 332
    Height = 52
    Caption = 'RELA'#199#195'O DAS PENDENCIAS'
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
    Left = 88
    Top = 237
    Width = 332
    Height = 52
    Caption = 'SAIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object ProgressBar1: TProgressBar
    Left = 88
    Top = 363
    Width = 332
    Height = 27
    TabOrder = 3
  end
  object RVPendpraca: TfrxReport
    Version = '5.3.14'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42647.575362268520000000
    ReportOptions.LastChange = 42650.698775150460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RVPendpracaGetValue
    Left = 456
    Top = 64
    Datasets = <
      item
        DataSet = DtsArqpag
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = DtsArqpend
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
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Height = 102.047310000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          Left = 148.482863160000000000
          Top = 9.779139470000000000
          Width = 345.130765790000000000
          Height = 20.687953680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Memo.UTF8W = (
            'RELA'#199#195'O DAS PENDENCIAS POR CLIENTE')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          Left = 591.134200000000000000
          Top = 3.908423680000000000
          Width = 35.209305790000000000
          Height = 19.892263160000000000
          Memo.UTF8W = (
            'Pag:')
        end
        object Memo3: TfrxMemoView
          Left = 634.660157890000000000
          Top = 2.736044740000000000
          Width = 56.494027370000000000
          Height = 23.870715790000000000
          Memo.UTF8W = (
            '[page#]')
        end
        object Memo4: TfrxMemoView
          Left = 119.605588950000000000
          Top = 37.074634740000000000
          Width = 50.128503160000000000
          Height = 24.666406320000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Pra'#231'a:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          Left = 174.728705260000000000
          Top = 36.714497370000000000
          Width = 201.508625790000000000
          Height = 24.268561050000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Praca]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          Left = 395.909905260000000000
          Top = 38.671402630000000000
          Width = 53.311265260000000000
          Height = 23.870715790000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Limite:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          Left = 456.500505260000000000
          Top = 38.779139470000000000
          Width = 107.617143680000000000
          Height = 24.069638420000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[Limite]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          Left = -1.440940000000000000
          Top = 71.047310000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          Left = -1.440940000000000000
          Top = 98.283550000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          Left = 82.978452630000000000
          Top = 75.563665790000000000
          Width = 58.085408420000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          Left = 175.051915790000000000
          Top = 74.585213160000000000
          Width = 67.434772110000000000
          Height = 23.472870530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Emiss'#227'o')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          Left = 300.620968420000000000
          Top = 74.585213160000000000
          Width = 78.972284740000000000
          Height = 23.075025260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          Left = 465.651336840000000000
          Top = 75.563665790000000000
          Width = 64.649855260000000000
          Height = 19.295495260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Res'#237'duo')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          Left = 552.134200000000000000
          Top = 74.585213160000000000
          Width = 33.220079470000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Situ')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          Left = 608.703252630000000000
          Top = 74.563665790000000000
          Width = 93.095791580000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Vencimento')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Height = 45.354360000000000000
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = DtsArqpag
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo15: TfrxMemoView
          Left = 148.159652630000000000
          Top = 1.569833680000000000
          Width = 58.085408420000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object frxDBDataset1NOME: TfrxMemoView
          Left = 211.992270000000000000
          Top = 1.779530000000000000
          Width = 257.008040000000000000
          Height = 18.897650000000000000
          DataSet = DtsArqpag
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOME"]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          Left = 477.328126320000000000
          Top = 1.569833680000000000
          Width = 47.741431580000000000
          Height = 19.693340530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Rota:')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          Left = 321.813332630000000000
          Top = 23.419002110000000000
          Width = 28.843781580000000000
          Height = 19.494417890000000000
          Memo.UTF8W = (
            'Tel:')
        end
        object frxDBDataset1NTEL: TfrxMemoView
          Left = 355.630180000000000000
          Top = 24.456710000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          DataField = 'NTEL'
          DataSet = DtsArqpag
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."NTEL"]')
        end
        object Memo19: TfrxMemoView
          Left = 528.940273680000000000
          Top = 24.419002110000000000
          Width = 28.445936320000000000
          Height = 19.494417890000000000
          Memo.UTF8W = (
            'Hor:')
        end
        object frxDBDataset1HORAIN: TfrxMemoView
          Left = 563.827150000000000000
          Top = 24.236240000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'HORAIN'
          DataSet = DtsArqpag
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."HORAIN"]')
        end
        object frxDBDataset1HORAFIN: TfrxMemoView
          Left = 641.299630000000000000
          Top = 24.456710000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = DtsArqpag
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."HORAFIN"]')
        end
        object frxDBDataset1ENDE: TfrxMemoView
          Left = 32.133890000000000000
          Top = 22.677180000000000000
          Width = 283.464750000000000000
          Height = 18.897650000000000000
          DataSet = DtsArqpag
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."ENDE"]')
        end
        object frxDBDataset1CODCLI: TfrxMemoView
          Left = 94.047310000000000000
          Top = 1.220470000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = DtsArqpag
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODCLI"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          Left = 30.892263160000000000
          Top = 1.569833680000000000
          Width = 56.891872630000000000
          Height = 19.494417890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Memo.UTF8W = (
            'Codigo')
          ParentFont = False
        end
        object frxDBDataset1BAIR: TfrxMemoView
          Left = 532.693260000000000000
          Top = 3.000000000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          DataSet = DtsArqpag
          DataSetName = 'frxDBDataset1'
          Memo.UTF8W = (
            '[frxDBDataset1."BAIR"]')
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        DataSet = DtsArqpend
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object frxDBDataset2PEDIDO: TfrxMemoView
          Left = 77.149660000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataField = 'PEDIDO'
          DataSet = DtsArqpend
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."PEDIDO"]')
        end
        object frxDBDataset2EMISSAO: TfrxMemoView
          Left = 151.299320000000000000
          Top = 3.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataField = 'EMISSAO'
          DataSet = DtsArqpend
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."EMISSAO"]')
        end
        object frxDBDataset2DESCRICAO: TfrxMemoView
          Left = 242.126160000000000000
          Top = 4.559060000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = DtsArqpend
          DataSetName = 'frxDBDataset2'
          Memo.UTF8W = (
            '[frxDBDataset2."DESCRICAO"]')
        end
        object frxDBDataset2VALRESI: TfrxMemoView
          Left = 455.661720000000000000
          Top = 3.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DtsArqpend
          DataSetName = 'frxDBDataset2'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset2."VALRESI"]')
          ParentFont = False
        end
        object frxDBDataset2SITU: TfrxMemoView
          Left = 556.590910000000000000
          Top = 3.779530000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          DataField = 'SITU'
          DataSet = DtsArqpend
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."SITU"]')
          ParentFont = False
        end
        object frxDBDataset2VENCTO: TfrxMemoView
          Left = 609.724800000000000000
          Top = 4.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'VENCTO'
          DataSet = DtsArqpend
          DataSetName = 'frxDBDataset2'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haCenter
          Memo.UTF8W = (
            '[frxDBDataset2."VENCTO"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Height = 26.456710000000000000
        Top = 298.582870000000000000
        Width = 718.110700000000000000
        object Line2: TfrxLineView
          Left = 417.756030000000000000
          Top = 1.000000000000000000
          Width = 139.842610000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          Top = 24.338590000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          Left = 221.310484210000000000
          Top = 2.956905260000000000
          Width = 161.923022110000000000
          Height = 15.714887890000000000
          Memo.UTF8W = (
            'TOTAL DO CLIENTE ---->')
        end
        object Memo17: TfrxMemoView
          Left = 422.759073680000000000
          Top = 1.956905260000000000
          Width = 111.396673680000000000
          Height = 19.494417890000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset2."VALRESI">,DetailData1)]')
          ParentFont = False
        end
      end
    end
  end
  object DtsArqpag: TfrxDBDataset
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
    DataSet = IBTarqpag
    BCDToCurrency = False
    Left = 456
    Top = 128
  end
  object IBTarqpag: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXCLIENTE'
    UniDirectional = False
    Left = 32
    Top = 16
    object IBTarqpagCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Required = True
      Size = 4
    end
    object IBTarqpagNCPF: TIBStringField
      FieldName = 'NCPF'
      Size = 15
    end
    object IBTarqpagNIFP: TIBStringField
      FieldName = 'NIFP'
      Size = 15
    end
    object IBTarqpagBAIR: TIBStringField
      FieldName = 'BAIR'
    end
    object IBTarqpagCIDA: TIBStringField
      FieldName = 'CIDA'
    end
    object IBTarqpagESTA: TIBStringField
      FieldName = 'ESTA'
      Size = 2
    end
    object IBTarqpagNCEP: TIBStringField
      FieldName = 'NCEP'
      Size = 9
    end
    object IBTarqpagNTEL: TIBStringField
      FieldName = 'NTEL'
      Size = 30
    end
    object IBTarqpagCONTA: TIBStringField
      FieldName = 'CONTA'
      Size = 30
    end
    object IBTarqpagVEND: TIBStringField
      FieldName = 'VEND'
      Size = 3
    end
    object IBTarqpagLCRED: TIBBCDField
      FieldName = 'LCRED'
      Precision = 18
      Size = 2
    end
    object IBTarqpagDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Size = 10
    end
    object IBTarqpagNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Size = 35
    end
    object IBTarqpagNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Size = 35
    end
    object IBTarqpagDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Size = 10
    end
    object IBTarqpagNATU: TIBStringField
      FieldName = 'NATU'
      Size = 2
    end
    object IBTarqpagROTA: TIBStringField
      FieldName = 'ROTA'
      Size = 3
    end
    object IBTarqpagPRACA: TIBStringField
      FieldName = 'PRACA'
      Size = 3
    end
    object IBTarqpagREFER: TIBStringField
      FieldName = 'REFER'
      Size = 40
    end
    object IBTarqpagOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Size = 4
    end
    object IBTarqpagSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTarqpagNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object IBTarqpagENDE: TIBStringField
      FieldName = 'ENDE'
      Size = 60
    end
    object IBTarqpagHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Size = 5
    end
    object IBTarqpagHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Size = 5
    end
    object IBTarqpagVISITA: TIBStringField
      FieldName = 'VISITA'
      Size = 12
    end
    object IBTarqpagATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBTarqpagESPED: TIBStringField
      FieldName = 'ESPED'
      Size = 6
    end
    object IBTarqpagOBSV: TBlobField
      FieldName = 'OBSV'
    end
  end
  object IBQarqpag: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXCLIENTE')
    Left = 32
    Top = 128
    object IBQarqpagCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXCLIENTE"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQarqpagNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"AUXCLIENTE"."NCPF"'
      Size = 15
    end
    object IBQarqpagNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"AUXCLIENTE"."NIFP"'
      Size = 15
    end
    object IBQarqpagBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"AUXCLIENTE"."BAIR"'
    end
    object IBQarqpagCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"AUXCLIENTE"."CIDA"'
    end
    object IBQarqpagESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"AUXCLIENTE"."ESTA"'
      Size = 2
    end
    object IBQarqpagNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"AUXCLIENTE"."NCEP"'
      Size = 9
    end
    object IBQarqpagNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"AUXCLIENTE"."NTEL"'
      Size = 30
    end
    object IBQarqpagCONTA: TIBStringField
      FieldName = 'CONTA'
      Origin = '"AUXCLIENTE"."CONTA"'
      Size = 30
    end
    object IBQarqpagVEND: TIBStringField
      FieldName = 'VEND'
      Origin = '"AUXCLIENTE"."VEND"'
      Size = 3
    end
    object IBQarqpagLCRED: TIBBCDField
      FieldName = 'LCRED'
      Origin = '"AUXCLIENTE"."LCRED"'
      Precision = 18
      Size = 2
    end
    object IBQarqpagDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Origin = '"AUXCLIENTE"."DATIMP"'
      Size = 10
    end
    object IBQarqpagNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Origin = '"AUXCLIENTE"."NOMMAE"'
      Size = 35
    end
    object IBQarqpagNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Origin = '"AUXCLIENTE"."NOMPAI"'
      Size = 35
    end
    object IBQarqpagDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Origin = '"AUXCLIENTE"."DATNASC"'
      Size = 10
    end
    object IBQarqpagNATU: TIBStringField
      FieldName = 'NATU'
      Origin = '"AUXCLIENTE"."NATU"'
      Size = 2
    end
    object IBQarqpagROTA: TIBStringField
      FieldName = 'ROTA'
      Origin = '"AUXCLIENTE"."ROTA"'
      Size = 3
    end
    object IBQarqpagPRACA: TIBStringField
      FieldName = 'PRACA'
      Origin = '"AUXCLIENTE"."PRACA"'
      Size = 3
    end
    object IBQarqpagREFER: TIBStringField
      FieldName = 'REFER'
      Origin = '"AUXCLIENTE"."REFER"'
      Size = 40
    end
    object IBQarqpagOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Origin = '"AUXCLIENTE"."OLDCLI"'
      Size = 4
    end
    object IBQarqpagSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXCLIENTE"."SITU"'
      Size = 1
    end
    object IBQarqpagNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"AUXCLIENTE"."NOME"'
      Size = 50
    end
    object IBQarqpagENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"AUXCLIENTE"."ENDE"'
      Size = 60
    end
    object IBQarqpagHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Origin = '"AUXCLIENTE"."HORAIN"'
      Size = 5
    end
    object IBQarqpagHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Origin = '"AUXCLIENTE"."HORAFIN"'
      Size = 5
    end
    object IBQarqpagVISITA: TIBStringField
      FieldName = 'VISITA'
      Origin = '"AUXCLIENTE"."VISITA"'
      Size = 12
    end
    object IBQarqpagATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"AUXCLIENTE"."ATIVO"'
      Size = 1
    end
    object IBQarqpagESPED: TIBStringField
      FieldName = 'ESPED'
      Origin = '"AUXCLIENTE"."ESPED"'
      Size = 6
    end
    object IBQarqpagOBSV: TBlobField
      FieldName = 'OBSV'
      Origin = '"AUXCLIENTE"."OBSV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBTPend: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'CODCLI'
    MasterFields = 'CODCLI'
    MasterSource = DtsPag
    TableName = 'EXTRATO'
    UniDirectional = False
    Left = 32
    Top = 184
    object IBTPendCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Required = True
      Size = 5
    end
    object IBTPendITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 5
    end
    object IBTPendPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Size = 6
    end
    object IBTPendEMISSAO: TIBStringField
      FieldName = 'EMISSAO'
      Size = 10
    end
    object IBTPendDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTPendVALSAIDA: TIBBCDField
      FieldName = 'VALSAIDA'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object IBTPendRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTPendVALVEND: TIBBCDField
      FieldName = 'VALVEND'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTPendVALRESI: TIBBCDField
      FieldName = 'VALRESI'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTPendDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTPendSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTPendVENCTO: TIBStringField
      FieldName = 'VENCTO'
      Size = 10
    end
  end
  object IBQPend: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from EXTRATO')
    Left = 32
    Top = 283
    object IBQPendCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"EXTRATO"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object IBQPendITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"EXTRATO"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object IBQPendPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"EXTRATO"."PEDIDO"'
      Size = 6
    end
    object IBQPendEMISSAO: TIBStringField
      FieldName = 'EMISSAO'
      Origin = '"EXTRATO"."EMISSAO"'
      Size = 10
    end
    object IBQPendDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"EXTRATO"."DESCRICAO"'
      Size = 40
    end
    object IBQPendVALSAIDA: TIBBCDField
      FieldName = 'VALSAIDA'
      Origin = '"EXTRATO"."VALSAIDA"'
      Precision = 9
      Size = 2
    end
    object IBQPendRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"EXTRATO"."RETORNO"'
      Size = 10
    end
    object IBQPendVALVEND: TIBBCDField
      FieldName = 'VALVEND'
      Origin = '"EXTRATO"."VALVEND"'
      Precision = 18
      Size = 2
    end
    object IBQPendVALRESI: TIBBCDField
      FieldName = 'VALRESI'
      Origin = '"EXTRATO"."VALRESI"'
      Precision = 18
      Size = 2
    end
    object IBQPendDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"EXTRATO"."DATPAG"'
      Size = 10
    end
    object IBQPendSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"EXTRATO"."SITU"'
      Size = 1
    end
    object IBQPendVENCTO: TIBStringField
      FieldName = 'VENCTO'
      Origin = '"EXTRATO"."VENCTO"'
      Size = 10
    end
  end
  object DtsArqpend: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODCLI=CODCLI'
      'ITEM=ITEM'
      'PEDIDO=PEDIDO'
      'EMISSAO=EMISSAO'
      'DESCRICAO=DESCRICAO'
      'VALSAIDA=VALSAIDA'
      'RETORNO=RETORNO'
      'VALVEND=VALVEND'
      'VALRESI=VALRESI'
      'DATPAG=DATPAG'
      'SITU=SITU'
      'VENCTO=VENCTO')
    DataSet = IBTPend
    BCDToCurrency = False
    Left = 456
    Top = 184
  end
  object DtsPag: TDataSource
    DataSet = IBTarqpag
    Left = 32
    Top = 72
  end
  object DtsPend: TDataSource
    DataSet = IBTPend
    Left = 32
    Top = 232
  end
end
