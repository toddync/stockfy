object FrmManutped: TFrmManutped
  Left = 0
  Top = 15
  Caption = 
    '                                                                ' +
    '                                                 MANUTEN'#199#195'O DE P' +
    'EDIDOS'
  ClientHeight = 608
  ClientWidth = 988
  Color = clGreen
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
    Left = 151
    Top = 87
    Width = 827
    Height = 506
    DataSource = DModRosa.DsPesq_ped
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
        FieldName = 'PEDIDO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'BASE'
        Title.Caption = 'EMISSAO'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 109
        Visible = True
      end
      item
        Color = clMoneyGreen
        Expanded = False
        FieldName = 'CODCLI'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Visible = True
      end
      item
        Color = clSilver
        Expanded = False
        FieldName = 'NOMCLI'
        Title.Caption = '       NOME DO CLIENTE'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 299
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'TOTPED'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 98
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'SITU'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 53
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'CODVEN'
        Title.Caption = 'VEND'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 56
        Visible = True
      end>
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 137
    Height = 585
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
      Left = 24
      Top = 432
      Width = 83
      Height = 19
      Caption = 'EMISS'#213'ES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 31
      Top = 54
      Width = 74
      Height = 19
      Caption = 'PEDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 25
      Top = 331
      Width = 75
      Height = 19
      Caption = 'RESIDUO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 27
      Top = 230
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
    object Button1: TButton
      Left = 6
      Top = 73
      Width = 122
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
      Left = 6
      Top = 112
      Width = 122
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
      Left = 6
      Top = 148
      Width = 122
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
      Left = 6
      Top = 186
      Width = 122
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
    object Button5: TButton
      Left = 6
      Top = 249
      Width = 122
      Height = 41
      Caption = 'RET/DEV/VEN'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button5Click
    end
    object Button6: TButton
      Left = 6
      Top = 349
      Width = 122
      Height = 41
      Caption = 'BAIXAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 6
      Top = 389
      Width = 122
      Height = 41
      Caption = 'PERDIDO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 6
      Top = 451
      Width = 122
      Height = 41
      Caption = 'PED.RETOR.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button8Click
    end
    object Button9: TButton
      Left = 6
      Top = 490
      Width = 122
      Height = 41
      Caption = 'ETIQUETA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button9Click
    end
    object Button10: TButton
      Left = 6
      Top = 528
      Width = 122
      Height = 41
      Caption = 'PED./FAIXA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = Button10Click
    end
    object Button12: TButton
      Left = 12
      Top = 11
      Width = 113
      Height = 41
      Caption = 'CRIA ETIQ'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      OnClick = Button12Click
    end
    object Button11: TButton
      Left = 6
      Top = 289
      Width = 122
      Height = 41
      Caption = 'DESFAZ RET'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 11
      OnClick = Button11Click
    end
  end
  object Panel1: TPanel
    Left = 151
    Top = 8
    Width = 824
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
      Left = 15
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
      Left = 247
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
      Left = 117
      Top = 24
      Width = 108
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
      Left = 353
      Top = 23
      Width = 376
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
      Left = 744
      Top = 24
      Width = 56
      Height = 27
      Color = clGreen
      TabOrder = 2
    end
  end
  object IBQuery1: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CADLOGIN')
    Left = 424
    Top = 521
  end
  object IBTAuxped: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXPEDIDO'
    UniDirectional = False
    Left = 176
    Top = 520
  end
  object IBQAuxped: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXPEDIDO')
    Left = 240
    Top = 520
    object IBQAuxpedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxpedCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"AUXPEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQAuxpedCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXPEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQAuxpedNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXPEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQAuxpedENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"AUXPEDIDO"."ENDCLI"'
      Size = 40
    end
    object IBQAuxpedBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"AUXPEDIDO"."BAICLI"'
    end
    object IBQAuxpedCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"AUXPEDIDO"."CIDCLI"'
    end
    object IBQAuxpedESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Origin = '"AUXPEDIDO"."ESTCLI"'
      Size = 2
    end
    object IBQAuxpedBASE: TDateField
      FieldName = 'BASE'
      Origin = '"AUXPEDIDO"."BASE"'
    end
    object IBQAuxpedRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"AUXPEDIDO"."RECOL"'
    end
    object IBQAuxpedCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"AUXPEDIDO"."COBRAN"'
    end
    object IBQAuxpedTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"AUXPEDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxpedSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXPEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQAuxpedDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"AUXPEDIDO"."DATPED"'
      Size = 10
    end
    object IBQAuxpedSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"AUXPEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQAuxpedTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"AUXPEDIDO"."TOTVEN"'
      Precision = 18
      Size = 2
    end
    object IBQAuxpedRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"AUXPEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQAuxpedDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXPEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQAuxpedVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"AUXPEDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxpedRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"AUXPEDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxpedCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"AUXPEDIDO"."COB"'
      Size = 1
    end
    object IBQAuxpedLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"AUXPEDIDO"."LIMITE"'
      Size = 10
    end
  end
  object IBTAuxitped: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITENS'
    UniDirectional = False
    Left = 304
    Top = 520
  end
  object IBQAuxitped: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITENS')
    Left = 368
    Top = 520
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
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitpedOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITENS"."OPER"'
      Size = 1
    end
  end
end
