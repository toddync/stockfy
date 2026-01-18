object FrmSolimpa: TFrmSolimpa
  Left = 119
  Top = 107
  Caption = 'SEARCH Informatica          GRUPO DE ARTIGOS PARA SOLICITA'#199#213'ES'
  ClientHeight = 433
  ClientWidth = 719
  Color = clSkyBlue
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
  object Label1: TLabel
    Left = 25
    Top = 323
    Width = 69
    Height = 19
    Caption = 'COD.ART'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 232
    Top = 323
    Width = 88
    Height = 19
    Caption = 'DESCRI'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 16
    Width = 681
    Height = 301
    DataSource = DtsSolist
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'CODART'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 78
        Visible = True
      end
      item
        Color = clNavy
        Expanded = False
        FieldName = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '                    DESCRI'#199#195'O'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 439
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 16
    Top = 381
    Width = 170
    Height = 35
    Caption = 'LIPAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 248
    Top = 381
    Width = 170
    Height = 35
    Caption = 'IMPRIMIR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 506
    Top = 381
    Width = 170
    Height = 35
    Caption = 'RESTAURAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button3Click
  end
  object Edit1: TEdit
    Left = 16
    Top = 345
    Width = 92
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
    Left = 114
    Top = 344
    Width = 343
    Height = 31
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = Edit2Exit
  end
  object IBQSolista: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXSOL')
    Left = 520
    Top = 328
    object IBQSolistaCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXSOL"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQSolistaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXSOL"."DESCRICAO"'
      Size = 40
    end
  end
  object IBQSolist: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    Active = True
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXSOL')
    Left = 576
    Top = 328
    object IBQSolistCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXSOL"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQSolistDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXSOL"."DESCRICAO"'
      Size = 40
    end
  end
  object IBTSolist: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXSOL'
    UniDirectional = False
    Left = 472
    Top = 328
    object IBTSolistCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTSolistDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
  end
  object DtsSolist: TDataSource
    DataSet = IBQSolist
    Left = 632
    Top = 328
  end
  object RvSolimpa: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42656.499686481500000000
    ReportOptions.LastChange = 43676.684461875000000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 200
    Top = 384
    Datasets = <
      item
        DataSet = Dtsolimpa
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
        Height = 159.032160000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 97.762978950000000000
          Top = 4.865328949999999000
          Width = 62.660628950000000000
          Height = 20.687953680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 22.956905260000000000
          Top = 28.736044740000000000
          Width = 224.981496320000000000
          Height = 21.483644210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SOLICITAC'#195'O DE ARTIGOS')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 56.031540000000010000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -0.543290000000000000
          Top = 129.960730000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 110.826840000000000000
          Top = 79.370130000000000000
          Width = 604.724800000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 106.456710000000000000
          Top = 102.771800000000000000
          Width = 608.504330000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -0.322820000000000000
          Top = 155.008040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line29: TfrxLineView
          AllowVectorExport = True
          Left = 349.913730000000000000
          Top = 0.220469999999998800
          Height = 52.913420000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          AllowVectorExport = True
          Left = 375.953000000000000000
          Top = 128.590600000000000000
          Height = 26.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          AllowVectorExport = True
          Left = 423.086890000000000000
          Top = 129.370130000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          AllowVectorExport = True
          Left = 505.457020000000000000
          Top = 56.913420000000000000
          Height = 71.811070000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          AllowVectorExport = True
          Left = 57.826840000000000000
          Top = 131.756030000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line35: TfrxLineView
          AllowVectorExport = True
          Left = 473.220780000000000000
          Top = 131.826840000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          AllowVectorExport = True
          Left = 575.031850000000000000
          Top = 130.669450000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          AllowVectorExport = True
          Left = 524.236550000000000000
          Top = 132.283550000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 350.134200000000000000
          Top = 20.897650000000000000
          Width = 366.614409999999000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line38: TfrxLineView
          AllowVectorExport = True
          Left = 450.724800000000000000
          Top = 3.236239999999999000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 60.671402630000000000
          Width = 91.703333160000000000
          Height = 20.091185790000000000
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
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 5.978452630000000000
          Top = 87.520571050000000000
          Width = 92.101178420000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 5.956905260000000000
          Top = 108.412834210000000000
          Width = 61.666015790000000000
          Height = 15.913810530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'BAIRRO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 249.707157890000000000
          Top = 107.391286840000000000
          Width = 55.698336840000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CIDADE')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 436.759073680000000000
          Top = 107.391286840000000000
          Width = 23.870715790000000000
          Height = 20.091185790000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EST')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 565.177294740000000000
          Top = 58.628307890000000000
          Width = 69.821843680000000000
          Height = 15.317042630000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CONTATO')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 509.220389470000000000
          Top = 83.520571050000000000
          Width = 42.967288420000000000
          Height = 15.515965260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'NOM:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 508.285031580000000000
          Top = 108.391286840000000000
          Width = 44.359746840000000000
          Height = 15.515965260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TEL:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 132.240455260000000000
          Width = 36.402841580000000000
          Height = 19.096572630000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'COD')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 142.482863160000000000
          Top = 135.218907890000000000
          Width = 88.918416320000000000
          Height = 15.515965260000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 591.617063160000000000
          Top = 133.262002630000000000
          Width = 112.176984740000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES')
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 391.953000000000000000
          Top = 133.262002630000000000
          Width = 16.709501050000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 439.672884210000000000
          Top = 133.262002630000000000
          Width = 20.489031050000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 488.392768420000000000
          Top = 133.240455260000000000
          Width = 19.892263160000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 540.155747370000000000
          Top = 133.240455260000000000
          Width = 27.252400530000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 533.703252630000000000
          Top = 1.870715789999998000
          Width = 72.407837890000000000
          Height = 15.714887890000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#218'MERO')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 461.000000000000000000
          Top = 0.102350000000001300
          Width = 51.000000000000000000
          Height = 17.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'VEND:')
        end
        object Line39: TfrxLineView
          AllowVectorExport = True
          Left = 518.000000000000000000
          Top = 1.102350000000001000
          Height = 50.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          AllowVectorExport = True
          Left = 616.000000000000000000
          Top = 2.102350000000001000
          Height = 50.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 632.000000000000000000
          Top = 2.102350000000001000
          Width = 62.543290000000000000
          Height = 15.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CLIENTE')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 381.392768420000000000
          Top = 1.892263159999999000
          Width = 41.972675260000000000
          Height = 15.515965260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 31.118120000000000000
        Top = 238.110390000000000000
        Width = 718.110700000000000000
        DataSet = Dtsolimpa
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 376.000000000000000000
          Top = 3.889610000000004000
          Height = 23.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 473.000000000000000000
          Top = 2.889610000000004000
          Height = 23.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 9.000000000000000000
          Top = 2.889610000000000000
          Width = 44.236240000000000000
          Height = 18.897650000000000000
          DataField = 'CODART'
          DataSet = Dtsolimpa
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODART"]')
          ParentFont = False
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 64.000000000000000000
          Top = 4.889610000000000000
          Width = 297.480520000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = Dtsolimpa
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DESCRICAO"]')
          ParentFont = False
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = -2.000000000000000000
          Top = 29.889610000000010000
          Width = 721.236240000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 575.000000000000000000
          Top = 2.889610000000004000
          Height = 22.440940000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 424.000000000000000000
          Top = 1.889610000000005000
          Height = 26.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 524.000000000000000000
          Top = 2.889610000000004000
          Height = 22.881880000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 58.000000000000000000
          Top = 1.889610000000005000
          Height = 23.440940000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 95.370130000000000000
        Top = 291.023810000000000000
        Width = 718.110700000000000000
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 423.000000000000000000
          Top = 1.976189999999974000
          Height = 59.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 473.000000000000000000
          Top = 2.976189999999974000
          Height = 57.456710000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 524.000000000000000000
          Top = 2.976189999999974000
          Height = 58.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 576.000000000000000000
          Top = 1.976189999999974000
          Height = 59.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Top = 27.976189999999970000
          Width = 716.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          AllowVectorExport = True
          Top = 62.976189999999970000
          Width = 718.118120000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 10.000000000000000000
          Top = 66.976189999999970000
          Width = 144.000000000000000000
          Height = 17.779530000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DE ITENS -->')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 221.000000000000000000
          Top = 67.976189999999970000
          Width = 143.000000000000000000
          Height = 21.220470000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DE PE'#199'AS -->')
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 455.000000000000000000
          Top = 69.976189999999970000
          Width = 124.000000000000000000
          Height = 22.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR TOTAL--_>')
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 376.000000000000000000
          Top = 1.976189999999974000
          Height = 57.677180000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line21: TfrxLineView
          AllowVectorExport = True
          Left = 58.000000000000000000
          Top = 1.976189999999974000
          Height = 57.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
      end
    end
  end
  object Dtsolimpa: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODART=CODART'
      'DESCRICAO=DESCRICAO')
    DataSet = IBQSolist
    BCDToCurrency = False
    Left = 464
    Top = 384
  end
end
