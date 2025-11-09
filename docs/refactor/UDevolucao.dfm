object FrmDevolucao: TFrmDevolucao
  Left = 30
  Top = 15
  Caption = 
    'SEARCH INFORMATICA                                              ' +
    '              DEVOLU'#199#195'O DA COBRAN'#199'A'
  ClientHeight = 596
  ClientWidth = 962
  Color = clSkyBlue
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
  object Label1: TLabel
    Left = 101
    Top = 13
    Width = 92
    Height = 19
    Caption = 'OPERA'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 32
    Top = 434
    Width = 82
    Height = 19
    Caption = 'PRODUTO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit5: TEdit
    Left = 16
    Top = 41
    Width = 268
    Height = 31
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 16
    Top = 94
    Width = 275
    Height = 108
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label2: TLabel
      Left = 32
      Top = 14
      Width = 34
      Height = 16
      Caption = 'NOTA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 168
      Top = 14
      Width = 36
      Height = 16
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit4: TEdit
      Left = 14
      Top = 36
      Width = 89
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit4Exit
    end
    object MaskEdit1: TMaskEdit
      Left = 128
      Top = 36
      Width = 120
      Height = 31
      Color = clSilver
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
    end
  end
  object GroupBox2: TGroupBox
    Left = 14
    Top = 205
    Width = 277
    Height = 223
    Color = clGreen
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object Label4: TLabel
      Left = 37
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
      Left = 152
      Top = 10
      Width = 36
      Height = 16
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 78
      Top = 60
      Width = 67
      Height = 16
      Caption = 'VENDEDOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 88
      Top = 117
      Width = 49
      Height = 16
      Caption = 'CLIENTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 6
      Top = 27
      Width = 113
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 9
      Top = 80
      Width = 258
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 9
      Top = 139
      Width = 258
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object MaskEdit2: TMaskEdit
      Left = 123
      Top = 27
      Width = 120
      Height = 31
      Color = clSilver
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 3
      Text = '  /  /    '
    end
  end
  object GroupBox3: TGroupBox
    Left = 16
    Top = 493
    Width = 633
    Height = 93
    Color = clNavy
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object Label9: TLabel
      Left = 149
      Top = 12
      Width = 73
      Height = 16
      Caption = 'DESCRI'#199#194'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 422
      Top = 12
      Width = 42
      Height = 16
      Caption = 'QUANT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 520
      Top = 11
      Width = 67
      Height = 16
      Caption = 'CUST.UNIT.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit8: TEdit
      Left = 24
      Top = 32
      Width = 353
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit9: TEdit
      Left = 383
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
      OnExit = Edit9Exit
    end
    object Edit10: TEdit
      Left = 509
      Top = 30
      Width = 97
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object RichEdit3: TRichEdit
    Left = 297
    Top = 8
    Width = 648
    Height = 89
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 5
    Zoom = 100
  end
  object RichEdit1: TRichEdit
    Left = 297
    Top = 97
    Width = 418
    Height = 392
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 6
    Zoom = 100
  end
  object RichEdit2: TRichEdit
    Left = 718
    Top = 96
    Width = 227
    Height = 393
    Color = clMaroon
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 7
    Zoom = 100
  end
  object Button1: TButton
    Left = 660
    Top = 491
    Width = 285
    Height = 45
    Caption = 'CONFIRMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 660
    Top = 539
    Width = 285
    Height = 45
    Caption = 'RESTAURE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = Button2Click
  end
  object Edit7: TEdit
    Left = 19
    Top = 454
    Width = 121
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnExit = Edit7Exit
  end
  object IBTAuxdev: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 240
    Top = 440
    object IBTAuxdevPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxdevCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxdevQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      DisplayFormat = '###0.0'
    end
    object IBTAuxdevQTDRET: TIntegerField
      FieldName = 'QTDRET'
      DisplayFormat = '###0.0'
    end
    object IBTAuxdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdevPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdevQTDANT: TIntegerField
      FieldName = 'QTDANT'
      DisplayFormat = '##0.0'
    end
    object IBTAuxdevCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdevVENANT: TIBBCDField
      FieldName = 'VENANT'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdevOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object IBQAuxdev: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 168
    Top = 440
    object IBQAuxdevPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxdevCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxdevQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxdevQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxdevCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
end
