object FrmPerdido: TFrmPerdido
  Left = 30
  Top = 0
  Caption = 
    'SEARCH Informatica                                              ' +
    '                   TELA DE RESIDUO PERDIDO'
  ClientHeight = 596
  ClientWidth = 956
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -19
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 23
  object DBGrid1: TDBGrid
    Left = 348
    Top = 84
    Width = 589
    Height = 505
    Color = clMaroon
    DataSource = DtsAuxret
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
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
        Title.Caption = 'ARTG.'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 66
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'QTDSAI'
        Title.Caption = 'SAIDA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 58
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '              DESCRICAO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 241
        Visible = True
      end
      item
        Color = clNavy
        Expanded = False
        FieldName = 'QTDRET'
        Title.Caption = 'DEVOL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 58
        Visible = True
      end
      item
        Color = clTeal
        Expanded = False
        FieldName = 'QTDANT'
        Title.Caption = 'VEND'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 48
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'VENANT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '    VALOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 93
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 334
    Height = 77
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label7: TLabel
      Left = 205
      Top = 7
      Width = 76
      Height = 18
      Caption = 'RETORNO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 27
      Top = 8
      Width = 101
      Height = 18
      Caption = 'NUM.PEDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 192
      Top = 31
      Width = 109
      Height = 31
      Ctl3D = True
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      Text = '  /  /    '
      OnExit = MaskEdit1Exit
    end
    object Edit4: TEdit
      Left = 17
      Top = 28
      Width = 121
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit4Exit
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 88
    Width = 334
    Height = 451
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label3: TLabel
      Left = 14
      Top = 36
      Width = 125
      Height = 18
      Caption = 'TOTAL VENDIDO'
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object Label4: TLabel
      Left = 17
      Top = 118
      Width = 96
      Height = 18
      Caption = 'TOTAL PAGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 14
      Top = 186
      Width = 113
      Height = 18
      Caption = 'RESIDO ATUAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 32
      Top = 240
      Width = 63
      Height = 23
      Caption = 'Label2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 145
      Top = 21
      Width = 181
      Height = 60
      Alignment = taRightJustify
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -43
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
    end
    object Edit3: TEdit
      Left = 145
      Top = 87
      Width = 181
      Height = 60
      Alignment = taRightJustify
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -43
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit5: TEdit
      Left = 145
      Top = 153
      Width = 181
      Height = 62
      Alignment = taRightJustify
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -45
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object RichEdit2: TRichEdit
      Left = 14
      Top = 272
      Width = 312
      Height = 171
      Color = clMaroon
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Zoom = 100
    end
  end
  object Button1: TButton
    Left = 8
    Top = 545
    Width = 169
    Height = 47
    Caption = 'FECHA'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 183
    Top = 544
    Width = 159
    Height = 44
    Caption = 'RESTAURAR'
    TabOrder = 3
    OnClick = Button2Click
  end
  object RichEdit1: TRichEdit
    Left = 348
    Top = 8
    Width = 589
    Height = 70
    Color = clYellow
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      ''
      '')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object IBQPesqret: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 472
    Top = 536
    object IBQPesqretPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesqretCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesqretDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQPesqretQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '##0.0'
    end
    object IBQPesqretQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '##0.0'
    end
    object IBQPesqretPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesqretPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesqretQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '##0.0'
    end
    object IBQPesqretCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesqretVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesqretOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
  object IBQAuxret: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 608
    Top = 536
    object IBQAuxretPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxretCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxretDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxretQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '##0.0'
    end
    object IBQAuxretQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '##0.0'
    end
    object IBQAuxretPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxretPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxretQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '##0.0'
    end
    object IBQAuxretCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxretVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxretOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
  object IBTAuxretorno: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 392
    Top = 536
    object IBTAuxretornoPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxretornoCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxretornoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxretornoQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
    end
    object IBTAuxretornoQTDRET: TIntegerField
      FieldName = 'QTDRET'
    end
    object IBTAuxretornoPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Precision = 18
      Size = 2
    end
    object IBTAuxretornoPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Precision = 18
      Size = 2
    end
    object IBTAuxretornoQTDANT: TIntegerField
      FieldName = 'QTDANT'
    end
    object IBTAuxretornoCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Precision = 18
      Size = 2
    end
    object IBTAuxretornoVENANT: TIBBCDField
      FieldName = 'VENANT'
      Precision = 18
      Size = 2
    end
    object IBTAuxretornoOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object DtsAuxret: TDataSource
    DataSet = IBQPesqret
    Left = 544
    Top = 536
  end
end
