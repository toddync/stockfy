object FrmPedido: TFrmPedido
  Left = 15
  Top = 15
  Caption = 
    'SEARCH Informatica                                              ' +
    '  TELA DE PEDIDO DE ARTIGOS'
  ClientHeight = 598
  ClientWidth = 994
  Color = clBlack
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
  object Label1: TLabel
    Left = 222
    Top = 3
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
  object Label2: TLabel
    Left = 40
    Top = 3
    Width = 84
    Height = 18
    Caption = 'OPERA'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 20
    Top = 72
    Width = 47
    Height = 18
    Caption = 'VEND.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 161
    Top = 67
    Width = 162
    Height = 18
    Caption = 'NOME DO VENDEDOR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 17
    Top = 229
    Width = 64
    Height = 18
    Caption = 'CLI.[F2]'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 174
    Top = 228
    Width = 142
    Height = 18
    Caption = 'NOME DO CLIENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label12: TLabel
    Left = 161
    Top = 132
    Width = 141
    Height = 18
    Caption = 'DATAS DO PEDIDO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object DBGrid1: TDBGrid
    Left = 489
    Top = 2
    Width = 497
    Height = 588
    Color = clYellow
    DataSource = DsAuxitpedido
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick]
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clRed
        Expanded = False
        FieldName = 'CODART'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'COD'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 66
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = '               DESCRICAO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 322
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'QTDSAI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -24
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = '  QTDSAI'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -15
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 81
        Visible = True
      end>
  end
  object DBGrid2: TDBGrid
    Left = 489
    Top = 4
    Width = 497
    Height = 585
    Color = clGray
    DataSource = DModRosa.DsPesq_cli
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -19
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    OnDblClick = DBGrid2DblClick
    Columns = <
      item
        Color = clYellow
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = '                       NOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 380
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'IDCLI'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = ' IDCLI'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end>
  end
  object Edit1: TEdit
    Left = 210
    Top = 22
    Width = 129
    Height = 35
    Color = clGreen
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 6
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit6: TEdit
    Left = 8
    Top = 22
    Width = 168
    Height = 35
    Color = clMaroon
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
  end
  object Edit3: TEdit
    Left = 81
    Top = 91
    Width = 402
    Height = 33
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
  end
  object Edit4: TEdit
    Left = 10
    Top = 248
    Width = 81
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 4
    ParentFont = False
    TabOrder = 3
    OnExit = Edit4Exit
    OnKeyDown = Edit4KeyDown
  end
  object Edit5: TEdit
    Left = 97
    Top = 248
    Width = 386
    Height = 33
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 11
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 155
    Width = 473
    Height = 66
    Color = clGreen
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 2
    object Label7: TLabel
      Left = 24
      Top = 7
      Width = 71
      Height = 18
      Caption = 'EMISS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 131
      Top = 7
      Width = 94
      Height = 18
      Caption = 'DEVOLU'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 239
      Top = 7
      Width = 103
      Height = 18
      Caption = 'VENCIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 367
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
    object MaskEdit1: TMaskEdit
      Left = 354
      Top = 26
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
      TabOrder = 3
      Text = '  /  /    '
    end
    object MaskEdit2: TMaskEdit
      Left = 9
      Top = 26
      Width = 109
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
      OnExit = MaskEdit2Exit
    end
    object MaskEdit3: TMaskEdit
      Left = 123
      Top = 26
      Width = 109
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
      OnExit = MaskEdit3Exit
    end
    object MaskEdit4: TMaskEdit
      Left = 238
      Top = 26
      Width = 108
      Height = 31
      EditMask = '99/99/9999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 10
      ParentFont = False
      TabOrder = 2
      Text = '  /  /    '
      OnExit = MaskEdit4Exit
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 285
    Width = 475
    Height = 268
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 4
    object Label13: TLabel
      Left = 20
      Top = 4
      Width = 66
      Height = 18
      Caption = 'COD[F3]'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 202
      Top = 5
      Width = 90
      Height = 18
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 17
      Top = 66
      Width = 59
      Height = 18
      Caption = 'QUANT.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 97
      Top = 68
      Width = 52
      Height = 18
      Caption = 'CUSTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 178
      Top = 68
      Width = 52
      Height = 18
      Caption = 'VENDA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 39
      Top = 130
      Width = 141
      Height = 18
      Caption = 'ULTIMO PRODUTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 314
      Top = 2
      Width = 142
      Height = 19
      Caption = 'F5 extorna artigo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit7: TEdit
      Left = 12
      Top = 23
      Width = 81
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      OnExit = Edit7Exit
      OnKeyDown = Edit7KeyDown
    end
    object Edit10: TEdit
      Left = 82
      Top = 87
      Width = 81
      Height = 37
      Alignment = taRightJustify
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit11: TEdit
      Left = 166
      Top = 86
      Width = 80
      Height = 37
      Alignment = taRightJustify
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object GroupBox3: TGroupBox
      Left = 12
      Top = 149
      Width = 233
      Height = 98
      Color = clGreen
      ParentBackground = False
      ParentColor = False
      TabOrder = 4
      object Label20: TLabel
        Left = 26
        Top = 6
        Width = 66
        Height = 19
        Caption = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 144
        Top = 6
        Width = 64
        Height = 19
        Caption = 'QUANT.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit12: TEdit
        Left = 7
        Top = 25
        Width = 110
        Height = 62
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -45
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Edit13: TEdit
        Left = 131
        Top = 25
        Width = 88
        Height = 62
        Alignment = taRightJustify
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -45
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
    object Edit9: TEdit
      Left = 12
      Top = 87
      Width = 68
      Height = 37
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit9Exit
    end
    object Edit8: TEdit
      Left = 99
      Top = 23
      Width = 359
      Height = 33
      Color = clYellow
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object GroupBox4: TGroupBox
      Left = 252
      Top = 62
      Width = 206
      Height = 195
      Color = clMaroon
      ParentBackground = False
      ParentColor = False
      TabOrder = 6
      object Label11: TLabel
        Left = 64
        Top = 8
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
      object Label19: TLabel
        Left = 44
        Top = 100
        Width = 131
        Height = 23
        Caption = 'QUANTIDADE'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Edit16: TEdit
        Left = 48
        Top = 129
        Width = 121
        Height = 56
        Alignment = taRightJustify
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Edit15: TEdit
        Left = 48
        Top = 37
        Width = 121
        Height = 56
        Alignment = taRightJustify
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -40
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  object Edit2: TEdit
    Left = 8
    Top = 90
    Width = 70
    Height = 33
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    MaxLength = 3
    ParentFont = False
    TabOrder = 1
    OnExit = Edit2Exit
  end
  object Button1: TButton
    Left = 9
    Top = 559
    Width = 237
    Height = 35
    Caption = 'CONFIRMAR'
    TabOrder = 7
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 245
    Top = 559
    Width = 237
    Height = 35
    Caption = 'RESTAURAR'
    TabOrder = 8
    OnClick = Button2Click
  end
  object Edit14: TEdit
    Left = 389
    Top = 22
    Width = 54
    Height = 37
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 12
  end
  object IBTAuxitpedido: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 528
    Top = 464
    object IBTAuxitpedidoPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxitpedidoCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxitpedidoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxitpedidoQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      DisplayFormat = '###0'
    end
    object IBTAuxitpedidoQTDRET: TIntegerField
      FieldName = 'QTDRET'
      DisplayFormat = '###0'
    end
    object IBTAuxitpedidoPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxitpedidoPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxitpedidoQTDANT: TIntegerField
      FieldName = 'QTDANT'
      DisplayFormat = '###0'
    end
    object IBTAuxitpedidoCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTAuxitpedidoVENANT: TIBBCDField
      FieldName = 'VENANT'
      Precision = 18
      Size = 2
    end
    object IBTAuxitpedidoOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object IBQAuxitpedido: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 615
    Top = 465
    object IBQAuxitpedidoPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxitpedidoCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxitpedidoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitpedidoQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '###0'
    end
    object IBQAuxitpedidoQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '###0'
    end
    object IBQAuxitpedidoPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedidoPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedidoQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '###0'
    end
    object IBQAuxitpedidoCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedidoVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedidoOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
  object IBQAuxitped: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 695
    Top = 464
    object IBQAuxitpedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxitpedCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxitpedDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitpedQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '###0'
    end
    object IBQAuxitpedQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '###0'
    end
    object IBQAuxitpedPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '###0'
    end
    object IBQAuxitpedCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
  object DsAuxitpedido: TDataSource
    DataSet = IBQAuxitped
    Left = 780
    Top = 464
  end
end
