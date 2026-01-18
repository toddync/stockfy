object FrmRelmapa: TFrmRelmapa
  Left = 163
  Top = 137
  Caption = 'SEARCH Informatica'
  ClientHeight = 452
  ClientWidth = 707
  Color = clBtnFace
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
    Left = 80
    Top = 4
    Width = 522
    Height = 19
    Caption = ' MOVIMENTA'#199#195'O DE COMPRA/VENDA  DO VENDEDOR/CLIENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 29
    Width = 691
    Height = 244
    Caption = 'VENDEDOR'
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
    object Label2: TLabel
      Left = 98
      Top = 9
      Width = 48
      Height = 16
      Caption = 'CODIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 167
      Top = 9
      Width = 45
      Height = 16
      Caption = 'PRA'#199'A'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 245
      Top = 9
      Width = 70
      Height = 16
      Caption = 'DAT.INICIO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 372
      Top = 9
      Width = 66
      Height = 16
      Caption = 'DAT.FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 14
      Top = 25
      Width = 65
      Height = 48
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Edit3: TEdit
      Left = 94
      Top = 25
      Width = 63
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit3Exit
    end
    object Edit6: TEdit
      Left = 157
      Top = 25
      Width = 69
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit6Exit
    end
    object MaskEdit1: TMaskEdit
      Left = 228
      Top = 25
      Width = 120
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
    end
    object MaskEdit2: TMaskEdit
      Left = 350
      Top = 25
      Width = 120
      Height = 31
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
    object Edit7: TEdit
      Left = 92
      Top = 57
      Width = 379
      Height = 31
      Color = clMaroon
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 10
    end
    object Button1: TButton
      Left = 93
      Top = 89
      Width = 185
      Height = 40
      Caption = 'REL. DE PEDIDOS (E,X,R)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 284
      Top = 89
      Width = 185
      Height = 40
      Caption = 'PEDIDOS COM RESIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 476
      Top = 89
      Width = 185
      Height = 40
      Caption = 'COBRAN'#199'AS EFETUADAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 284
      Top = 135
      Width = 185
      Height = 40
      Caption = 'MOVIMENTA'#199#195'O GERAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 93
      Top = 135
      Width = 185
      Height = 40
      Caption = 'RESIDOS PERDIDOS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
      OnClick = Button5Click
    end
    object Button8: TButton
      Left = 475
      Top = 135
      Width = 185
      Height = 40
      Caption = 'REL.PRODUTOS (E,X,R)'
      TabOrder = 11
      OnClick = Button8Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 272
    Width = 691
    Height = 172
    Caption = 'CLIENTE'
    Color = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
    object Label6: TLabel
      Left = 99
      Top = 9
      Width = 48
      Height = 16
      Caption = 'CODIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit2: TEdit
      Left = 23
      Top = 24
      Width = 65
      Height = 48
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -33
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Edit4: TEdit
      Left = 94
      Top = 25
      Width = 63
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      OnExit = Edit4Exit
    end
    object Button6: TButton
      Left = 94
      Top = 61
      Width = 185
      Height = 40
      Caption = 'EXTRATO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 286
      Top = 61
      Width = 185
      Height = 40
      Caption = 'VENDAS REALIZADAS'
      TabOrder = 2
      OnClick = Button7Click
    end
    object Edit5: TEdit
      Left = 163
      Top = 24
      Width = 309
      Height = 31
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
  end
  object IBTExtracli: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'EXTRATO'
    UniDirectional = False
    Left = 40
    Top = 104
    object IBTExtracliCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Required = True
      Size = 5
    end
    object IBTExtracliITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 5
    end
    object IBTExtracliPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Size = 6
    end
    object IBTExtracliEMISSAO: TIBStringField
      FieldName = 'EMISSAO'
      Size = 10
    end
    object IBTExtracliDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTExtracliVALSAIDA: TIBBCDField
      FieldName = 'VALSAIDA'
      Precision = 9
      Size = 2
    end
    object IBTExtracliRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTExtracliVALVEND: TIBBCDField
      FieldName = 'VALVEND'
      Precision = 18
      Size = 2
    end
    object IBTExtracliVALRESI: TIBBCDField
      FieldName = 'VALRESI'
      Precision = 18
      Size = 2
    end
    object IBTExtracliDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTExtracliSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTExtracliVENCTO: TIBStringField
      FieldName = 'VENCTO'
      Size = 10
    end
  end
  object IBQExtcli: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from EXTRATO')
    Left = 40
    Top = 155
  end
  object IBTAuxRelmerc: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXRELMAPA'
    UniDirectional = False
    Left = 425
    Top = 209
    object IBTAuxRelmercITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 5
    end
    object IBTAuxRelmercPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Size = 8
    end
    object IBTAuxRelmercCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Size = 4
    end
    object IBTAuxRelmercBASE: TIBStringField
      FieldName = 'BASE'
      Size = 10
    end
    object IBTAuxRelmercQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object IBTAuxRelmercPRECO: TIBBCDField
      FieldName = 'PRECO'
      Precision = 18
      Size = 2
    end
  end
  object IBQAuxRelmerc: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXRELMAPA')
    Left = 341
    Top = 210
    object IBQAuxRelmercITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXRELMAPA"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 5
    end
    object IBQAuxRelmercPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXRELMAPA"."PEDIDO"'
      Size = 8
    end
    object IBQAuxRelmercCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"AUXRELMAPA"."CODIGO"'
      Size = 4
    end
    object IBQAuxRelmercBASE: TIBStringField
      FieldName = 'BASE'
      Origin = '"AUXRELMAPA"."BASE"'
      Size = 10
    end
    object IBQAuxRelmercQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"AUXRELMAPA"."QUANT"'
    end
    object IBQAuxRelmercPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"AUXRELMAPA"."PRECO"'
      Precision = 18
      Size = 2
    end
  end
  object IBTAuxmapa: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXMAPA'
    UniDirectional = False
    Left = 43
    Top = 208
    object IBTAuxmapaCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxmapaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxmapaESTOQ: TIntegerField
      FieldName = 'ESTOQ'
    end
    object IBTAuxmapaCOMPRA: TIntegerField
      FieldName = 'COMPRA'
    end
    object IBTAuxmapaDEFEITO: TIntegerField
      FieldName = 'DEFEITO'
    end
    object IBTAuxmapaRETDEV: TIntegerField
      FieldName = 'RETDEV'
    end
    object IBTAuxmapaSAIDA: TIntegerField
      FieldName = 'SAIDA'
    end
    object IBTAuxmapaQTDFIS: TIntegerField
      FieldName = 'QTDFIS'
    end
    object IBTAuxmapaVALFIS: TIntegerField
      FieldName = 'VALFIS'
    end
    object IBTAuxmapaQTDSAC: TIntegerField
      FieldName = 'QTDSAC'
    end
    object IBTAuxmapaVALSAC: TIBBCDField
      FieldName = 'VALSAC'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaQTDREAL: TIntegerField
      FieldName = 'QTDREAL'
    end
    object IBTAuxmapaVALREAL: TIBBCDField
      FieldName = 'VALREAL'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaQTDVEN: TIntegerField
      FieldName = 'QTDVEN'
    end
    object IBTAuxmapaVALVEN: TIBBCDField
      FieldName = 'VALVEN'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapaMEDIA: TIntegerField
      FieldName = 'MEDIA'
    end
    object IBTAuxmapaAPURADO: TIntegerField
      FieldName = 'APURADO'
    end
    object IBTAuxmapaNASACOL: TIntegerField
      FieldName = 'NASACOL'
    end
  end
  object IBQAuxmapag: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from RELPEDIDO')
    Left = 506
    Top = 209
    object IBQAuxmapagITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"RELPEDIDO"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxmapagPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"RELPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxmapagCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"RELPEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQAuxmapagCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"RELPEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQAuxmapagNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"RELPEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQAuxmapagENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"RELPEDIDO"."ENDCLI"'
      Size = 40
    end
    object IBQAuxmapagBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"RELPEDIDO"."BAICLI"'
    end
    object IBQAuxmapagCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"RELPEDIDO"."CIDCLI"'
    end
    object IBQAuxmapagESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Origin = '"RELPEDIDO"."ESTCLI"'
      Size = 2
    end
    object IBQAuxmapagBASE: TIBStringField
      FieldName = 'BASE'
      Origin = '"RELPEDIDO"."BASE"'
      Size = 10
    end
    object IBQAuxmapagRECOL: TIBStringField
      FieldName = 'RECOL'
      Origin = '"RELPEDIDO"."RECOL"'
      Size = 10
    end
    object IBQAuxmapagCOBRAN: TIBStringField
      FieldName = 'COBRAN'
      Origin = '"RELPEDIDO"."COBRAN"'
      Size = 10
    end
    object IBQAuxmapagTOTPED: TIBStringField
      FieldName = 'TOTPED'
      Origin = '"RELPEDIDO"."TOTPED"'
      Size = 15
    end
    object IBQAuxmapagSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"RELPEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQAuxmapagDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"RELPEDIDO"."DATPED"'
      Size = 10
    end
    object IBQAuxmapagSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"RELPEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQAuxmapagRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"RELPEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQAuxmapagTOTVEN: TIBStringField
      FieldName = 'TOTVEN'
      Origin = '"RELPEDIDO"."TOTVEN"'
      Size = 15
    end
    object IBQAuxmapagDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"RELPEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQAuxmapagVALPAG: TIBStringField
      FieldName = 'VALPAG'
      Origin = '"RELPEDIDO"."VALPAG"'
      Size = 15
    end
    object IBQAuxmapagRESIDUO: TIBStringField
      FieldName = 'RESIDUO'
      Origin = '"RELPEDIDO"."RESIDUO"'
      Size = 15
    end
  end
  object IBQAuxmaped: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXPEDIDO')
    Left = 263
    Top = 211
    object IBQAuxmapedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxmapedCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"AUXPEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQAuxmapedCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXPEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQAuxmapedNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXPEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQAuxmapedENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"AUXPEDIDO"."ENDCLI"'
      Size = 40
    end
    object IBQAuxmapedBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"AUXPEDIDO"."BAICLI"'
    end
    object IBQAuxmapedCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"AUXPEDIDO"."CIDCLI"'
    end
    object IBQAuxmapedESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Origin = '"AUXPEDIDO"."ESTCLI"'
      Size = 2
    end
    object IBQAuxmapedBASE: TDateField
      FieldName = 'BASE'
      Origin = '"AUXPEDIDO"."BASE"'
    end
    object IBQAuxmapedRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"AUXPEDIDO"."RECOL"'
    end
    object IBQAuxmapedCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"AUXPEDIDO"."COBRAN"'
    end
    object IBQAuxmapedTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"AUXPEDIDO"."TOTPED"'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXPEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQAuxmapedDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"AUXPEDIDO"."DATPED"'
      Size = 10
    end
    object IBQAuxmapedSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"AUXPEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQAuxmapedRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"AUXPEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQAuxmapedTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"AUXPEDIDO"."TOTVEN"'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXPEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQAuxmapedVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"AUXPEDIDO"."VALPAG"'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"AUXPEDIDO"."RESIDUO"'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapedCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"AUXPEDIDO"."COB"'
      Size = 1
    end
    object IBQAuxmapedLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"AUXPEDIDO"."LIMITE"'
      Size = 10
    end
  end
  object IBTAuxmaped: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXPEDIDO'
    UniDirectional = False
    Left = 189
    Top = 210
    object IBTAuxmapedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxmapedCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTAuxmapedCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTAuxmapedNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTAuxmapedENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Size = 40
    end
    object IBTAuxmapedBAICLI: TIBStringField
      FieldName = 'BAICLI'
    end
    object IBTAuxmapedCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
    end
    object IBTAuxmapedESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Size = 2
    end
    object IBTAuxmapedBASE: TDateField
      FieldName = 'BASE'
    end
    object IBTAuxmapedRECOL: TDateField
      FieldName = 'RECOL'
    end
    object IBTAuxmapedCOBRAN: TDateField
      FieldName = 'COBRAN'
    end
    object IBTAuxmapedTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTAuxmapedDATPED: TIBStringField
      FieldName = 'DATPED'
      Size = 10
    end
    object IBTAuxmapedSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Size = 6
    end
    object IBTAuxmapedRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTAuxmapedTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTAuxmapedVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Precision = 18
      Size = 2
    end
    object IBTAuxmapedCOB: TIBStringField
      FieldName = 'COB'
      Size = 1
    end
    object IBTAuxmapedLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Size = 10
    end
  end
  object IBTAuxmapag: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'RELPEDIDO'
    UniDirectional = False
    Left = 582
    Top = 209
    object IBTAuxmapagITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 6
    end
    object IBTAuxmapagPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxmapagCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTAuxmapagCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTAuxmapagNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTAuxmapagENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Size = 40
    end
    object IBTAuxmapagBAICLI: TIBStringField
      FieldName = 'BAICLI'
    end
    object IBTAuxmapagCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
    end
    object IBTAuxmapagESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Size = 2
    end
    object IBTAuxmapagBASE: TIBStringField
      FieldName = 'BASE'
      Size = 10
    end
    object IBTAuxmapagRECOL: TIBStringField
      FieldName = 'RECOL'
      Size = 10
    end
    object IBTAuxmapagCOBRAN: TIBStringField
      FieldName = 'COBRAN'
      Size = 10
    end
    object IBTAuxmapagTOTPED: TIBStringField
      FieldName = 'TOTPED'
      Size = 15
    end
    object IBTAuxmapagSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTAuxmapagDATPED: TIBStringField
      FieldName = 'DATPED'
      Size = 10
    end
    object IBTAuxmapagSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Size = 6
    end
    object IBTAuxmapagRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTAuxmapagTOTVEN: TIBStringField
      FieldName = 'TOTVEN'
      Size = 15
    end
    object IBTAuxmapagDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTAuxmapagVALPAG: TIBStringField
      FieldName = 'VALPAG'
      Size = 15
    end
    object IBTAuxmapagRESIDUO: TIBStringField
      FieldName = 'RESIDUO'
      Size = 15
    end
  end
  object IBQAuxmapa: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXMAPA')
    Left = 117
    Top = 209
    object IBQAuxmapaCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXMAPA"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxmapaDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXMAPA"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxmapaESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      Origin = '"AUXMAPA"."ESTOQ"'
      DisplayFormat = '###0,0'
    end
    object IBQAuxmapaCOMPRA: TIntegerField
      FieldName = 'COMPRA'
      Origin = '"AUXMAPA"."COMPRA"'
      DisplayFormat = '###0,0'
    end
    object IBQAuxmapaDEFEITO: TIntegerField
      FieldName = 'DEFEITO'
      Origin = '"AUXMAPA"."DEFEITO"'
      DisplayFormat = '##0.0'
    end
    object IBQAuxmapaRETDEV: TIntegerField
      FieldName = 'RETDEV'
      Origin = '"AUXMAPA"."RETDEV"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxmapaSAIDA: TIntegerField
      FieldName = 'SAIDA'
      Origin = '"AUXMAPA"."SAIDA"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxmapaQTDFIS: TIntegerField
      FieldName = 'QTDFIS'
      Origin = '"AUXMAPA"."QTDFIS"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxmapaVALFIS: TIntegerField
      FieldName = 'VALFIS'
      Origin = '"AUXMAPA"."VALFIS"'
      DisplayFormat = '##,##0.00'
    end
    object IBQAuxmapaQTDSAC: TIntegerField
      FieldName = 'QTDSAC'
      Origin = '"AUXMAPA"."QTDSAC"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxmapaVALSAC: TIBBCDField
      FieldName = 'VALSAC'
      Origin = '"AUXMAPA"."VALSAC"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapaQTDREAL: TIntegerField
      FieldName = 'QTDREAL'
      Origin = '"AUXMAPA"."QTDREAL"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxmapaVALREAL: TIBBCDField
      FieldName = 'VALREAL'
      Origin = '"AUXMAPA"."VALREAL"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapaQTDVEN: TIntegerField
      FieldName = 'QTDVEN'
      Origin = '"AUXMAPA"."QTDVEN"'
      DisplayFormat = '###0.0'
    end
    object IBQAuxmapaVALVEN: TIBBCDField
      FieldName = 'VALVEN'
      Origin = '"AUXMAPA"."VALVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapaCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"AUXMAPA"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxmapaMEDIA: TIntegerField
      FieldName = 'MEDIA'
      Origin = '"AUXMAPA"."MEDIA"'
      DisplayFormat = '##0.0'
    end
    object IBQAuxmapaAPURADO: TIntegerField
      FieldName = 'APURADO'
      Origin = '"AUXMAPA"."APURADO"'
      DisplayFormat = '##,##0.00'
    end
    object IBQAuxmapaNASACOL: TIntegerField
      FieldName = 'NASACOL'
      Origin = '"AUXMAPA"."NASACOL"'
      DisplayFormat = '###0.0'
    end
  end
  object RvVendas: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.555628854200000000
    ReportOptions.LastChange = 43103.418518819460000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvVendasGetValue
    Left = 592
    Top = 46
    Datasets = <
      item
        DataSet = DsVendas
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 121.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.000000000000000000
          Top = 4.102350000000001000
          Width = 122.645640000000000000
          Height = 17.763760000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Rel 02 Emitido em:')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 137.000000000000000000
          Top = 5.102350000000001000
          Width = 89.000000000000000000
          Height = 18.779530000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 105.000000000000000000
          Top = 27.102350000000000000
          Width = 540.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX CONFEC'#199#213'ES - RELA'#199#195'O DE VENDAS PARA COBRAN'#199'A')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 626.000000000000000000
          Top = 3.102350000000001000
          Width = 79.000000000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG:[Page#]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 32.000000000000000000
          Top = 46.102350000000000000
          Width = 272.000000000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pra'#231'as:[Pracas]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 374.000000000000000000
          Top = 44.102350000000000000
          Width = 302.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor:[Vendedor]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 56.000000000000000000
          Top = 69.102350000000000000
          Width = 321.000000000000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Per'#237'odo aferido:[Datrel]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 399.000000000000000000
          Top = 68.102350000000000000
          Width = 229.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Op'#231#227'o:[Opcao]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 95.102350000000000000
          Width = 712.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 119.102350000000000000
          Width = 714.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 61.000000000000000000
          Top = 96.102350000000000000
          Height = 21.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 521.000000000000000000
          Top = 97.102350000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 608.000000000000000000
          Top = 97.102350000000000000
          Height = 19.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 99.102350000000000000
          Width = 54.440940000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 207.000000000000000000
          Top = 97.102350000000000000
          Width = 171.031540000000000000
          Height = 19.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Dados do Cliente')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 535.000000000000000000
          Top = 99.102350000000000000
          Width = 53.015770000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Retorno')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 618.000000000000000000
          Top = 100.102350000000000000
          Width = 95.338590000000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sit.     Vendido')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = DsVendas
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 607.000000000000000000
          Top = 1.464439999999996000
          Height = 17.661410000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 0.684910000000002200
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataField = 'PEDIDO'
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."PEDIDO"]')
          ParentFont = False
        end
        object frxDBDataset1BAICLI: TfrxMemoView
          AllowVectorExport = True
          Left = 352.000000000000000000
          Top = 1.684910000000002000
          Width = 162.944960000000000000
          Height = 18.897650000000000000
          DataField = 'BAICLI'
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."BAICLI"]')
          ParentFont = False
        end
        object frxDBDataset1RETORNO: TfrxMemoView
          AllowVectorExport = True
          Left = 528.000000000000000000
          Top = 1.684910000000002000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataField = 'RETORNO'
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."RETORNO"]')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 61.000000000000000000
          Top = 0.684910000000002200
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 521.000000000000000000
          Top = 1.464439999999996000
          Height = 18.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1CODCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 65.000000000000000000
          Top = 1.684910000000002000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataField = 'CODCLI'
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODCLI"]')
          ParentFont = False
        end
        object frxDBDataset1NOMCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 110.000000000000000000
          Top = 1.684910000000002000
          Width = 236.023810000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOMCLI"]')
          ParentFont = False
        end
        object frxDBDataset1SITU: TfrxMemoView
          AllowVectorExport = True
          Left = 610.000000000000000000
          Top = 1.684910000000002000
          Width = 23.000000000000000000
          Height = 18.897650000000000000
          DataField = 'SITU'
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."SITU"]')
          ParentFont = False
        end
        object frxDBDataset1TOTVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 635.000000000000000000
          Top = 1.582560000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."TOTVEN"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 27.456710000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 1.110080000000011000
          Width = 719.559060000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 185.000000000000000000
          Top = 5.110080000000011000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAIS --->')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 293.000000000000000000
          Top = 3.110080000000000000
          Width = 138.000000000000000000
          Height = 18.559060000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Pedidos:[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 585.000000000000000000
          Top = 5.110080000000000000
          Width = 129.000000000000000000
          Height = 18.000000000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."TOTVEN">,MasterData1)]')
          ParentFont = False
        end
      end
    end
  end
  object RvMapag: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.568188125000000000
    ReportOptions.LastChange = 43863.423684328710000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvMapagGetValue
    Left = 637
    Top = 290
    Datasets = <
      item
        DataSet = DsMapag
        DataSetName = 'frxDBDataset6'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 120.338590000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 0.102350000000001000
          Width = 182.252010000000000000
          Height = 18.559060000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em:[Date]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 632.000000000000000000
          Top = 2.102350000000000000
          Width = 77.881880000000000000
          Height = 20.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Pag;[Page#]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 79.000000000000000000
          Top = 21.102350000000000000
          Width = 508.000000000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX - CONFEC'#199#213'ES - [Titulo]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 46.000000000000000000
          Top = 48.102350000000000000
          Width = 281.811070000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pr'#231'as:[Pracas]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 363.000000000000000000
          Top = 48.102350000000000000
          Width = 239.220470000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor:[Vendedor]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 94.102350000000000000
          Width = 716.779530000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 117.102350000000000000
          Width = 722.488250000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 97.102350000000000000
          Width = 50.409400000000000000
          Height = 13.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 60.000000000000000000
          Top = 96.102350000000000000
          Width = 22.322820000000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Sit.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 99.000000000000000000
          Top = 98.102350000000000000
          Width = 50.425170000000000000
          Height = 15.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vencmt')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 160.000000000000000000
          Top = 97.102350000000000000
          Height = 17.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 425.000000000000000000
          Top = 95.102350000000000000
          Height = 17.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 163.000000000000000000
          Top = 98.102350000000000000
          Width = 54.102350000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendido')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 367.811070000000000000
          Top = 98.102350000000000000
          Width = 51.102350000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Resido')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 298.527520000000000000
          Top = 98.102350000000000000
          Width = 53.000000000000000000
          Height = 14.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Dat.Pag')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 494.000000000000000000
          Top = 96.102350000000000000
          Width = 46.850340000000000000
          Height = 17.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cliente')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 115.000000000000000000
          Top = 69.102350000000000000
          Width = 381.897650000000000000
          Height = 19.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Datrel]')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 226.000000000000000000
          Top = 99.102350000000000000
          Width = 60.000000000000000000
          Height = 14.779530000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Val.Pag.')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 25.921150000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = DsMapag
        DataSetName = 'frxDBDataset6'
        RowCount = 0
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 160.000000000000000000
          Top = 0.921150000000012000
          Height = 18.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 426.000000000000000000
          Top = 1.921150000000010000
          Height = 19.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1CODCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 428.000000000000000000
          Top = 0.921150000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset6."CODCLI"]')
        end
        object frxDBDataset1NOMCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 469.000000000000000000
          Top = 1.818800000000010000
          Width = 143.622140000000000000
          Height = 18.897650000000000000
          DataField = 'NOMCLI'
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset6."NOMCLI"]')
        end
        object frxDBDataset1TOTVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 159.000000000000000000
          Top = 0.921150000000000000
          Width = 56.944960000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset6."TOTVEN"]')
          ParentFont = False
        end
        object frxDBDataset1DATPAG: TfrxMemoView
          AllowVectorExport = True
          Left = 280.747990000000000000
          Top = 1.921150000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset6."DATPAG"]')
          ParentFont = False
        end
        object frxDBDataset1BAICLI: TfrxMemoView
          AllowVectorExport = True
          Left = 613.000000000000000000
          Top = 2.921150000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset6."BAICLI"]')
          ParentFont = False
        end
        object frxDBDataset1PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 1.921150000000000000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset6."PEDIDO"]')
        end
        object frxDBDataset1SITU: TfrxMemoView
          AllowVectorExport = True
          Left = 54.000000000000000000
          Top = 1.921150000000000000
          Width = 25.559060000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset6."SITU"]')
        end
        object frxDBDataset1COBRAN: TfrxMemoView
          AllowVectorExport = True
          Left = 83.000000000000000000
          Top = 1.921150000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset6."COBRAN"]')
        end
        object frxDBDataset1VALPAG: TfrxMemoView
          AllowVectorExport = True
          Left = 220.000000000000000000
          Top = 1.684910000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset6."VALPAG"]')
          ParentFont = False
        end
        object frxDBDataset1RESIDUO: TfrxMemoView
          AllowVectorExport = True
          Left = 355.370130000000000000
          Top = 1.921150000000000000
          Width = 65.385900000000000000
          Height = 18.897650000000000000
          DataSet = DsMapag
          DataSetName = 'frxDBDataset6'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset6."RESIDUO"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 1.228199999999990000
          Width = 704.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 10.000000000000000000
          Top = 4.566790000000000000
          Width = 82.000000000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'TOTAIS ->')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 525.795300000000000000
          Top = 4.566790000000000000
          Width = 60.897650000000000000
          Height = 19.779530000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Pedido]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 132.000000000000000000
          Top = 4.551020000000000000
          Width = 81.559060000000000000
          Height = 19.779530000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Vendido]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 347.913420000000000000
          Top = 2.551020000000000000
          Width = 73.559060000000000000
          Height = 18.559060000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Resido]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 451.795300000000000000
          Top = 4.551020000000000000
          Width = 68.000000000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Pedidos ->')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 222.000000000000000000
          Top = 3.551019999999990000
          Width = 69.456710000000000000
          Height = 21.338590000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Valpag]')
          ParentFont = False
        end
      end
    end
  end
  object RvVendsac: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.555628854200000000
    ReportOptions.LastChange = 43103.423685104160000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvVendsacGetValue
    Left = 573
    Top = 290
    Datasets = <
      item
        DataSet = DSVendsac
        DataSetName = 'frxDBDataset7'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 121.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.000000000000000000
          Top = 4.102350000000000000
          Width = 122.645640000000000000
          Height = 17.763760000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Rel 02 Emitido em:')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 137.000000000000000000
          Top = 5.102350000000000000
          Width = 127.000000000000000000
          Height = 18.779530000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 105.000000000000000000
          Top = 27.102350000000000000
          Width = 540.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX CONFEC'#199#213'ES - RELA'#199#195'O DE VENDAS PARA COBRAN'#199'A')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 626.000000000000000000
          Top = 3.102350000000000000
          Width = 79.000000000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG:[Page#]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 32.000000000000000000
          Top = 46.102350000000000000
          Width = 272.000000000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pra'#231'as:[Pracas]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 374.000000000000000000
          Top = 44.102350000000000000
          Width = 302.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor:[Vendedor]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 56.000000000000000000
          Top = 69.102350000000000000
          Width = 321.000000000000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Per'#237'odo aferido:[Datrel]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 399.000000000000000000
          Top = 68.102350000000000000
          Width = 229.000000000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Op'#231#227'o:[Opcao]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 95.102350000000000000
          Width = 712.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 119.102350000000000000
          Width = 714.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 61.000000000000000000
          Top = 96.102350000000000000
          Height = 21.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 519.000000000000000000
          Top = 97.102350000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 645.000000000000000000
          Top = 97.102350000000000000
          Height = 19.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 99.102350000000000000
          Width = 54.440940000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 207.000000000000000000
          Top = 97.102350000000000000
          Width = 171.031540000000000000
          Height = 19.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Dados do Cliente')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 529.000000000000000000
          Top = 98.102350000000000000
          Width = 106.118120000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SIT.       DEVOL.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 654.000000000000000000
          Top = 100.102350000000000000
          Width = 89.000000000000000000
          Height = 14.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'VAL.PED.')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = DSVendsac
        DataSetName = 'frxDBDataset7'
        RowCount = 0
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 645.000000000000000000
          Top = 0.464440000000000000
          Height = 21.440940000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 61.000000000000000000
          Top = 1.684910000000000000
          Height = 24.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 519.000000000000000000
          Top = 1.464440000000000000
          Height = 22.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 1.684910000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset7."PEDIDO"]')
          ParentFont = False
        end
        object frxDBDataset1CODCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 64.000000000000000000
          Top = 0.684910000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset7."CODCLI"]')
          ParentFont = False
        end
        object frxDBDataset1NOMCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 110.000000000000000000
          Top = 0.684910000000000000
          Width = 236.023810000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset7."NOMCLI"]')
          ParentFont = False
        end
        object frxDBDataset1BAICLI: TfrxMemoView
          AllowVectorExport = True
          Left = 352.000000000000000000
          Top = 0.684910000000000000
          Width = 162.944960000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset7."BAICLI"]')
          ParentFont = False
        end
        object frxDBDataset1TOTPED: TfrxMemoView
          AllowVectorExport = True
          Left = 648.000000000000000000
          Top = 0.684910000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset7."TOTPED"]')
          ParentFont = False
        end
        object frxDBDataset1SITU: TfrxMemoView
          AllowVectorExport = True
          Left = 524.000000000000000000
          Top = 2.684910000000000000
          Width = 24.559060000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset7."SITU"]')
          ParentFont = False
        end
        object frxDBDataset1RECOL: TfrxMemoView
          AllowVectorExport = True
          Left = 555.000000000000000000
          Top = 1.684910000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset7."RECOL"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 27.456710000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 1.110080000000000000
          Width = 719.559060000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 185.000000000000000000
          Top = 5.110080000000000000
          Width = 96.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAIS --->')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 305.000000000000000000
          Top = 6.110080000000000000
          Width = 138.000000000000000000
          Height = 14.779530000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Pedidos: [COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 638.000000000000000000
          Top = 6.110080000000000000
          Width = 76.086580000000000000
          Height = 18.000000000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset7."TOTPED">,MasterData1,1)]')
          ParentFont = False
        end
      end
    end
  end
  object RvMerc: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.569828865700000000
    ReportOptions.LastChange = 43103.427547152800000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvMercGetValue
    Left = 499
    Top = 45
    Datasets = <
      item
        DataSet = DsMerc
        DataSetName = 'frxDBDataset5'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 113.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 2.102350000000000000
          Width = 171.149660000000000000
          Height = 16.779530000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em:[Date]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 9.000000000000000000
          Top = 21.102350000000000000
          Width = 430.307050000000000000
          Height = 23.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SID-TEX CONFEC'#199#213'ES - Movimento geral de artigos  --')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Top = 66.102350000000000000
          Width = 720.622140000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 107.102350000000000000
          Width = 719.535560000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 41.102350000000000000
          Width = 412.236240000000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Periodo:[Datrel]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 422.000000000000000000
          Top = 41.102350000000000000
          Width = 287.000000000000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Opcao]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 623.000000000000000000
          Top = 2.102350000000000000
          Width = 79.661410000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pag:[Page#]')
          ParentFont = False
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 220.000000000000000000
          Top = 67.102350000000000000
          Height = 39.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 413.000000000000000000
          Top = 67.102350000000000000
          Height = 39.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 541.000000000000000000
          Top = 66.102350000000000000
          Height = 36.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 253.000000000000000000
          Top = 69.102350000000000000
          Width = 73.000000000000000000
          Height = 15.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SAIDA(Ret)')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 446.000000000000000000
          Top = 69.102350000000000000
          Width = 55.220470000000000000
          Height = 17.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SACOL')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 574.000000000000000000
          Top = 69.102350000000000000
          Width = 67.543290000000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDIDO')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 230.000000000000000000
          Top = 88.102350000000000000
          Width = 39.000000000000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 292.000000000000000000
          Top = 88.102350000000000000
          Width = 55.338590000000000000
          Height = 15.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 420.000000000000000000
          Top = 87.102350000000000000
          Width = 37.000000000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 472.000000000000000000
          Top = 86.102350000000000000
          Width = 60.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 554.000000000000000000
          Top = 89.102350000000000000
          Width = 35.881880000000000000
          Height = 14.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 606.000000000000000000
          Top = 88.102350000000000000
          Width = 55.779530000000000000
          Height = 16.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 680.000000000000000000
          Top = 88.102350000000000000
          Width = 33.881880000000000000
          Height = 16.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'MED')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 355.000000000000000000
          Top = 68.102350000000000000
          Height = 37.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 360.000000000000000000
          Top = 88.102350000000000000
          Width = 48.220470000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RT/DV')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 88.102350000000000000
          Width = 43.000000000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COD.')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 100.000000000000000000
          Top = 87.102350000000000000
          Width = 54.629870000000000000
          Height = 17.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGO')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 447.000000000000000000
          Top = 23.102350000000000000
          Width = 256.795300000000000000
          Height = 16.559060000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Modalidade]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 192.756030000000000000
        Width = 718.110700000000000000
        DataSet = DsMerc
        DataSetName = 'frxDBDataset5'
        RowCount = 0
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 24.243970000000000000
          Width = 715.637910000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 220.000000000000000000
          Top = 2.023500000000010000
          Height = 18.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 355.000000000000000000
          Top = 2.023500000000010000
          Height = 19.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 413.000000000000000000
          Top = 0.023500000000012710
          Height = 19.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 1.243970000000000000
          Width = 40.236240000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset5."CODART"]')
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 49.000000000000000000
          Top = 1.243969999999990000
          Width = 167.480520000000000000
          Height = 18.897650000000000000
          DataField = 'DESCRICAO'
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset5."DESCRICAO"]')
        end
        object frxDBDataset1QTDFIS: TfrxMemoView
          AllowVectorExport = True
          Left = 222.000000000000000000
          Top = 1.243970000000000000
          Width = 44.149660000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."QTDFIS"]')
          ParentFont = False
        end
        object frxDBDataset1VALFIS: TfrxMemoView
          AllowVectorExport = True
          Left = 265.000000000000000000
          Top = 1.243970000000000000
          Width = 85.047310000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."VALFIS"]')
          ParentFont = False
        end
        object frxDBDataset1RETDEV: TfrxMemoView
          AllowVectorExport = True
          Left = 356.000000000000000000
          Top = 3.243970000000000000
          Width = 52.590600000000000000
          Height = 15.118120000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."RETDEV"]')
          ParentFont = False
        end
        object frxDBDataset1QTDSAC: TfrxMemoView
          AllowVectorExport = True
          Left = 416.000000000000000000
          Top = 1.243970000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."QTDSAC"]')
          ParentFont = False
        end
        object frxDBDataset1QTDVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 544.000000000000000000
          Top = 1.243970000000000000
          Width = 44.149660000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."QTDVEN"]')
          ParentFont = False
        end
        object frxDBDataset1VALVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 592.000000000000000000
          Top = 1.243970000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."VALVEN"]')
          ParentFont = False
        end
        object frxDBDataset1MEDIA: TfrxMemoView
          AllowVectorExport = True
          Left = 679.000000000000000000
          Top = 1.243970000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."MEDIA"]')
          ParentFont = False
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 541.000000000000000000
          Top = 0.023500000000012710
          Height = 20.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1VALSAC: TfrxMemoView
          AllowVectorExport = True
          Left = 462.000000000000000000
          Top = 0.243970000000000000
          Width = 75.590600000000000000
          Height = 18.897650000000000000
          DataSet = DsMerc
          DataSetName = 'frxDBDataset5'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset5."VALSAC"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 241.889920000000000000
        Width = 718.110700000000000000
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 50.000000000000000000
          Top = 3.110080000000010000
          Width = 147.000000000000000000
          Height = 20.440940000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DE NOTAS ->')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 204.000000000000000000
          Top = 3.110080000000000000
          Width = 53.425170000000000000
          Height = 20.779530000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Totnot]')
          ParentFont = False
        end
      end
    end
  end
  object RvExtracli: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.569877662000000000
    ReportOptions.LastChange = 43103.479237118050000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvExtracliGetValue
    Left = 511
    Top = 290
    Datasets = <
      item
        DataSet = DsExtracli
        DataSetName = 'frxDBDataset4'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 126.897650000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 82.102350000000000000
          Width = 718.031540000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 102.102350000000000000
          Width = 718.858380000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 101.000000000000000000
          Top = 2.102350000000001000
          Width = 191.220470000000000000
          Height = 21.000000000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em: [Date]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 7.000000000000000000
          Top = 61.102350000000000000
          Width = 227.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data inicial da aferi'#231#227'o: [Afericao]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 92.000000000000000000
          Top = 32.102350000000000000
          Width = 193.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'EXTRATO DO CLIENTE')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 84.102350000000000000
          Width = 686.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'Informamos que no periodo aferido: f'#244'ram constatados em nossos a' +
              'rquivos, os movimentos abaixo descriminados')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 295.000000000000000000
          Top = 0.102350000000001300
          Height = 82.118120000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 298.000000000000000000
          Top = 1.102350000000001000
          Width = 383.220470000000000000
          Height = 19.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Cliente]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 300.000000000000000000
          Top = 22.102350000000000000
          Width = 384.677180000000000000
          Height = 17.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Endereco]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 301.000000000000000000
          Top = 41.102350000000000000
          Width = 383.196970000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Bairro]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 429.000000000000000000
          Top = 62.102350000000000000
          Width = 285.165430000000100000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Rota]')
          ParentFont = False
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 54.000000000000000000
          Top = 104.102350000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 132.000000000000000000
          Top = 102.102350000000000000
          Height = 21.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 278.000000000000000000
          Top = 102.102350000000000000
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 486.000000000000000000
          Top = 104.102350000000000000
          Height = 19.440940000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 603.000000000000000000
          Top = 102.102350000000000000
          Height = 22.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 126.102350000000000000
          Width = 720.897650000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 533.000000000000000000
          Top = 103.102350000000000000
          Width = 60.747990000000000000
          Height = 21.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Dat.Pag.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 619.000000000000000000
          Top = 104.102350000000000000
          Width = 97.779530000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENCIMENTO')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 493.000000000000000000
          Top = 105.102350000000000000
          Width = 26.440940000000000000
          Height = 14.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SIT')
          ParentFont = False
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 526.000000000000000000
          Top = 104.102350000000000000
          Height = 21.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 428.000000000000000000
          Top = 105.102350000000000000
          Width = 54.409400000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Residuo')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 358.000000000000000000
          Top = 104.102350000000000000
          Width = 65.661410000000000000
          Height = 16.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Val.Venda')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 282.000000000000000000
          Top = 106.102350000000000000
          Width = 68.779530000000000000
          Height = 15.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Val.Pedido')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 150.000000000000000000
          Top = 105.102350000000000000
          Width = 89.322820000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 11.000000000000000000
          Top = 105.102350000000000000
          Width = 36.779530000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PED.')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 61.000000000000000000
          Top = 105.102350000000000000
          Width = 66.677180000000010000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EMISSAO')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 302.000000000000000000
          Top = 62.102350000000000000
          Width = 108.000000000000000000
          Height = 18.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Estado]')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 3.102350000000001000
          Width = 79.086580000000000000
          Height = 49.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -37
          Font.Name = 'Gabriola'
          Font.Style = [fsBold, fsItalic]
          Frame.Typ = []
          Memo.UTF8W = (
            'Sidtex')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 207.874150000000000000
        Width = 718.110700000000000000
        DataSet = DsExtracli
        DataSetName = 'frxDBDataset4'
        RowCount = 0
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 278.000000000000000000
          Top = 0.700680000000005500
          Height = 23.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 526.000000000000000000
          Top = 1.346319999999992000
          Height = 22.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 603.000000000000000000
          Top = 2.346319999999992000
          Height = 22.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 54.000000000000000000
          Top = 2.125850000000014000
          Height = 21.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 1.125850000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."PEDIDO"]')
          ParentFont = False
        end
        object frxDBDataset1EMISSAO: TfrxMemoView
          AllowVectorExport = True
          Left = 55.000000000000000000
          Top = 0.125850000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."EMISSAO"]')
          ParentFont = False
        end
        object frxDBDataset1DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 137.000000000000000000
          Top = 2.125850000000000000
          Width = 137.905690000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."DESCRICAO"]')
          ParentFont = False
        end
        object frxDBDataset1VALSAIDA: TfrxMemoView
          AllowVectorExport = True
          Left = 283.000000000000000000
          Top = 1.125850000000000000
          Width = 65.590600000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset4."VALSAIDA"]')
          ParentFont = False
        end
        object frxDBDataset1VALVEND: TfrxMemoView
          AllowVectorExport = True
          Left = 353.000000000000000000
          Top = 3.125850000000000000
          Width = 61.401670000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset4."VALVEND"]')
          ParentFont = False
        end
        object frxDBDataset1VALRESI: TfrxMemoView
          AllowVectorExport = True
          Left = 418.000000000000000000
          Top = 3.125850000000000000
          Width = 64.181200000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset4."VALRESI"]')
          ParentFont = False
        end
        object frxDBDataset1SITU: TfrxMemoView
          AllowVectorExport = True
          Left = 494.000000000000000000
          Top = 3.125850000000014000
          Width = 23.338590000000000000
          Height = 18.897650000000000000
          DataField = 'SITU'
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."SITU"]')
          ParentFont = False
        end
        object frxDBDataset1DATPAG: TfrxMemoView
          AllowVectorExport = True
          Left = 529.000000000000000000
          Top = 3.125850000000000000
          Width = 69.929190000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."DATPAG"]')
          ParentFont = False
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 486.000000000000000000
          Top = 1.346319999999992000
          Height = 22.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 132.000000000000000000
          Top = 1.700680000000005000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset4VENCTO: TfrxMemoView
          AllowVectorExport = True
          Left = 618.000000000000000000
          Top = 3.125850000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = DsExtracli
          DataSetName = 'frxDBDataset4'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset4."VENCTO"]')
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 30.236240000000000000
        Top = 257.008040000000000000
        Width = 718.110700000000000000
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 1.110079999999982000
          Width = 719.944960000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Top = 27.110079999999980000
          Width = 721.708720000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 3.771489999999972000
          Width = 246.000000000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Atendimento]')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 640.000000000000000000
          Top = 3.771490000000028000
          Width = 72.220470000000000000
          Height = 20.338590000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SALDO]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 273.000000000000000000
          Top = 3.991960000000006000
          Width = 362.047310000000000000
          Height = 20.338590000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'PENDENTE ( Val.Residuo situ='#39'D'#39' + Val.Pedido situ='#39'E'#39' ) ->')
        end
      end
    end
  end
  object DsVendas: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PEDIDO=PEDIDO'
      'CODVEN=CODVEN'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'ENDCLI=ENDCLI'
      'BAICLI=BAICLI'
      'CIDCLI=CIDCLI'
      'ESTCLI=ESTCLI'
      'BASE=BASE'
      'RECOL=RECOL'
      'COBRAN=COBRAN'
      'TOTPED=TOTPED'
      'SITU=SITU'
      'DATPED=DATPED'
      'SOLICIT=SOLICIT'
      'RETORNO=RETORNO'
      'TOTVEN=TOTVEN'
      'DATPAG=DATPAG'
      'VALPAG=VALPAG'
      'RESIDUO=RESIDUO'
      'COB=COB'
      'LIMITE=LIMITE')
    DataSet = IBQAuxmaped
    BCDToCurrency = False
    Left = 646
    Top = 47
  end
  object DsMapag: TfrxDBDataset
    UserName = 'frxDBDataset6'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ITEM=ITEM'
      'PEDIDO=PEDIDO'
      'CODVEN=CODVEN'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'ENDCLI=ENDCLI'
      'BAICLI=BAICLI'
      'CIDCLI=CIDCLI'
      'ESTCLI=ESTCLI'
      'BASE=BASE'
      'RECOL=RECOL'
      'COBRAN=COBRAN'
      'TOTPED=TOTPED'
      'SITU=SITU'
      'DATPED=DATPED'
      'SOLICIT=SOLICIT'
      'RETORNO=RETORNO'
      'TOTVEN=TOTVEN'
      'DATPAG=DATPAG'
      'VALPAG=VALPAG'
      'RESIDUO=RESIDUO')
    DataSet = IBQAuxmapag
    BCDToCurrency = False
    Left = 637
    Top = 339
  end
  object DsMerc: TfrxDBDataset
    UserName = 'frxDBDataset5'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODART=CODART'
      'DESCRICAO=DESCRICAO'
      'ESTOQ=ESTOQ'
      'COMPRA=COMPRA'
      'DEFEITO=DEFEITO'
      'RETDEV=RETDEV'
      'SAIDA=SAIDA'
      'QTDFIS=QTDFIS'
      'VALFIS=VALFIS'
      'QTDSAC=QTDSAC'
      'VALSAC=VALSAC'
      'QTDREAL=QTDREAL'
      'VALREAL=VALREAL'
      'QTDVEN=QTDVEN'
      'VALVEN=VALVEN'
      'CUSTO=CUSTO'
      'MEDIA=MEDIA'
      'APURADO=APURADO'
      'NASACOL=NASACOL')
    DataSet = IBQAuxmapa
    BCDToCurrency = False
    Left = 543
    Top = 45
  end
  object DsExtracli: TfrxDBDataset
    UserName = 'frxDBDataset4'
    CloseDataSource = False
    FieldAliases.Strings = (
      'CODCLI=CODCLI'
      'ITEM=ITEM'
      'PEDIDO=PEDIDO'
      'EMISSAO=EMISSAO'
      'DESCRICAO=DESCRICAO'
      'VALSAIDA=VALSAIDA'
      'RETORNO=RETORNO'
      'VALVEND=VALVEND'
      'VALRESI=VALRESI'
      'DATPAG=DATPAG'
      'SITU=SITU'
      'VENCTO=VENCTO')
    DataSet = IBTExtracli
    BCDToCurrency = False
    Left = 513
    Top = 346
  end
  object DSVendsac: TfrxDBDataset
    UserName = 'frxDBDataset7'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PEDIDO=PEDIDO'
      'CODVEN=CODVEN'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'ENDCLI=ENDCLI'
      'BAICLI=BAICLI'
      'CIDCLI=CIDCLI'
      'ESTCLI=ESTCLI'
      'BASE=BASE'
      'RECOL=RECOL'
      'COBRAN=COBRAN'
      'TOTPED=TOTPED'
      'SITU=SITU'
      'DATPED=DATPED'
      'SOLICIT=SOLICIT'
      'RETORNO=RETORNO'
      'TOTVEN=TOTVEN'
      'DATPAG=DATPAG'
      'VALPAG=VALPAG'
      'RESIDUO=RESIDUO'
      'COB=COB'
      'LIMITE=LIMITE')
    DataSet = IBTAuxmaped
    BCDToCurrency = False
    Left = 573
    Top = 346
  end
  object IBQuery1: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CADLOGIN')
    Left = 653
    Top = 210
  end
  object RvProdut: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43048.555628854200000000
    ReportOptions.LastChange = 44066.541241284720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvProdutGetValue
    Left = 56
    Top = 380
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object PageHeader1: TfrxPageHeader
        FillType = ftBrush
        Frame.Typ = []
        Height = 121.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 7.000000000000000000
          Top = 4.102350000000000000
          Width = 122.645640000000000000
          Height = 17.763760000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Rel 02 Emitido em:')
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 137.000000000000000000
          Top = 5.102350000000000000
          Width = 127.000000000000000000
          Height = 18.779530000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Frame.Typ = []
          Memo.UTF8W = (
            '[Date]')
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 105.000000000000000000
          Top = 27.102350000000000000
          Width = 540.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX CONFEC'#199#213'ES - RELA'#199#195'O DE VENDAS PARA COBRAN'#199'A')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 626.000000000000000000
          Top = 3.102350000000000000
          Width = 79.000000000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG:[Page#]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 32.000000000000000000
          Top = 46.102350000000000000
          Width = 272.000000000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pra'#231'as:[Pracas]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 374.000000000000000000
          Top = 44.102350000000000000
          Width = 302.000000000000000000
          Height = 17.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vendedor:[Vendedor]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 56.000000000000000000
          Top = 69.102350000000000000
          Width = 321.000000000000000000
          Height = 21.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Per'#237'odo aferido:[Datrel]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 399.000000000000000000
          Top = 68.102350000000000000
          Width = 278.133890000000000000
          Height = 20.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Op'#231#227'o:[Opcao]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 1.000000000000000000
          Top = 95.102350000000000000
          Width = 712.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Top = 119.102350000000000000
          Width = 714.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 61.000000000000000000
          Top = 96.102350000000000000
          Height = 21.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 519.000000000000000000
          Top = 97.102350000000000000
          Height = 20.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 645.000000000000000000
          Top = 97.102350000000000000
          Height = 19.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 99.102350000000000000
          Width = 54.440940000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Pedido')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 207.000000000000000000
          Top = 97.102350000000000000
          Width = 171.031540000000000000
          Height = 19.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Dados do Cliente')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 529.000000000000000000
          Top = 98.102350000000000000
          Width = 106.118120000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SIT.       DEVOL.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 654.000000000000000000
          Top = 100.102350000000000000
          Width = 89.000000000000000000
          Height = 14.000000000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD.PED.')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 645.000000000000000000
          Top = 0.464440000000000000
          Height = 21.440940000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 61.000000000000000000
          Top = 1.684910000000000000
          Height = 24.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 519.000000000000000000
          Top = 1.464440000000000000
          Height = 22.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset1PEDIDO: TfrxMemoView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 1.684910000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."PEDIDO"]')
          ParentFont = False
        end
        object frxDBDataset1CODCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 64.000000000000000000
          Top = 0.684910000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."CODCLI"]')
          ParentFont = False
        end
        object frxDBDataset1NOMCLI: TfrxMemoView
          AllowVectorExport = True
          Left = 110.000000000000000000
          Top = 0.684910000000000000
          Width = 236.023810000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NOMCLI"]')
          ParentFont = False
        end
        object frxDBDataset1BAICLI: TfrxMemoView
          AllowVectorExport = True
          Left = 352.000000000000000000
          Top = 0.684910000000000000
          Width = 162.944960000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."BAICLI"]')
          ParentFont = False
        end
        object frxDBDataset1SITU: TfrxMemoView
          AllowVectorExport = True
          Left = 524.000000000000000000
          Top = 2.684910000000000000
          Width = 24.559060000000000000
          Height = 18.897650000000000000
          DataSet = DsVendas
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."SITU"]')
          ParentFont = False
        end
        object frxDBDataset1BASE: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 559.370440000000000000
          Top = 2.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataField = 'BASE'
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."BASE"]')
        end
        object frxDBDataset1QUANT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 650.079160000000000000
          Top = 3.779530000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset1."QUANT"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 27.456710000000000000
        Top = 249.448980000000000000
        Width = 718.110700000000000000
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 1.110080000000000000
          Width = 719.559060000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 132.086580000000000000
          Top = 8.889610000000000000
          Width = 77.102350000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAIS --->')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 650.079160000000000000
          Top = 7.559060000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[SUM(<frxDBDataset1."QUANT">,MasterData1)]')
          Formats = <
            item
            end
            item
            end>
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 291.023810000000000000
          Top = 7.559060000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'PEDIDOS:[COUNT(MasterData1)]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 445.984540000000000000
          Top = 7.559060000000000000
          Width = 102.047310000000000000
          Height = 15.118120000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'NOTAS:[notas]')
          ParentFont = False
        end
      end
    end
  end
  object IBQAuxprod: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXPEDIDO')
    Left = 288
    Top = 380
    object IBQAuxprodPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxprodCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"AUXPEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQAuxprodCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXPEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQAuxprodNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"AUXPEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQAuxprodENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Origin = '"AUXPEDIDO"."ENDCLI"'
      Size = 40
    end
    object IBQAuxprodBAICLI: TIBStringField
      FieldName = 'BAICLI'
      Origin = '"AUXPEDIDO"."BAICLI"'
    end
    object IBQAuxprodCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
      Origin = '"AUXPEDIDO"."CIDCLI"'
    end
    object IBQAuxprodESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Origin = '"AUXPEDIDO"."ESTCLI"'
      Size = 2
    end
    object IBQAuxprodBASE: TDateField
      FieldName = 'BASE'
      Origin = '"AUXPEDIDO"."BASE"'
    end
    object IBQAuxprodRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"AUXPEDIDO"."RECOL"'
    end
    object IBQAuxprodCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"AUXPEDIDO"."COBRAN"'
    end
    object IBQAuxprodTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"AUXPEDIDO"."TOTPED"'
      Precision = 18
      Size = 2
    end
    object IBQAuxprodSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXPEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQAuxprodDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"AUXPEDIDO"."DATPED"'
      Size = 10
    end
    object IBQAuxprodSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"AUXPEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQAuxprodRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"AUXPEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQAuxprodTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"AUXPEDIDO"."TOTVEN"'
      Precision = 18
      Size = 2
    end
    object IBQAuxprodDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXPEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQAuxprodVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"AUXPEDIDO"."VALPAG"'
      Precision = 18
      Size = 2
    end
    object IBQAuxprodRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"AUXPEDIDO"."RESIDUO"'
      Precision = 18
      Size = 2
    end
    object IBQAuxprodCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"AUXPEDIDO"."COB"'
      Size = 1
    end
    object IBQAuxprodLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"AUXPEDIDO"."LIMITE"'
      Size = 10
    end
    object IBQAuxprodQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"AUXPEDIDO"."QUANT"'
    end
  end
  object IBTAuxprod: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXPEDIDO'
    UniDirectional = False
    Left = 216
    Top = 384
    object IBTAuxprodPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTAuxprodCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTAuxprodCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTAuxprodNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTAuxprodENDCLI: TIBStringField
      FieldName = 'ENDCLI'
      Size = 40
    end
    object IBTAuxprodBAICLI: TIBStringField
      FieldName = 'BAICLI'
    end
    object IBTAuxprodCIDCLI: TIBStringField
      FieldName = 'CIDCLI'
    end
    object IBTAuxprodESTCLI: TIBStringField
      FieldName = 'ESTCLI'
      Size = 2
    end
    object IBTAuxprodBASE: TDateField
      FieldName = 'BASE'
    end
    object IBTAuxprodRECOL: TDateField
      FieldName = 'RECOL'
    end
    object IBTAuxprodCOBRAN: TDateField
      FieldName = 'COBRAN'
    end
    object IBTAuxprodTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Precision = 18
      Size = 2
    end
    object IBTAuxprodSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTAuxprodDATPED: TIBStringField
      FieldName = 'DATPED'
      Size = 10
    end
    object IBTAuxprodSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Size = 6
    end
    object IBTAuxprodRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTAuxprodTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Precision = 18
      Size = 2
    end
    object IBTAuxprodDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTAuxprodVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Precision = 18
      Size = 2
    end
    object IBTAuxprodRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Precision = 18
      Size = 2
    end
    object IBTAuxprodCOB: TIBStringField
      FieldName = 'COB'
      Size = 1
    end
    object IBTAuxprodLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Size = 10
    end
    object IBTAuxprodQUANT: TIntegerField
      FieldName = 'QUANT'
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'PEDIDO=PEDIDO'
      'CODVEN=CODVEN'
      'CODCLI=CODCLI'
      'NOMCLI=NOMCLI'
      'ENDCLI=ENDCLI'
      'BAICLI=BAICLI'
      'CIDCLI=CIDCLI'
      'ESTCLI=ESTCLI'
      'BASE=BASE'
      'RECOL=RECOL'
      'COBRAN=COBRAN'
      'TOTPED=TOTPED'
      'SITU=SITU'
      'DATPED=DATPED'
      'SOLICIT=SOLICIT'
      'RETORNO=RETORNO'
      'TOTVEN=TOTVEN'
      'DATPAG=DATPAG'
      'VALPAG=VALPAG'
      'RESIDUO=RESIDUO'
      'COB=COB'
      'LIMITE=LIMITE'
      'QUANT=QUANT')
    DataSet = IBTAuxprod
    BCDToCurrency = False
    Left = 128
    Top = 379
  end
end
