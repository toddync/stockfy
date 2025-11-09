object FrmManutdev: TFrmManutdev
  Left = 15
  Top = 15
  Caption = 
    '                                                                ' +
    '                                                 MANUTEN'#199#195'O DE D' +
    'EVOLU'#199#213'ES'
  ClientHeight = 602
  ClientWidth = 992
  Color = clTeal
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 176
    Top = 85
    Width = 793
    Height = 498
    DataSource = DModRosa.DsPesq_dev
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Color = clYellow
        Expanded = False
        FieldName = 'DATNOT'
        Title.Caption = 'DATA NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 112
        Visible = True
      end
      item
        Color = clNavy
        Expanded = False
        FieldName = 'NUMNOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'NUM.NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 104
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'VALNOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'VAL.NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 105
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'CLIENOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '       CLIENTE DA NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 350
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'ROMNOT'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'PEDIDO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 100
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 17
    Top = 83
    Width = 146
    Height = 500
    Color = clGray
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    object Label3: TLabel
      Left = 16
      Top = 325
      Width = 109
      Height = 19
      Caption = 'EMIS.GERAIS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 24
      Top = 20
      Width = 100
      Height = 19
      Caption = 'OPERA'#199#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 16
      Top = 44
      Width = 113
      Height = 41
      Caption = 'IMPLANTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 16
      Top = 85
      Width = 113
      Height = 41
      Caption = 'ALTERAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 16
      Top = 126
      Width = 113
      Height = 41
      Caption = 'CONSULTAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 16
      Top = 168
      Width = 113
      Height = 41
      Caption = 'EXCLUIR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button4Click
    end
    object Button10: TButton
      Left = 16
      Top = 350
      Width = 113
      Height = 41
      Caption = 'REL.DEVOL.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button10Click
    end
  end
  object Panel1: TPanel
    Left = 17
    Top = 6
    Width = 952
    Height = 73
    Caption = 
      '                                                                ' +
      '                                  '
    Color = clGray
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 0
    object Label1: TLabel
      Left = 16
      Top = 27
      Width = 96
      Height = 19
      Caption = 'PESQUIZAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 296
      Top = 27
      Width = 92
      Height = 19
      Caption = 'CONTEUDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox1: TComboBox
      Left = 128
      Top = 24
      Width = 122
      Height = 31
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'CODIGO'
        'NOME'
        'ROTA')
    end
    object Edit1: TEdit
      Left = 402
      Top = 24
      Width = 375
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
      Left = 808
      Top = 24
      Width = 121
      Height = 27
      Color = clTeal
      TabOrder = 2
    end
  end
  object IBTAuxdev: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXPEDIDO'
    UniDirectional = False
    Left = 408
    Top = 437
  end
  object IBTAuxitdev: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 264
    Top = 437
  end
  object IBQAuxdev: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXPEDIDO')
    Left = 336
    Top = 437
    object IBQAuxdevPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxdevCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"AUXPEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQAuxdevCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXPEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQAuxdevNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXPEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQAuxdevENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"AUXPEDIDO"."ENDCLI"'
      Size = 40
    end
    object IBQAuxdevBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"AUXPEDIDO"."BAICLI"'
    end
    object IBQAuxdevCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"AUXPEDIDO"."CIDCLI"'
    end
    object IBQAuxdevESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Origin = '"AUXPEDIDO"."ESTCLI"'
      Size = 2
    end
    object IBQAuxdevBASE: TDateField
      FieldName = 'BASE'
      Origin = '"AUXPEDIDO"."BASE"'
    end
    object IBQAuxdevRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"AUXPEDIDO"."RECOL"'
    end
    object IBQAuxdevCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"AUXPEDIDO"."COBRAN"'
    end
    object IBQAuxdevTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"AUXPEDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXPEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQAuxdevDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"AUXPEDIDO"."DATPED"'
      Size = 10
    end
    object IBQAuxdevSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"AUXPEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQAuxdevRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"AUXPEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQAuxdevTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"AUXPEDIDO"."TOTVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXPEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQAuxdevVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"AUXPEDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"AUXPEDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdevCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"AUXPEDIDO"."COB"'
      Size = 1
    end
    object IBQAuxdevLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"AUXPEDIDO"."LIMITE"'
      Size = 10
    end
  end
  object IBQAuxitdev: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 192
    Top = 437
    object IBQAuxitdevPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxitdevCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxitdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitdevQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '###0'
    end
    object IBQAuxitdevQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '###0'
    end
    object IBQAuxitdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdevPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdevQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '###0'
    end
    object IBQAuxitdevCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdevVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdevOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
end
