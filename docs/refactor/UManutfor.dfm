object FrmManutfor: TFrmManutfor
  Left = 15
  Top = 15
  Caption = 
    '                                                                ' +
    '                                               MANUTEN'#199'AO DE FOR' +
    'NECEDORES'
  ClientHeight = 602
  ClientWidth = 987
  Color = clNavy
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
  object GroupBox1: TGroupBox
    Left = 14
    Top = 87
    Width = 146
    Height = 507
    Color = clGray
    Ctl3D = False
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 1
    object Label4: TLabel
      Left = 30
      Top = 192
      Width = 82
      Height = 19
      Caption = 'COMPRAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 38
      Top = 365
      Width = 75
      Height = 19
      Caption = 'EMISS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Button1: TButton
      Left = 16
      Top = 17
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
      Top = 56
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
      Top = 96
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
      Top = 135
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
    object Button6: TButton
      Left = 16
      Top = 217
      Width = 113
      Height = 41
      Caption = 'PED.LIMPO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button6Click
    end
    object Button7: TButton
      Left = 16
      Top = 255
      Width = 113
      Height = 41
      Caption = 'RECEBIMTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = Button7Click
    end
    object Button9: TButton
      Left = 16
      Top = 387
      Width = 113
      Height = 41
      Caption = 'POR/NOTAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = Button9Click
    end
    object Button5: TButton
      Left = 16
      Top = 428
      Width = 113
      Height = 41
      Caption = 'REL.NOTAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = Button5Click
    end
    object Button8: TButton
      Left = 16
      Top = 297
      Width = 113
      Height = 41
      Caption = 'AJUSTES'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      OnClick = Button8Click
    end
  end
  object Panel1: TPanel
    Left = 15
    Top = 8
    Width = 945
    Height = 73
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
      Left = 267
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
        'MARCA'
        'RAZAO')
    end
    object Edit1: TEdit
      Left = 368
      Top = 24
      Width = 289
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
      Left = 760
      Top = 21
      Width = 121
      Height = 31
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
  end
  object DBGrid1: TDBGrid
    Left = 166
    Top = 87
    Width = 793
    Height = 507
    DataSource = DModRosa.DsPesq_for
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clNavy
        Expanded = False
        FieldName = 'MARCA'
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
        Width = 102
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'RAZAO'
        Title.Caption = '              RAZAO  SOCIAL'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 405
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'NTEL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '     TELEFONE(S)'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 251
        Visible = True
      end>
  end
  object IBTAuxfornecedor: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXFORNECEDOR'
    UniDirectional = False
    Left = 240
    Top = 528
    object IBTAuxfornecedorMARCA: TIBStringField
      FieldName = 'MARCA'
      Required = True
      Size = 15
    end
    object IBTAuxfornecedorRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Size = 45
    end
    object IBTAuxfornecedorPESSO: TIBStringField
      FieldName = 'PESSO'
      Size = 1
    end
    object IBTAuxfornecedorNCPF: TIBStringField
      FieldName = 'NCPF'
    end
    object IBTAuxfornecedorCNPJ: TIBStringField
      FieldName = 'CNPJ'
    end
    object IBTAuxfornecedorINSC: TIBStringField
      FieldName = 'INSC'
    end
    object IBTAuxfornecedorENDE: TIBStringField
      FieldName = 'ENDE'
      Size = 40
    end
    object IBTAuxfornecedorBAIR: TIBStringField
      FieldName = 'BAIR'
    end
    object IBTAuxfornecedorCIDA: TIBStringField
      FieldName = 'CIDA'
    end
    object IBTAuxfornecedorESTA: TIBStringField
      FieldName = 'ESTA'
      Size = 2
    end
    object IBTAuxfornecedorNCEP: TIBStringField
      FieldName = 'NCEP'
      Size = 9
    end
    object IBTAuxfornecedorNTEL: TIBStringField
      FieldName = 'NTEL'
      Size = 30
    end
    object IBTAuxfornecedorRESP: TIBStringField
      FieldName = 'RESP'
      Size = 30
    end
    object IBTAuxfornecedorRTEL: TIBStringField
      FieldName = 'RTEL'
    end
    object IBTAuxfornecedorSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
  end
  object IBTAuxcomp: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXCOMPRA'
    UniDirectional = False
    Left = 416
    Top = 528
    object IBTAuxcompDATPED: TDateField
      FieldName = 'DATPED'
      Required = True
    end
    object IBTAuxcompTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Required = True
      Size = 3
    end
    object IBTAuxcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Required = True
      Size = 8
    end
    object IBTAuxcompFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Size = 15
    end
    object IBTAuxcompENTREG: TDateField
      FieldName = 'ENTREG'
    end
    object IBTAuxcompTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Precision = 18
      Size = 2
    end
    object IBTAuxcompDATNOT: TDateField
      FieldName = 'DATNOT'
    end
    object IBTAuxcompTIPNOT: TIBStringField
      FieldName = 'TIPNOT'
      Size = 3
    end
    object IBTAuxcompNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Size = 8
    end
    object IBTAuxcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Precision = 18
      Size = 2
    end
    object IBTAuxcompFRETE: TIBBCDField
      FieldName = 'FRETE'
      Precision = 18
      Size = 2
    end
    object IBTAuxcompVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Precision = 18
      Size = 2
    end
    object IBTAuxcompSITPED: TIBStringField
      FieldName = 'SITPED'
      Size = 1
    end
    object IBTAuxcompPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Size = 2
    end
    object IBTAuxcompOBSERV: TBlobField
      FieldName = 'OBSERV'
    end
  end
  object IBQAuxfornecedor: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXFORNECEDOR')
    Left = 336
    Top = 528
    object IBQAuxfornecedorMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"AUXFORNECEDOR"."MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBQAuxfornecedorRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"AUXFORNECEDOR"."RAZAO"'
      Size = 45
    end
    object IBQAuxfornecedorPESSO: TIBStringField
      FieldName = 'PESSO'
      Origin = '"AUXFORNECEDOR"."PESSO"'
      Size = 1
    end
    object IBQAuxfornecedorNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"AUXFORNECEDOR"."NCPF"'
    end
    object IBQAuxfornecedorCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"AUXFORNECEDOR"."CNPJ"'
    end
    object IBQAuxfornecedorINSC: TIBStringField
      FieldName = 'INSC'
      Origin = '"AUXFORNECEDOR"."INSC"'
    end
    object IBQAuxfornecedorENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"AUXFORNECEDOR"."ENDE"'
      Size = 40
    end
    object IBQAuxfornecedorBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"AUXFORNECEDOR"."BAIR"'
    end
    object IBQAuxfornecedorCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"AUXFORNECEDOR"."CIDA"'
    end
    object IBQAuxfornecedorESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"AUXFORNECEDOR"."ESTA"'
      Size = 2
    end
    object IBQAuxfornecedorNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"AUXFORNECEDOR"."NCEP"'
      Size = 9
    end
    object IBQAuxfornecedorNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"AUXFORNECEDOR"."NTEL"'
      Size = 30
    end
    object IBQAuxfornecedorRESP: TIBStringField
      FieldName = 'RESP'
      Origin = '"AUXFORNECEDOR"."RESP"'
      Size = 30
    end
    object IBQAuxfornecedorRTEL: TIBStringField
      FieldName = 'RTEL'
      Origin = '"AUXFORNECEDOR"."RTEL"'
    end
    object IBQAuxfornecedorSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXFORNECEDOR"."SITU"'
      Size = 1
    end
  end
  object IBQAuxcomp: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXCOMPRA')
    Left = 480
    Top = 528
    object IBQAuxcompDATPED: TDateField
      FieldName = 'DATPED'
      Origin = '"AUXCOMPRA"."DATPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQAuxcompTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"AUXCOMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"AUXCOMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQAuxcompFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Origin = '"AUXCOMPRA"."FORNEC"'
      Size = 15
    end
    object IBQAuxcompENTREG: TDateField
      FieldName = 'ENTREG'
      Origin = '"AUXCOMPRA"."ENTREG"'
    end
    object IBQAuxcompTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"AUXCOMPRA"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxcompDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"AUXCOMPRA"."DATNOT"'
    end
    object IBQAuxcompTIPNOT: TIBStringField
      FieldName = 'TIPNOT'
      Origin = '"AUXCOMPRA"."TIPNOT"'
      Size = 3
    end
    object IBQAuxcompNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"AUXCOMPRA"."NUMNOT"'
      Size = 8
    end
    object IBQAuxcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"AUXCOMPRA"."DESCON"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxcompFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = '"AUXCOMPRA"."FRETE"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxcompVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"AUXCOMPRA"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxcompSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"AUXCOMPRA"."SITPED"'
      Size = 1
    end
    object IBQAuxcompPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"AUXCOMPRA"."PARCEL"'
      Size = 2
    end
    object IBQAuxcompOBSERV: TBlobField
      FieldName = 'OBSERV'
      Origin = '"AUXCOMPRA"."OBSERV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
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
    Left = 688
    Top = 528
  end
  object IBTAuxitcomp: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    IndexFieldNames = 'NUMPED'
    MasterFields = 'NUMPED'
    MasterSource = DtsAuxcomp
    TableName = 'AUXLISTCOM'
    UniDirectional = False
    Left = 552
    Top = 528
    object IBTAuxitcompDATPED: TDateField
      FieldName = 'DATPED'
      Required = True
    end
    object IBTAuxitcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Required = True
      Size = 8
    end
    object IBTAuxitcompITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 3
    end
    object IBTAuxitcompCODART: TIBStringField
      FieldName = 'CODART'
      Size = 4
    end
    object IBTAuxitcompDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxitcompQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object IBTAuxitcompCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object IBTAuxitcompQTDANT: TIntegerField
      FieldName = 'QTDANT'
    end
    object IBTAuxitcompCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Precision = 18
      Size = 2
    end
    object IBTAuxitcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Precision = 9
      Size = 2
    end
    object IBTAuxitcompTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Size = 2
    end
    object IBTAuxitcompCOR: TIBStringField
      FieldName = 'COR'
      Size = 15
    end
    object IBTAuxitcompOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object IBQAuxitcomp: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXLISTCOM')
    Left = 624
    Top = 528
    object IBQAuxitcompDATPED: TDateField
      FieldName = 'DATPED'
      Origin = '"AUXLISTCOM"."DATPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQAuxitcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"AUXLISTCOM"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQAuxitcompITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXLISTCOM"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxitcompCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXLISTCOM"."CODART"'
      Size = 4
    end
    object IBQAuxitcompDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXLISTCOM"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitcompQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"AUXLISTCOM"."QUANT"'
      DisplayFormat = '###0'
    end
    object IBQAuxitcompCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"AUXLISTCOM"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitcompQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXLISTCOM"."QTDANT"'
      DisplayFormat = '###0'
    end
    object IBQAuxitcompCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXLISTCOM"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"AUXLISTCOM"."DESCON"'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object IBQAuxitcompTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Origin = '"AUXLISTCOM"."TAMANHO"'
      Size = 2
    end
    object IBQAuxitcompCOR: TIBStringField
      FieldName = 'COR'
      Origin = '"AUXLISTCOM"."COR"'
      Size = 15
    end
    object IBQAuxitcompOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXLISTCOM"."OPER"'
      Size = 1
    end
  end
  object frxPedlimpo: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42656.499686481480000000
    ReportOptions.LastChange = 42662.497467581020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxPedlimpoGetValue
    Left = 704
    Top = 24
    Datasets = <>
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
        Height = 1028.032160000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 43.762978950000000000
          Top = 1.865328950000000000
          Width = 217.621358950000000000
          Height = 20.687953680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ROSA CONFEC'#199#213'ES')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 44.956905260000000000
          Top = 28.736044740000000000
          Width = 338.367396320000000000
          Height = 21.483644210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PEDIDO DE FORNECIMENTO DE ARTIGOS')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 56.031540000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -0.543290000000000000
          Top = 129.960730000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 118.826840000000000000
          Top = 78.370130000000000000
          Width = 597.165740000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 106.456710000000000000
          Top = 102.771800000000000000
          Width = 608.504330000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -0.322820000000000000
          Top = 155.008040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 186.976500000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = -7.559060000000000000
          Top = 219.212740000000000000
          Width = 729.449290000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Top = 249.448980000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Top = 278.905690000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = -2.220470000000000000
          Top = 311.921460000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = -0.559060000000000000
          Top = 345.716760000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = -0.984230000000000000
          Top = 377.882190000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 0.779530000000000000
          Top = 412.307360000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = -2.543290000000000000
          Top = 445.913730000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = -0.661410000000000000
          Top = 481.268090000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = -1.322820000000000000
          Top = 514.504330000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = -0.322820000000000000
          Top = 549.740570000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = -3.322820000000000000
          Top = 582.756340000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          AllowVectorExport = True
          Left = -2.543290000000000000
          Top = 616.992580000000000000
          Width = 725.669760000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line21: TfrxLineView
          AllowVectorExport = True
          Top = 651.787880000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line22: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 687.685530000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line23: TfrxLineView
          AllowVectorExport = True
          Left = -1.070810000000000000
          Top = 799.614720000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line24: TfrxLineView
          AllowVectorExport = True
          Left = -3.968460000000000000
          Top = 723.142240000000000000
          Width = 725.669760000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line25: TfrxLineView
          AllowVectorExport = True
          Left = -2.307050000000000000
          Top = 761.158010000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line26: TfrxLineView
          AllowVectorExport = True
          Left = 1.236240000000000000
          Top = 837.410020000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line27: TfrxLineView
          AllowVectorExport = True
          Left = -4.984230000000000000
          Top = 930.425790000000000000
          Width = 725.669760000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line28: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 973.441560000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line29: TfrxLineView
          AllowVectorExport = True
          Left = 458.913730000000000000
          Top = 2.220470000000000000
          Height = 52.913420000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 128.590600000000000000
          Height = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          AllowVectorExport = True
          Left = 422.086890000000000000
          Top = 129.370130000000000000
          Height = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          AllowVectorExport = True
          Left = 505.457020000000000000
          Top = 56.913420000000000000
          Height = 71.811070000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          AllowVectorExport = True
          Left = 63.826840000000000000
          Top = 130.756030000000000000
          Height = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line34: TfrxLineView
          AllowVectorExport = True
          Left = 622.165430000000000000
          Top = 130.653680000000000000
          Height = 702.992580000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line35: TfrxLineView
          AllowVectorExport = True
          Left = 468.220780000000000000
          Top = 131.826840000000000000
          Height = 702.992580000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          AllowVectorExport = True
          Left = 561.031850000000000000
          Top = 130.669450000000000000
          Height = 702.992580000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          AllowVectorExport = True
          Left = 514.236550000000000000
          Top = 130.283550000000000000
          Height = 706.772110000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 461.134200000000000000
          Top = 18.897650000000000000
          Width = 257.008040000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line38: TfrxLineView
          AllowVectorExport = True
          Left = 604.724800000000000000
          Top = 2.236240000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 509.392768420000000000
          Top = 1.892263160000000000
          Width = 41.972675260000000000
          Height = 15.515965260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA')
          ParentFont = False
        end
        object Line39: TfrxLineView
          AllowVectorExport = True
          Left = 512.016080000000000000
          Top = 32.456710000000000000
          Width = -7.559060000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line40: TfrxLineView
          AllowVectorExport = True
          Left = 550.370440000000000000
          Top = 30.236240000000000000
          Width = -7.559060000000000000
          Height = 22.677180000000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 61.671402630000000000
          Width = 106.821453160000000000
          Height = 20.091185790000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FORNECEDOR')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 5.978452630000000000
          Top = 87.520571050000000000
          Width = 92.101178420000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ENDERE'#199'O')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 5.956905260000000000
          Top = 108.412834210000000000
          Width = 61.666015790000000000
          Height = 15.913810530000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'BAIRRO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 249.707157890000000000
          Top = 107.391286840000000000
          Width = 55.698336840000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CIDADE')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 436.759073680000000000
          Top = 107.391286840000000000
          Width = 23.870715790000000000
          Height = 20.091185790000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EST')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 565.177294740000000000
          Top = 58.628307890000000000
          Width = 69.821843680000000000
          Height = 15.317042630000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CONTATO')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 509.220389470000000000
          Top = 83.520571050000000000
          Width = 42.967288420000000000
          Height = 15.515965260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'NOM:')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 508.285031580000000000
          Top = 108.391286840000000000
          Width = 44.359746840000000000
          Height = 15.515965260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TEL:')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 12.000000000000000000
          Top = 132.240455260000000000
          Width = 36.402841580000000000
          Height = 19.096572630000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'COD')
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 142.482863160000000000
          Top = 135.218907890000000000
          Width = 88.918416320000000000
          Height = 15.515965260000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 564.940273680000000000
          Top = 132.262002630000000000
          Width = 50.924193680000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO')
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 645.617063160000000000
          Top = 133.262002630000000000
          Width = 41.176984740000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'OBS.')
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 394.953000000000000000
          Top = 133.262002630000000000
          Width = 16.709501050000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 435.672884210000000000
          Top = 133.262002630000000000
          Width = 20.489031050000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 482.392768420000000000
          Top = 133.240455260000000000
          Width = 19.892263160000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 525.155747370000000000
          Top = 133.240455260000000000
          Width = 27.252400530000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 163.396673680000000000
          Top = 941.995623680000000000
          Width = 383.721756320000000000
          Height = 20.290108420000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CONTATO: VIV. 995120085  CLA.978874719 TIM. 982515403')
        end
        object Line41: TfrxLineView
          AllowVectorExport = True
          Left = 86.929190000000000000
          Top = 839.055660000000000000
          Height = 90.708720000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          AllowVectorExport = True
          Left = 219.212740000000000000
          Top = 837.835190000000000000
          Height = 90.708720000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line43: TfrxLineView
          AllowVectorExport = True
          Left = 401.378170000000000000
          Top = 837.732840000000000000
          Height = 90.708720000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          AllowVectorExport = True
          Left = 580.205010000000000000
          Top = 837.850960000000000000
          Height = 68.031540000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 24.000000000000000000
          Top = 843.426571050000000000
          Width = 33.419002110000000000
          Height = 19.295495260000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Itens')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 115.482863160000000000
          Top = 841.405023680000000000
          Width = 91.902255790000000000
          Height = 23.273947890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Prev.Entrega')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 244.793347370000000000
          Top = 840.426571050000000000
          Width = 127.310484210000000000
          Height = 23.870715790000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Ass. do fornecedor')
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 437.759073680000000000
          Top = 842.383476320000000000
          Width = 116.369739470000000000
          Height = 22.876102630000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Ass. do recebedor')
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 600.854084210000000000
          Top = 843.405023680000000000
          Width = 100.455928950000000000
          Height = 22.876102630000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor do pedido')
        end
      end
      object Memo4: TfrxMemoView
        AllowVectorExport = True
        Left = 625.703252630000000000
        Top = 18.768365790000000000
        Width = 72.407837890000000000
        Height = 15.714887890000000000
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Frame.Typ = []
        Memo.UTF8W = (
          'N'#218'MERO')
        ParentFont = False
      end
    end
  end
  object frxPedCompra: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43654.453543194500000000
    ReportOptions.LastChange = 43655.093171284720000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxPedCompraGetValue
    Left = 752
    Top = 528
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
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
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 1.779530000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX - CONFEC'#199#213'ES')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 77.881880000000000000
          Top = 25.236240000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'COMPRAS  EFETUADAS NO PER'#205'ODO:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 392.409710000000000000
          Top = 25.015770000000000000
          Width = 200.315090000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Datrel]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 616.063390000000000000
          Width = 90.708720000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG:[Page#]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -2.220470000000000000
          Top = 48.692950000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -2.102350000000000000
          Top = 73.590600000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 6.559060000000000000
          Top = 50.913420000000000000
          Width = 30.236240000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Item')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 45.574830000000000000
          Top = 52.692950000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cod.Art.')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 194.283550000000000000
          Top = 51.692950000000000000
          Width = 68.031540000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 390.819110000000000000
          Top = 51.913420000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Quant.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 486.543600000000000000
          Top = 52.692950000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Custo')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 581.370440000000000000
          Top = 52.692950000000000000
          Width = 41.574830000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Valor')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 50.574830000000000000
          Top = 1.779530000000000000
          Width = 34.015770000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Doc:')
          ParentFont = False
        end
        object frxDBDataset1NUMPED: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 90.149660000000000000
          Top = 1.000000000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUMPED"]')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 186.858380000000000000
          Top = 1.559060000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Data:')
          ParentFont = False
        end
        object frxDBDataset1DATNOT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 230.244280000000000000
          Top = 1.779530000000000000
          Width = 79.370130000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATNOT"]')
          ParentFont = False
        end
        object frxDBDataset1FORNEC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 317.819110000000000000
          Top = 2.779530000000000000
          Width = 154.960730000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FORNEC"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 481.118430000000000000
          Top = 1.559060000000000000
          Width = 86.929190000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Total do Doc;')
          ParentFont = False
        end
        object frxDBDataset1VALNOT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 575.047620000000000000
          Top = 1.779530000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset1
          DataSetName = 'frxDBDataset1'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."VALNOT"]')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        Filter = '<frxDBDataset1."NUMPED">'
        RowCount = 0
        object frxDBDataset2ITEM: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 9.118120000000000000
          Top = 1.779530000000000000
          Width = 37.795300000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."ITEM"]')
        end
        object frxDBDataset2CODART: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 54.590600000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."CODART"]')
        end
        object frxDBDataset2DESCRICAO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 114.165430000000000000
          Width = 272.126160000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."DESCRICAO"]')
        end
        object frxDBDataset2CUSANT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 578.268090000000000000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
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
            '[frxDBDataset2."CUSANT"]')
          ParentFont = False
        end
        object frxDBDataset2QUANT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 393.071120000000000000
          Width = 60.472480000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
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
            '[frxDBDataset2."QUANT"]')
          ParentFont = False
        end
        object frxDBDataset2CUSTO: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 483.457020000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset2
          DataSetName = 'frxDBDataset2'
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
            '[frxDBDataset2."CUSTO"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 11.338590000000000000
        Top = 245.669450000000000000
        Width = 718.110700000000000000
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -1.881880000000000000
          Top = -3.000000000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATPED=DATPED'
      'TIPPED=TIPPED'
      'NUMPED=NUMPED'
      'FORNEC=FORNEC'
      'ENTREG=ENTREG'
      'TOTPED=TOTPED'
      'DATNOT=DATNOT'
      'TIPNOT=TIPNOT'
      'NUMNOT=NUMNOT'
      'DESCON=DESCON'
      'FRETE=FRETE'
      'VALNOT=VALNOT'
      'SITPED=SITPED'
      'PARCEL=PARCEL'
      'OBSERV=OBSERV')
    DataSet = IBTAuxcomp
    BCDToCurrency = False
    Left = 824
    Top = 528
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATPED=DATPED'
      'NUMPED=NUMPED'
      'ITEM=ITEM'
      'CODART=CODART'
      'DESCRICAO=DESCRICAO'
      'QUANT=QUANT'
      'CUSTO=CUSTO'
      'QTDANT=QTDANT'
      'CUSANT=CUSANT'
      'DESCON=DESCON'
      'TAMANHO=TAMANHO'
      'COR=COR'
      'OPER=OPER')
    DataSet = IBTAuxitcomp
    BCDToCurrency = False
    Left = 904
    Top = 528
  end
  object DtsAuxcomp: TDataSource
    DataSet = IBTAuxcomp
    Left = 480
    Top = 456
  end
  object DtsAuxitcomp: TDataSource
    DataSet = IBTAuxitcomp
    Left = 600
    Top = 456
  end
  object frxRelcompra: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43655.114926574080000000
    ReportOptions.LastChange = 43655.131200081020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = frxRelcompraGetValue
    Left = 696
    Top = 456
    Datasets = <
      item
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Relnotcomp: TfrxReportPage
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
        Height = 75.590600000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 102.047310000000000000
          Top = 3.779530000000000000
          Width = 483.779840000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX - RELA'#199#195'O DAS NOTAS DE COMPRA NO PERIODO')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 597.165740000000000000
          Top = 3.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'PAG: [PAGE#]')
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -0.661410000000000000
          Top = 49.133890000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = -1.220470000000000000
          Top = 72.370130000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 192.756030000000000000
          Top = 26.236240000000000000
          Width = 113.385900000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Periodo aferido:')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 311.700990000000000000
          Top = 27.015770000000000000
          Width = 204.094620000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Datrel]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 26.456710000000000000
          Top = 50.692950000000000000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DOC.')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 115.267780000000000000
          Top = 53.472480000000000000
          Width = 41.574830000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 214.196970000000000000
          Top = 51.692950000000000000
          Width = 120.944960000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FORNECEDOR')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 404.291590000000000000
          Top = 52.692950000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VAL.DOC.')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 550.354670000000000000
          Top = 52.692950000000000000
          Width = 113.385900000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'OBSERVA'#199#213'ES')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 154.960730000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset3
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object frxDBDataset3NUMPED: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 18.897650000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          DataField = 'NUMPED'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."NUMPED"]')
          ParentFont = False
        end
        object frxDBDataset3DATPED: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 94.606370000000000000
          Top = 1.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DataField = 'DATPED'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."DATPED"]')
          ParentFont = False
        end
        object frxDBDataset3FORNEC: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 198.094620000000000000
          Width = 196.535560000000000000
          Height = 18.897650000000000000
          DataField = 'FORNEC'
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."FORNEC"]')
          ParentFont = False
        end
        object frxDBDataset3VALNOT: TfrxMemoView
          IndexTag = 1
          AllowVectorExport = True
          Left = 400.630180000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          DataSet = frxDBDataset3
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."VALNOT"]')
          ParentFont = False
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 200.315090000000000000
        Width = 718.110700000000000000
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 127.590600000000000000
          Top = 1.220470000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL GERAL DAS COMPRAS -->')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 389.803340000000000000
          Top = 3.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = '%2.2n'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[SUM(<frxDBDataset3."VALNOT">,MasterData1)]')
          ParentFont = False
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = 0.338590000000000000
          Top = -1.000000000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object frxDBDataset3: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    FieldAliases.Strings = (
      'DATPED=DATPED'
      'TIPPED=TIPPED'
      'NUMPED=NUMPED'
      'FORNEC=FORNEC'
      'ENTREG=ENTREG'
      'TOTPED=TOTPED'
      'DATNOT=DATNOT'
      'TIPNOT=TIPNOT'
      'NUMNOT=NUMNOT'
      'DESCON=DESCON'
      'FRETE=FRETE'
      'VALNOT=VALNOT'
      'SITPED=SITPED'
      'PARCEL=PARCEL'
      'OBSERV=OBSERV')
    DataSet = IBTAuxcomp
    BCDToCurrency = False
    Left = 768
    Top = 456
  end
end
