object FrmEtiqbar: TFrmEtiqbar
  Left = 193
  Top = 183
  Caption = 
    '                                                          EMISS'#195 +
    'O DA ETIQUETA DE BARRA'
  ClientHeight = 300
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
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 104
    Top = 10
    Width = 66
    Height = 19
    Caption = 'CODIGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 248
    Top = 66
    Width = 97
    Height = 19
    Caption = 'DESCRI'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 136
    Top = 126
    Width = 85
    Height = 19
    Caption = 'TAMANHO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 413
    Top = 126
    Width = 64
    Height = 19
    Caption = 'QUANT.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 99
    Top = 198
    Width = 63
    Height = 19
    Caption = 'DESC_1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 99
    Top = 230
    Width = 63
    Height = 19
    Caption = 'DESC_2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 99
    Top = 262
    Width = 63
    Height = 19
    Caption = 'DESC_3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 88
    Top = 30
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 88
    Top = 86
    Width = 417
    Height = 31
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
  end
  object Edit4: TEdit
    Left = 384
    Top = 150
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnExit = Edit4Exit
  end
  object ComboBox1: TComboBox
    Left = 88
    Top = 146
    Width = 193
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = ComboBox1Exit
    Items.Strings = (
      'P  - PEQUENO'
      'M  -  MEDIO'
      'G  - GRANDE'
      'GG- SUP.GRANDE')
  end
  object Edit3: TEdit
    Left = 192
    Top = 187
    Width = 273
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 3
  end
  object Edit5: TEdit
    Left = 192
    Top = 224
    Width = 273
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 4
  end
  object Edit6: TEdit
    Left = 192
    Top = 256
    Width = 273
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 15
    ParentFont = False
    TabOrder = 5
    OnExit = Edit6Exit
  end
  object frxRVEtiqbar: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42486.352663044000000000
    ReportOptions.LastChange = 42732.359670740740000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      ''
      'begin'
      ''
      'end.')
    Left = 32
    Top = 56
    Datasets = <
      item
        DataSet = frxDSEtiqbar
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Columns = 5
      ColumnWidth = 38.000000000000000000
      ColumnPositions.Strings = (
        '0'
        '38'
        '76'
        '114'
        '152')
      Frame.Typ = []
      MirrorMode = []
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 204.094620000000000000
        Top = 18.897650000000000000
        Width = 143.622140000000000000
        DataSet = frxDSEtiqbar
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object frxDBDataset7MATR: TfrxMemoView
          AllowVectorExport = True
          Left = 11.559060000000000000
          Top = 21.897650000000000000
          Width = 102.047310000000000000
          Height = 22.677180000000000000
          DataSet = frxDSEtiqbar
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODCLI"]')
          ParentFont = False
        end
        object frxDBDataset7ESTA: TfrxMemoView
          AllowVectorExport = True
          Left = 42.913420000000000000
          Top = 47.031540000000000000
          Width = 71.811070000000000000
          Height = 22.677180000000000000
          DataSet = frxDSEtiqbar
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODVEN"]')
          ParentFont = False
        end
        object BarCode1: TfrxBarCodeView
          AllowVectorExport = True
          Left = 34.015770000000000000
          Top = 74.370130000000000000
          Width = 67.000000000000000000
          Height = 41.574830000000000000
          BarType = bcCodeEAN8
          Expression = '<frxDBDataset1."CODCLI">'
          Frame.Typ = []
          Rotation = 0
          ShowText = False
          TestLine = False
          Text = '12345678'
          WideBarRatio = 2.000000000000000000
          Zoom = 1.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 2.220470000000000000
          Width = 136.063080000000000000
          Height = 196.535560000000000000
          Frame.Typ = []
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.935357890000000000
          Top = 122.326644740000000000
          Width = 125.321257890000000000
          Height = 19.295495260000000000
          DataField = 'NOMCLI'
          DataSet = frxDSEtiqbar
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOMCLI"]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 7.935357890000000000
          Top = 144.262002630000000000
          Width = 124.923412630000000000
          Height = 20.091185790000000000
          DataField = 'SOBNOM'
          DataSet = frxDSEtiqbar
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."SOBNOM"]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 9.956905260000000000
          Top = 166.132718420000000000
          Width = 122.337418420000000000
          Height = 19.494417890000000000
          DataField = 'BAIRRO'
          DataSet = frxDSEtiqbar
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."BAIRRO"]')
        end
      end
    end
  end
  object frxDSEtiqbar: TfrxDBDataset
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
    DataSet = IBQEtiqbar
    BCDToCurrency = False
    Left = 32
    Top = 112
  end
  object IBTEtiqbar: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXETIQUETA'
    UniDirectional = False
    Left = 406
    Top = 8
    object IBTEtiqbarCODETIQ: TIBStringField
      FieldName = 'CODETIQ'
      Required = True
      Size = 6
    end
    object IBTEtiqbarCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTEtiqbarNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
    end
    object IBTEtiqbarSOBNOM: TIBStringField
      FieldName = 'SOBNOM'
      Size = 15
    end
    object IBTEtiqbarBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
    end
    object IBTEtiqbarCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTEtiqbarNOMVEN: TIBStringField
      FieldName = 'NOMVEN'
      Size = 35
    end
  end
  object IBQEtiqbar: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXETIQUETA')
    Left = 523
    Top = 10
    object IBQEtiqbarCODETIQ: TIBStringField
      FieldName = 'CODETIQ'
      Origin = '"AUXETIQUETA"."CODETIQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQEtiqbarCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXETIQUETA"."CODCLI"'
      Size = 4
    end
    object IBQEtiqbarNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXETIQUETA"."NOMCLI"'
    end
    object IBQEtiqbarSOBNOM: TIBStringField
      FieldName = 'SOBNOM'
      Origin = '"AUXETIQUETA"."SOBNOM"'
      Size = 15
    end
    object IBQEtiqbarBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"AUXETIQUETA"."BAIRRO"'
    end
    object IBQEtiqbarCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"AUXETIQUETA"."CODVEN"'
      Size = 3
    end
    object IBQEtiqbarNOMVEN: TIBStringField
      FieldName = 'NOMVEN'
      Origin = '"AUXETIQUETA"."NOMVEN"'
      Size = 35
    end
  end
  object DTSEtiqbqr: TDataSource
    DataSet = IBTEtiqbar
    Left = 469
    Top = 9
  end
end
