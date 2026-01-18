object FrmFilial_cli: TFrmFilial_cli
  Left = 120
  Top = 21
  Caption = 
    'SEARCH Inform'#180'tica                                   IMPORTA'#199#195'O ' +
    'DE CLIENTES DAS FILIAIS'
  ClientHeight = 473
  ClientWidth = 841
  Color = clYellow
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel
    Left = 15
    Top = 185
    Width = 91
    Height = 19
    Caption = 'IMPORTAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 31
    Top = 75
    Width = 65
    Height = 19
    Caption = 'BAIXAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 9
    Top = 8
    Width = 825
    Height = 57
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 24
      Width = 43
      Height = 16
      Caption = 'FILTRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 231
      Top = 20
      Width = 70
      Height = 16
      Caption = 'PROCURAR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 320
      Top = 11
      Width = 417
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
      Left = 750
      Top = 11
      Width = 65
      Height = 31
      Color = clGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object ComboBox1: TComboBox
      Left = 64
      Top = 11
      Width = 145
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Items.Strings = (
        'CODCLI'
        'NOME'
        'CPF'
        'IDENT')
    end
  end
  object Button1: TButton
    Left = 8
    Top = 95
    Width = 113
    Height = 67
    Caption = 'ARQ.INT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 206
    Width = 113
    Height = 67
    Caption = 'CLIENTE'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 279
    Width = 113
    Height = 67
    Caption = 'LIMP.ARQ.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button3Click
  end
  object DBGrid1: TDBGrid
    Left = 127
    Top = 71
    Width = 706
    Height = 394
    Color = clNavy
    DataSource = IBDsAPesq_cli
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'NOME'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '                   NOME'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 291
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'NCPF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Title.Caption = '         CPF'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 157
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'NIFP'
        ReadOnly = True
        Title.Caption = '     IDENT.'
        Title.Color = clCream
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clNone
        Title.Font.Height = -13
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 140
        Visible = True
      end
      item
        Color = clBlack
        Expanded = False
        FieldName = 'DATIMP'
        Title.Caption = '    DATIMP'
        Width = 91
        Visible = True
      end>
  end
  object IBDsAPesq_cli: TDataSource
    DataSet = IBQAPesq_cli
    Left = 72
    Top = 424
  end
  object AIBQCliente: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXCLIENTE')
    Left = 80
    Top = 352
    object AIBQClienteCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXCLIENTE"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object AIBQClienteNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"AUXCLIENTE"."NCPF"'
      Size = 15
    end
    object AIBQClienteNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"AUXCLIENTE"."NIFP"'
      Size = 15
    end
    object AIBQClienteBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"AUXCLIENTE"."BAIR"'
    end
    object AIBQClienteCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"AUXCLIENTE"."CIDA"'
    end
    object AIBQClienteESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"AUXCLIENTE"."ESTA"'
      Size = 2
    end
    object AIBQClienteNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"AUXCLIENTE"."NCEP"'
      Size = 9
    end
    object AIBQClienteNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"AUXCLIENTE"."NTEL"'
      Size = 30
    end
    object AIBQClienteCONTA: TIBStringField
      FieldName = 'CONTA'
      Origin = '"AUXCLIENTE"."CONTA"'
      Size = 30
    end
    object AIBQClienteVEND: TIBStringField
      FieldName = 'VEND'
      Origin = '"AUXCLIENTE"."VEND"'
      Size = 3
    end
    object AIBQClienteLCRED: TIBBCDField
      FieldName = 'LCRED'
      Origin = '"AUXCLIENTE"."LCRED"'
      Precision = 18
      Size = 2
    end
    object AIBQClienteDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Origin = '"AUXCLIENTE"."DATIMP"'
      Size = 10
    end
    object AIBQClienteNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Origin = '"AUXCLIENTE"."NOMMAE"'
      Size = 35
    end
    object AIBQClienteNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Origin = '"AUXCLIENTE"."NOMPAI"'
      Size = 35
    end
    object AIBQClienteDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Origin = '"AUXCLIENTE"."DATNASC"'
      Size = 10
    end
    object AIBQClienteNATU: TIBStringField
      FieldName = 'NATU'
      Origin = '"AUXCLIENTE"."NATU"'
      Size = 2
    end
    object AIBQClienteROTA: TIBStringField
      FieldName = 'ROTA'
      Origin = '"AUXCLIENTE"."ROTA"'
      Size = 3
    end
    object AIBQClientePRACA: TIBStringField
      FieldName = 'PRACA'
      Origin = '"AUXCLIENTE"."PRACA"'
      Size = 3
    end
    object AIBQClienteREFER: TIBStringField
      FieldName = 'REFER'
      Origin = '"AUXCLIENTE"."REFER"'
      Size = 40
    end
    object AIBQClienteOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Origin = '"AUXCLIENTE"."OLDCLI"'
      Size = 4
    end
    object AIBQClienteSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXCLIENTE"."SITU"'
      Size = 1
    end
    object AIBQClienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"AUXCLIENTE"."NOME"'
      Size = 50
    end
    object AIBQClienteENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"AUXCLIENTE"."ENDE"'
      Size = 60
    end
    object AIBQClienteHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Origin = '"AUXCLIENTE"."HORAIN"'
      Size = 5
    end
    object AIBQClienteHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Origin = '"AUXCLIENTE"."HORAFIN"'
      Size = 5
    end
    object AIBQClienteVISITA: TIBStringField
      FieldName = 'VISITA'
      Origin = '"AUXCLIENTE"."VISITA"'
      Size = 12
    end
    object AIBQClienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"AUXCLIENTE"."ATIVO"'
      Size = 1
    end
    object AIBQClienteESPED: TIBStringField
      FieldName = 'ESPED'
      Origin = '"AUXCLIENTE"."ESPED"'
      Size = 6
    end
    object AIBQClienteOBSV: TBlobField
      FieldName = 'OBSV'
      Origin = '"AUXCLIENTE"."OBSV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBQAPesq_cli: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXCLIENTE')
    Left = 24
    Top = 400
    object IBQAPesq_cliCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"AUXCLIENTE"."CODCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAPesq_cliNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"AUXCLIENTE"."NCPF"'
      Size = 15
    end
    object IBQAPesq_cliNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"AUXCLIENTE"."NIFP"'
      Size = 15
    end
    object IBQAPesq_cliBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"AUXCLIENTE"."BAIR"'
    end
    object IBQAPesq_cliCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"AUXCLIENTE"."CIDA"'
    end
    object IBQAPesq_cliESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"AUXCLIENTE"."ESTA"'
      Size = 2
    end
    object IBQAPesq_cliNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"AUXCLIENTE"."NCEP"'
      Size = 9
    end
    object IBQAPesq_cliNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"AUXCLIENTE"."NTEL"'
      Size = 30
    end
    object IBQAPesq_cliCONTA: TIBStringField
      FieldName = 'CONTA'
      Origin = '"AUXCLIENTE"."CONTA"'
      Size = 30
    end
    object IBQAPesq_cliVEND: TIBStringField
      FieldName = 'VEND'
      Origin = '"AUXCLIENTE"."VEND"'
      Size = 3
    end
    object IBQAPesq_cliLCRED: TIBBCDField
      FieldName = 'LCRED'
      Origin = '"AUXCLIENTE"."LCRED"'
      Precision = 18
      Size = 2
    end
    object IBQAPesq_cliDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Origin = '"AUXCLIENTE"."DATIMP"'
      Size = 10
    end
    object IBQAPesq_cliNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Origin = '"AUXCLIENTE"."NOMMAE"'
      Size = 35
    end
    object IBQAPesq_cliNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Origin = '"AUXCLIENTE"."NOMPAI"'
      Size = 35
    end
    object IBQAPesq_cliDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Origin = '"AUXCLIENTE"."DATNASC"'
      Size = 10
    end
    object IBQAPesq_cliNATU: TIBStringField
      FieldName = 'NATU'
      Origin = '"AUXCLIENTE"."NATU"'
      Size = 2
    end
    object IBQAPesq_cliROTA: TIBStringField
      FieldName = 'ROTA'
      Origin = '"AUXCLIENTE"."ROTA"'
      Size = 3
    end
    object IBQAPesq_cliPRACA: TIBStringField
      FieldName = 'PRACA'
      Origin = '"AUXCLIENTE"."PRACA"'
      Size = 3
    end
    object IBQAPesq_cliREFER: TIBStringField
      FieldName = 'REFER'
      Origin = '"AUXCLIENTE"."REFER"'
      Size = 40
    end
    object IBQAPesq_cliOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Origin = '"AUXCLIENTE"."OLDCLI"'
      Size = 4
    end
    object IBQAPesq_cliSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXCLIENTE"."SITU"'
      Size = 1
    end
    object IBQAPesq_cliNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"AUXCLIENTE"."NOME"'
      Size = 50
    end
    object IBQAPesq_cliENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"AUXCLIENTE"."ENDE"'
      Size = 60
    end
    object IBQAPesq_cliHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Origin = '"AUXCLIENTE"."HORAIN"'
      Size = 5
    end
    object IBQAPesq_cliHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Origin = '"AUXCLIENTE"."HORAFIN"'
      Size = 5
    end
    object IBQAPesq_cliVISITA: TIBStringField
      FieldName = 'VISITA'
      Origin = '"AUXCLIENTE"."VISITA"'
      Size = 12
    end
    object IBQAPesq_cliATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"AUXCLIENTE"."ATIVO"'
      Size = 1
    end
    object IBQAPesq_cliESPED: TIBStringField
      FieldName = 'ESPED'
      Origin = '"AUXCLIENTE"."ESPED"'
      Size = 6
    end
    object IBQAPesq_cliOBSV: TBlobField
      FieldName = 'OBSV'
      Origin = '"AUXCLIENTE"."OBSV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object AIBTCliente: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXCLIENTE'
    UniDirectional = False
    Left = 16
    Top = 352
    object AIBTClienteCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Required = True
      Size = 4
    end
    object AIBTClienteNCPF: TIBStringField
      FieldName = 'NCPF'
      Size = 15
    end
    object AIBTClienteNIFP: TIBStringField
      FieldName = 'NIFP'
      Size = 15
    end
    object AIBTClienteBAIR: TIBStringField
      FieldName = 'BAIR'
    end
    object AIBTClienteCIDA: TIBStringField
      FieldName = 'CIDA'
    end
    object AIBTClienteESTA: TIBStringField
      FieldName = 'ESTA'
      Size = 2
    end
    object AIBTClienteNCEP: TIBStringField
      FieldName = 'NCEP'
      Size = 9
    end
    object AIBTClienteNTEL: TIBStringField
      FieldName = 'NTEL'
      Size = 30
    end
    object AIBTClienteCONTA: TIBStringField
      FieldName = 'CONTA'
      Size = 30
    end
    object AIBTClienteVEND: TIBStringField
      FieldName = 'VEND'
      Size = 3
    end
    object AIBTClienteLCRED: TIBBCDField
      FieldName = 'LCRED'
      Precision = 18
      Size = 2
    end
    object AIBTClienteDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Size = 10
    end
    object AIBTClienteNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Size = 35
    end
    object AIBTClienteNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Size = 35
    end
    object AIBTClienteDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Size = 10
    end
    object AIBTClienteNATU: TIBStringField
      FieldName = 'NATU'
      Size = 2
    end
    object AIBTClienteROTA: TIBStringField
      FieldName = 'ROTA'
      Size = 3
    end
    object AIBTClientePRACA: TIBStringField
      FieldName = 'PRACA'
      Size = 3
    end
    object AIBTClienteREFER: TIBStringField
      FieldName = 'REFER'
      Size = 40
    end
    object AIBTClienteOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Size = 4
    end
    object AIBTClienteSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object AIBTClienteNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object AIBTClienteENDE: TIBStringField
      FieldName = 'ENDE'
      Size = 60
    end
    object AIBTClienteHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Size = 5
    end
    object AIBTClienteHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Size = 5
    end
    object AIBTClienteVISITA: TIBStringField
      FieldName = 'VISITA'
      Size = 12
    end
    object AIBTClienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object AIBTClienteESPED: TIBStringField
      FieldName = 'ESPED'
      Size = 6
    end
    object AIBTClienteOBSV: TBlobField
      FieldName = 'OBSV'
    end
  end
end
