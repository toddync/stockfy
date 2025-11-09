object FrmDefeito: TFrmDefeito
  Left = 0
  Top = 15
  Caption = 
    'SEARCH INFORMATICA                                              ' +
    '                                              '
  ClientHeight = 595
  ClientWidth = 1005
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
    Left = 798
    Top = 8
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
  object Label5: TLabel
    Left = 399
    Top = 29
    Width = 160
    Height = 19
    Caption = 'NOTA DE DEFEITOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 781
    Top = 28
    Width = 138
    Height = 31
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
  end
  object GroupBox1: TGroupBox
    Left = 21
    Top = 8
    Width = 249
    Height = 72
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
    object Label2: TLabel
      Left = 32
      Top = 2
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
      Left = 128
      Top = 2
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
      Left = 16
      Top = 20
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
      Left = 111
      Top = 20
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
  object GroupBox3: TGroupBox
    Left = 21
    Top = 498
    Width = 662
    Height = 81
    Color = clTeal
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Label9: TLabel
      Left = 240
      Top = 8
      Width = 97
      Height = 19
      Caption = 'DESCRI'#199#194'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 455
      Top = 8
      Width = 59
      Height = 19
      Caption = 'QUANT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 548
      Top = 8
      Width = 96
      Height = 19
      Caption = 'CUST.UNIT.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 40
      Top = 8
      Width = 61
      Height = 19
      Caption = 'CIDIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit8: TEdit
      Left = 132
      Top = 33
      Width = 305
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
      Left = 443
      Top = 33
      Width = 99
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit10: TEdit
      Left = 548
      Top = 33
      Width = 97
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnExit = Edit10Exit
    end
    object Edit7: TEdit
      Left = 16
      Top = 33
      Width = 110
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit7Exit
    end
  end
  object RichEdit3: TRichEdit
    Left = 20
    Top = 81
    Width = 928
    Height = 84
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 6
    Zoom = 100
  end
  object RichEdit1: TRichEdit
    Left = 21
    Top = 163
    Width = 660
    Height = 329
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object RichEdit2: TRichEdit
    Left = 687
    Top = 164
    Width = 260
    Height = 333
    Color = clMaroon
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
  object Button1: TButton
    Left = 687
    Top = 498
    Width = 260
    Height = 42
    Caption = 'CONFIRMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 687
    Top = 539
    Width = 260
    Height = 42
    Caption = 'RESTAURE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button2Click
  end
  object IBTAuxdef: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 728
    Top = 24
    object IBTAuxdefPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxdefCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxdefQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      DisplayFormat = '###0.0'
    end
    object IBTAuxdefQTDRET: TIntegerField
      FieldName = 'QTDRET'
      DisplayFormat = '###0.0'
    end
    object IBTAuxdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdefPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdefQTDANT: TIntegerField
      FieldName = 'QTDANT'
      DisplayFormat = '##0.0'
    end
    object IBTAuxdefCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdefVENANT: TIBBCDField
      FieldName = 'VENANT'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxdefOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object IBQAuxdef: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 608
    Top = 24
    object IBQAuxdefPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxdefCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxdefQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxdefQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxdefCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
end
