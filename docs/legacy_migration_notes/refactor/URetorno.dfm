object FrmRetorno: TFrmRetorno
  Left = 0
  Top = 0
  Caption = '                  MANUTEN'#199#195'O DO RETORNO DE ARTIGO NO PEDIDO'
  ClientHeight = 648
  ClientWidth = 1003
  Color = clBlack
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
    Left = 881
    Top = 59
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
    Left = 872
    Top = 142
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
    Left = 845
    Top = 389
    Width = 121
    Height = 19
    Caption = 'OP. (D/V ou R)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 829
    Top = 476
    Width = 52
    Height = 19
    Caption = 'PROD.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 864
    Top = 560
    Width = 96
    Height = 19
    Caption = 'DEVOLVIDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 864
    Top = 281
    Width = 93
    Height = 19
    Caption = 'TOT.DEVOL'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label11: TLabel
    Left = 667
    Top = 607
    Width = 48
    Height = 23
    Caption = 'SAIU'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 8
    Top = 9
    Width = 809
    Height = 580
    DataSource = DTSAuxret
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    OnDblClick = DBGrid1DblClick
    OnExit = DBGrid1Exit
    Columns = <
      item
        Color = clGreen
        Expanded = False
        FieldName = 'CODART'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = ' ART'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '          DESCRICAO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 376
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'QTDSAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = ' SAIU'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 65
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'QTDRET'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '  RET'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 73
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'QTDANT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = ' VEND'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 80
        Visible = True
      end
      item
        Color = clNavy
        Expanded = False
        FieldName = 'VENANT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -27
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '  VALOR'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 121
        Visible = True
      end>
  end
  object Edit8: TEdit
    Left = 8
    Top = 592
    Width = 649
    Height = 43
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenu
    Font.Height = -29
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
  end
  object Button1: TButton
    Left = 829
    Top = 8
    Width = 160
    Height = 44
    Caption = 'RESTAURAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 829
    Top = 415
    Width = 160
    Height = 41
    Color = clRed
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnExit = Edit1Exit
  end
  object Edit4: TEdit
    Left = 829
    Top = 84
    Width = 160
    Height = 41
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    OnExit = Edit4Exit
  end
  object Edit7: TEdit
    Left = 835
    Top = 501
    Width = 160
    Height = 53
    Color = clMoneyGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNone
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 4
    ParentFont = False
    TabOrder = 2
    OnExit = Edit7Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 829
    Top = 170
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
    TabOrder = 7
    Text = '  /  /    '
  end
  object RichEdit1: TRichEdit
    Left = 8
    Top = 8
    Width = 809
    Height = 78
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 8
    Zoom = 100
  end
  object Edit3: TEdit
    Left = 722
    Top = 592
    Width = 94
    Height = 47
    Alignment = taRightJustify
    Color = clNavy
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
  end
  object Edit5: TEdit
    Left = 829
    Top = 582
    Width = 160
    Height = 53
    Alignment = taRightJustify
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenu
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnExit = Edit5Exit
  end
  object GroupBox1: TGroupBox
    Left = 484
    Top = 178
    Width = 324
    Height = 407
    Color = clMaroon
    ParentBackground = False
    ParentColor = False
    TabOrder = 10
    object Label7: TLabel
      Left = 24
      Top = 32
      Width = 89
      Height = 23
      Caption = 'ARTIGOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 24
      Top = 96
      Width = 61
      Height = 23
      Caption = 'SAIDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 24
      Top = 224
      Width = 97
      Height = 23
      Caption = 'RETORNO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 24
      Top = 303
      Width = 92
      Height = 23
      Caption = 'VENDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 176
      Top = 16
      Width = 129
      Height = 47
      Alignment = taRightJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Edit6: TEdit
      Left = 176
      Top = 80
      Width = 121
      Height = 47
      Alignment = taRightJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Edit9: TEdit
      Left = 144
      Top = 133
      Width = 160
      Height = 47
      Alignment = taRightJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Edit10: TEdit
      Left = 184
      Top = 208
      Width = 121
      Height = 47
      Alignment = taRightJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
    end
    object Edit12: TEdit
      Left = 144
      Top = 341
      Width = 159
      Height = 47
      Alignment = taRightJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object Edit13: TEdit
      Left = 184
      Top = 287
      Width = 120
      Height = 47
      Alignment = taRightJustify
      Color = clBlack
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
  end
  object Edit11: TEdit
    Left = 823
    Top = 309
    Width = 160
    Height = 62
    Alignment = taRightJustify
    Color = clNone
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clMenu
    Font.Height = -45
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
  end
  object Button2: TButton
    Left = 829
    Top = 222
    Width = 160
    Height = 47
    Caption = 'FECHA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 891
    Top = 470
    Width = 38
    Height = 25
    Caption = 'QTD'
    TabOrder = 13
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 945
    Top = 470
    Width = 38
    Height = 25
    Caption = 'TOT'
    TabOrder = 14
    OnClick = Button4Click
  end
  object IBTAuxretorno: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 85
    Top = 521
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
    Left = 319
    Top = 522
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
    Left = 243
    Top = 522
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
    Left = 168
    Top = 528
  end
end
