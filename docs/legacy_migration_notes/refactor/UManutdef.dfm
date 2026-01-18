object FrmManutdef: TFrmManutdef
  Left = 0
  Top = 15
  Caption = 
    '                                                                ' +
    '                                                 MANUTEN'#199#195'O DE D' +
    'EFEITOS'
  ClientHeight = 597
  ClientWidth = 1005
  Color = clOlive
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
  object DBGrid1: TDBGrid
    Left = 176
    Top = 85
    Width = 785
    Height = 492
    DataSource = DModRosa.DsPesq_def
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
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
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = 'DATA DA NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 134
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
        Title.Caption = '  NUM.NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 111
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
        Title.Caption = 'VALOR DA NOTA'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 135
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 85
    Width = 162
    Height = 492
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
      Left = 17
      Top = 345
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
      Left = 17
      Top = 45
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
      Top = 368
      Width = 113
      Height = 41
      Caption = 'REL.DEFEIT.'
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
    Left = 8
    Top = 6
    Width = 953
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
      Left = 272
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
      Height = 27
      CharCase = ecUpperCase
      TabOrder = 0
      Items.Strings = (
        'NUMNOT')
    end
    object Edit1: TEdit
      Left = 370
      Top = 24
      Width = 297
      Height = 27
      TabOrder = 1
      OnExit = Edit1Exit
    end
    object Edit2: TEdit
      Left = 673
      Top = 24
      Width = 121
      Height = 27
      Color = clOlive
      TabOrder = 2
    end
  end
  object IBTAuxdef: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXPEDIDO'
    UniDirectional = False
    Left = 184
    Top = 461
  end
  object IBTAuxitdef: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 248
    Top = 461
  end
  object IBQAuxdef: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXPEDIDO')
    Left = 312
    Top = 461
    object IBQAuxdefPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxdefCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"AUXPEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQAuxdefCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXPEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQAuxdefNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXPEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQAuxdefENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"AUXPEDIDO"."ENDCLI"'
      Size = 40
    end
    object IBQAuxdefBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"AUXPEDIDO"."BAICLI"'
    end
    object IBQAuxdefCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"AUXPEDIDO"."CIDCLI"'
    end
    object IBQAuxdefESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Origin = '"AUXPEDIDO"."ESTCLI"'
      Size = 2
    end
    object IBQAuxdefBASE: TDateField
      FieldName = 'BASE'
      Origin = '"AUXPEDIDO"."BASE"'
    end
    object IBQAuxdefRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"AUXPEDIDO"."RECOL"'
    end
    object IBQAuxdefCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"AUXPEDIDO"."COBRAN"'
    end
    object IBQAuxdefTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"AUXPEDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXPEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQAuxdefDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"AUXPEDIDO"."DATPED"'
      Size = 10
    end
    object IBQAuxdefSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"AUXPEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQAuxdefRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"AUXPEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQAuxdefTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"AUXPEDIDO"."TOTVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXPEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQAuxdefVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"AUXPEDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"AUXPEDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxdefCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"AUXPEDIDO"."COB"'
      Size = 1
    end
    object IBQAuxdefLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"AUXPEDIDO"."LIMITE"'
      Size = 10
    end
  end
  object IBQAuxitdef: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 376
    Top = 460
    object IBQAuxitdefPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITENS"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxitdefCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITENS"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxitdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITENS"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitdefQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"AUXITENS"."QTDSAI"'
      DisplayFormat = '###0'
    end
    object IBQAuxitdefQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"AUXITENS"."QTDRET"'
      DisplayFormat = '###0'
    end
    object IBQAuxitdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"AUXITENS"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdefPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"AUXITENS"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdefQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITENS"."QTDANT"'
      DisplayFormat = '###0'
    end
    object IBQAuxitdefCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITENS"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdefVENANT: TIBBCDField
      FieldName = 'VENANT'
      Origin = '"AUXITENS"."VENANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitdefOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
end
