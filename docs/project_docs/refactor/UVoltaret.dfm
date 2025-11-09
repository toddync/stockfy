object FrmVoltaret: TFrmVoltaret
  Left = 0
  Top = 0
  Caption = '                 DESFAZ RETORNO'
  ClientHeight = 646
  ClientWidth = 1003
  Color = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindow
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 719
    Top = 127
    Width = 64
    Height = 19
    Caption = 'PEDIDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 719
    Top = 178
    Width = 81
    Height = 19
    Caption = 'RETORNO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 693
    Top = 246
    Width = 181
    Height = 19
    Caption = 'OPERA'#199#195'O (D,R ou V)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 719
    Top = 77
    Width = 56
    Height = 19
    Caption = 'SENHA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 66
    Width = 657
    Height = 566
    DataSource = DTSAuxret
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 3
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clGreen
        Expanded = False
        FieldName = 'CODART'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = ' ART'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 54
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = '          DESCRICAO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 297
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'QTDSAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = ' SAIU'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 63
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'QTDRET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '  RET'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 63
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'QTDANT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = ' VEND'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 62
        Visible = True
      end
      item
        Color = clNavy
        Expanded = False
        FieldName = 'VENANT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '  VALOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 97
        Visible = True
      end>
  end
  object Button1: TButton
    Left = 671
    Top = 8
    Width = 324
    Height = 54
    Caption = 'RESTAURAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 880
    Top = 235
    Width = 100
    Height = 37
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Edit4: TEdit
    Left = 820
    Top = 116
    Width = 160
    Height = 37
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnExit = Edit4Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 820
    Top = 167
    Width = 160
    Height = 37
    EditMask = '99/99/9999'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNone
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 5
    Text = '  /  /    '
  end
  object RichEdit1: TRichEdit
    Left = 6
    Top = 8
    Width = 657
    Height = 54
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 6
    Zoom = 100
  end
  object RichEdit2: TRichEdit
    Left = 693
    Top = 309
    Width = 290
    Height = 323
    Font.Charset = ANSI_CHARSET
    Font.Color = clNone
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    Zoom = 100
  end
  object Edit2: TEdit
    Left = 859
    Top = 71
    Width = 121
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNone
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    PasswordChar = '*'
    TabOrder = 0
    OnExit = Edit2Exit
  end
  object IBTAuxretorno: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 325
    Top = 569
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
      DisplayFormat = '###0'
    end
    object IBTAuxretornoQTDRET: TIntegerField
      FieldName = 'QTDRET'
      DisplayFormat = '###0'
    end
    object IBTAuxretornoPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxretornoPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      DisplayFormat = '##,##0.00'
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
  object IBQPesqret: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 562
    Top = 570
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
      DisplayFormat = '##0'
    end
    object IBQPesqretQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '##0'
    end
    object IBQPesqretPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.000'
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
      DisplayFormat = '##0'
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
    Left = 479
    Top = 570
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
      DisplayFormat = '##0'
    end
    object IBQAuxretQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '##0'
    end
    object IBQAuxretPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.000'
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
      DisplayFormat = '##0'
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
  object DTSAuxret: TDataSource
    DataSet = IBQPesqret
    Left = 408
    Top = 570
  end
end
