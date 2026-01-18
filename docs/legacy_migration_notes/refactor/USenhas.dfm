object FrmSenhas: TFrmSenhas
  Left = 134
  Top = 61
  Caption = 'FrmSenhas'
  ClientHeight = 491
  ClientWidth = 710
  Color = clGray
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
  object Label1: TLabel
    Left = 32
    Top = 8
    Width = 48
    Height = 19
    Caption = 'NOME'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 474
    Top = 8
    Width = 56
    Height = 19
    Caption = 'SENHA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object PageControl1: TPageControl
    Left = 7
    Top = 39
    Width = 694
    Height = 444
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = '         OP'#199#213'ES - 1                   '
      object Label4: TLabel
        Left = 47
        Top = 153
        Width = 70
        Height = 18
        Caption = 'ARTIGOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 202
        Top = 39
        Width = 67
        Height = 18
        Caption = 'TABELAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 179
        Top = 153
        Width = 125
        Height = 18
        Caption = 'FORNECEDORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 365
        Top = 8
        Width = 75
        Height = 18
        Caption = 'CLIENTES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 368
        Top = 206
        Width = 106
        Height = 18
        Caption = 'SOLICITA'#199#195'O'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 544
        Top = 0
        Width = 104
        Height = 18
        Caption = 'VENDEDORES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label10: TLabel
        Left = 553
        Top = 103
        Width = 60
        Height = 18
        Caption = 'PEDIDO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 53
        Top = 8
        Width = 73
        Height = 18
        Caption = 'FUN'#199#213'ES'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CBxUtil: TCheckListBox
        Left = 20
        Top = 25
        Width = 130
        Height = 122
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Senhas'
          'Ajustes'
          'Exportar'
          'Importar'
          'Gerencia'
          'Utilitarios')
        ParentFont = False
        TabOrder = 0
        OnExit = CBxUtilExit
      end
      object CbxProd1: TCheckListBox
        Left = 20
        Top = 172
        Width = 130
        Height = 171
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Incluir'
          'Alterar'
          'Consultar'
          'Excluir'
          'Contagem'
          'Rel.Cadastro'
          'Etiquetas'
          'Cadastrao'
          'Rel artigos')
        ParentFont = False
        TabOrder = 4
        OnExit = CbxProd1Exit
      end
      object CbxTab1: TCheckListBox
        Left = 156
        Top = 61
        Width = 160
        Height = 68
        Color = clYellow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNone
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Grupos'
          'Unidades'
          'Pra'#231'as')
        ParentFont = False
        TabOrder = 1
        OnClick = CbxTab1Click
      end
      object CbxFor1: TCheckListBox
        Left = 160
        Top = 172
        Width = 160
        Height = 178
        Color = clGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Incluir'
          'Alterar'
          'Consultar'
          'Excluir'
          'Pedido de compra'
          'Recebimento'
          'Rel por nota'
          'Rel de notas')
        ParentFont = False
        TabOrder = 5
        OnExit = CbxFor1Exit
      end
      object CbxCli1: TCheckListBox
        Left = 335
        Top = 27
        Width = 163
        Height = 174
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Incluir'
          'Alterar'
          'Consultar'
          'Excluir'
          'Ativar'
          'Cadastro'
          'Cliente/praca'
          'Pedidos pend'
          'Mapas')
        ParentFont = False
        TabOrder = 2
        OnExit = CbxCli1Exit
      end
      object CbxSol1: TCheckListBox
        Left = 335
        Top = 223
        Width = 163
        Height = 126
        Color = clSkyBlue
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Incluir'
          'Alterar'
          'Consultar'
          'Excluir'
          'Tabular'
          'Sol.Limpa')
        ParentFont = False
        TabOrder = 6
        OnExit = CbxSol1Exit
      end
      object CbxVend1: TCheckListBox
        Left = 517
        Top = 18
        Width = 148
        Height = 85
        Color = clMoneyGreen
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Incluir'
          'Alterar'
          'Consultar/Exc'
          'Mapas')
        ParentFont = False
        TabOrder = 3
        OnClick = CbxVend1Click
      end
      object CbxPed1: TCheckListBox
        Left = 517
        Top = 118
        Width = 148
        Height = 203
        Color = clOlive
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Implantar'
          'Alterar'
          'Consultar'
          'Excluir'
          'Retornar'
          'Baixa Resido'
          'Perdidos'
          'Pedidos'
          'Etiquetas'
          'Ped.Faixa'
          'Desfaz retorno')
        ParentFont = False
        TabOrder = 7
        OnExit = CbxPed1Exit
      end
    end
    object TabSheet2: TTabSheet
      Caption = '          OP'#199#213'ES - 2                  '
      ImageIndex = 1
      object Label11: TLabel
        Left = 118
        Top = 17
        Width = 53
        Height = 18
        Caption = 'NOTAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 524
        Top = 17
        Width = 53
        Height = 18
        Caption = 'MAPAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 309
        Top = 17
        Width = 79
        Height = 18
        Caption = 'DESPESAS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object CbxMov1: TCheckListBox
        Left = 77
        Top = 36
        Width = 149
        Height = 58
        Color = clMaroon
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Dev.Cobran'#231'a'
          'Defeitos')
        ParentFont = False
        TabOrder = 0
        OnExit = CbxMov1Exit
      end
      object CbxPag1: TCheckListBox
        Left = 262
        Top = 39
        Width = 168
        Height = 84
        Color = clTeal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Lan'#231'amento direto'
          'Baixa Lan'#231'amento'
          'Fluxo Pagamento')
        ParentFont = False
        TabOrder = 1
        OnExit = CbxPag1Exit
      end
      object CbxGer1: TCheckListBox
        Left = 463
        Top = 41
        Width = 203
        Height = 152
        Color = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ItemHeight = 18
        Items.Strings = (
          'Rel.Pedidos (X,E,R)'
          'Ped.com Resido'
          'Cobran'#231'a efetuada'
          'Mov. do Vendedor'
          'Relat.Pedidos'
          'Extrato Cli.'
          'Mov.Cliente')
        ParentFont = False
        TabOrder = 2
        OnExit = CbxGer1Exit
      end
    end
  end
  object Edit1: TEdit
    Left = 88
    Top = 5
    Width = 353
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 538
    Top = 5
    Width = 151
    Height = 31
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    PasswordChar = '#'
    TabOrder = 1
  end
  object Button1: TButton
    Left = 31
    Top = 424
    Width = 293
    Height = 44
    Caption = 'IMPANTAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 380
    Top = 424
    Width = 296
    Height = 44
    Caption = 'RESTAURAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button2Click
  end
  object IBQuery1: TIBQuery
    Database = DModRosa.IBDatabase1
    Transaction = DModRosa.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ARQLOGIN'
      'Where Nome=:Nom_digit')
    Left = 340
    Top = 414
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'Nom_digit'
        ParamType = ptUnknown
      end>
    object IBQuery1NOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"ARQLOGIN"."NOME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object IBQuery1SENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"ARQLOGIN"."SENHA"'
      Size = 6
    end
    object IBQuery1SENHAS: TIBStringField
      FieldName = 'SENHAS'
      Origin = '"ARQLOGIN"."SENHAS"'
      Size = 1
    end
    object IBQuery1COL001: TIBStringField
      FieldName = 'COL001'
      Origin = '"ARQLOGIN"."COL001"'
      Size = 1
    end
    object IBQuery1COL002: TIBStringField
      FieldName = 'COL002'
      Origin = '"ARQLOGIN"."COL002"'
      Size = 1
    end
    object IBQuery1COL003: TIBStringField
      FieldName = 'COL003'
      Origin = '"ARQLOGIN"."COL003"'
      Size = 1
    end
    object IBQuery1COL004: TIBStringField
      FieldName = 'COL004'
      Origin = '"ARQLOGIN"."COL004"'
      Size = 1
    end
    object IBQuery1COL005: TIBStringField
      FieldName = 'COL005'
      Origin = '"ARQLOGIN"."COL005"'
      Size = 1
    end
    object IBQuery1COL006: TIBStringField
      FieldName = 'COL006'
      Origin = '"ARQLOGIN"."COL006"'
      Size = 1
    end
    object IBQuery1COL007: TIBStringField
      FieldName = 'COL007'
      Origin = '"ARQLOGIN"."COL007"'
      Size = 1
    end
    object IBQuery1COL008: TIBStringField
      FieldName = 'COL008'
      Origin = '"ARQLOGIN"."COL008"'
      Size = 1
    end
    object IBQuery1COL009: TIBStringField
      FieldName = 'COL009'
      Origin = '"ARQLOGIN"."COL009"'
      Size = 1
    end
    object IBQuery1COL010: TIBStringField
      FieldName = 'COL010'
      Origin = '"ARQLOGIN"."COL010"'
      Size = 1
    end
    object IBQuery1COL011: TIBStringField
      FieldName = 'COL011'
      Origin = '"ARQLOGIN"."COL011"'
      Size = 1
    end
    object IBQuery1COL012: TIBStringField
      FieldName = 'COL012'
      Origin = '"ARQLOGIN"."COL012"'
      Size = 1
    end
    object IBQuery1COL013: TIBStringField
      FieldName = 'COL013'
      Origin = '"ARQLOGIN"."COL013"'
      Size = 1
    end
    object IBQuery1COL014: TIBStringField
      FieldName = 'COL014'
      Origin = '"ARQLOGIN"."COL014"'
      Size = 1
    end
    object IBQuery1COL015: TIBStringField
      FieldName = 'COL015'
      Origin = '"ARQLOGIN"."COL015"'
      Size = 1
    end
    object IBQuery1COL016: TIBStringField
      FieldName = 'COL016'
      Origin = '"ARQLOGIN"."COL016"'
      Size = 1
    end
    object IBQuery1COL017: TIBStringField
      FieldName = 'COL017'
      Origin = '"ARQLOGIN"."COL017"'
      Size = 1
    end
    object IBQuery1COL018: TIBStringField
      FieldName = 'COL018'
      Origin = '"ARQLOGIN"."COL018"'
      Size = 1
    end
    object IBQuery1COL019: TIBStringField
      FieldName = 'COL019'
      Origin = '"ARQLOGIN"."COL019"'
      Size = 1
    end
    object IBQuery1COL020: TIBStringField
      FieldName = 'COL020'
      Origin = '"ARQLOGIN"."COL020"'
      Size = 1
    end
    object IBQuery1COL021: TIBStringField
      FieldName = 'COL021'
      Origin = '"ARQLOGIN"."COL021"'
      Size = 1
    end
    object IBQuery1COL022: TIBStringField
      FieldName = 'COL022'
      Origin = '"ARQLOGIN"."COL022"'
      Size = 1
    end
    object IBQuery1COL023: TIBStringField
      FieldName = 'COL023'
      Origin = '"ARQLOGIN"."COL023"'
      Size = 1
    end
    object IBQuery1COL024: TIBStringField
      FieldName = 'COL024'
      Origin = '"ARQLOGIN"."COL024"'
      Size = 1
    end
    object IBQuery1COL025: TIBStringField
      FieldName = 'COL025'
      Origin = '"ARQLOGIN"."COL025"'
      Size = 1
    end
    object IBQuery1COL026: TIBStringField
      FieldName = 'COL026'
      Origin = '"ARQLOGIN"."COL026"'
      Size = 1
    end
    object IBQuery1COL027: TIBStringField
      FieldName = 'COL027'
      Origin = '"ARQLOGIN"."COL027"'
      Size = 1
    end
    object IBQuery1COL028: TIBStringField
      FieldName = 'COL028'
      Origin = '"ARQLOGIN"."COL028"'
      Size = 1
    end
    object IBQuery1COL029: TIBStringField
      FieldName = 'COL029'
      Origin = '"ARQLOGIN"."COL029"'
      Size = 1
    end
    object IBQuery1COL030: TIBStringField
      FieldName = 'COL030'
      Origin = '"ARQLOGIN"."COL030"'
      Size = 1
    end
    object IBQuery1COL031: TIBStringField
      FieldName = 'COL031'
      Origin = '"ARQLOGIN"."COL031"'
      Size = 1
    end
    object IBQuery1COL032: TIBStringField
      FieldName = 'COL032'
      Origin = '"ARQLOGIN"."COL032"'
      Size = 1
    end
    object IBQuery1COL033: TIBStringField
      FieldName = 'COL033'
      Origin = '"ARQLOGIN"."COL033"'
      Size = 1
    end
    object IBQuery1COL034: TIBStringField
      FieldName = 'COL034'
      Origin = '"ARQLOGIN"."COL034"'
      Size = 1
    end
    object IBQuery1COL035: TIBStringField
      FieldName = 'COL035'
      Origin = '"ARQLOGIN"."COL035"'
      Size = 1
    end
    object IBQuery1COL036: TIBStringField
      FieldName = 'COL036'
      Origin = '"ARQLOGIN"."COL036"'
      Size = 1
    end
    object IBQuery1COL037: TIBStringField
      FieldName = 'COL037'
      Origin = '"ARQLOGIN"."COL037"'
      Size = 1
    end
    object IBQuery1COL038: TIBStringField
      FieldName = 'COL038'
      Origin = '"ARQLOGIN"."COL038"'
      Size = 1
    end
    object IBQuery1COL039: TIBStringField
      FieldName = 'COL039'
      Origin = '"ARQLOGIN"."COL039"'
      Size = 1
    end
    object IBQuery1COL040: TIBStringField
      FieldName = 'COL040'
      Origin = '"ARQLOGIN"."COL040"'
      Size = 1
    end
    object IBQuery1COL041: TIBStringField
      FieldName = 'COL041'
      Origin = '"ARQLOGIN"."COL041"'
      Size = 1
    end
    object IBQuery1COL042: TIBStringField
      FieldName = 'COL042'
      Origin = '"ARQLOGIN"."COL042"'
      Size = 1
    end
    object IBQuery1COL043: TIBStringField
      FieldName = 'COL043'
      Origin = '"ARQLOGIN"."COL043"'
      Size = 1
    end
    object IBQuery1COL044: TIBStringField
      FieldName = 'COL044'
      Origin = '"ARQLOGIN"."COL044"'
      Size = 1
    end
    object IBQuery1COL045: TIBStringField
      FieldName = 'COL045'
      Origin = '"ARQLOGIN"."COL045"'
      Size = 1
    end
    object IBQuery1COL046: TIBStringField
      FieldName = 'COL046'
      Origin = '"ARQLOGIN"."COL046"'
      Size = 1
    end
    object IBQuery1COL047: TIBStringField
      FieldName = 'COL047'
      Origin = '"ARQLOGIN"."COL047"'
      Size = 1
    end
    object IBQuery1COL048: TIBStringField
      FieldName = 'COL048'
      Origin = '"ARQLOGIN"."COL048"'
      Size = 1
    end
    object IBQuery1COL049: TIBStringField
      FieldName = 'COL049'
      Origin = '"ARQLOGIN"."COL049"'
      Size = 1
    end
    object IBQuery1COL050: TIBStringField
      FieldName = 'COL050'
      Origin = '"ARQLOGIN"."COL050"'
      Size = 1
    end
    object IBQuery1COL051: TIBStringField
      FieldName = 'COL051'
      Origin = '"ARQLOGIN"."COL051"'
      Size = 1
    end
    object IBQuery1COL052: TIBStringField
      FieldName = 'COL052'
      Origin = '"ARQLOGIN"."COL052"'
      Size = 1
    end
    object IBQuery1COL053: TIBStringField
      FieldName = 'COL053'
      Origin = '"ARQLOGIN"."COL053"'
      Size = 1
    end
    object IBQuery1COL054: TIBStringField
      FieldName = 'COL054'
      Origin = '"ARQLOGIN"."COL054"'
      Size = 1
    end
    object IBQuery1COL055: TIBStringField
      FieldName = 'COL055'
      Origin = '"ARQLOGIN"."COL055"'
      Size = 1
    end
    object IBQuery1COL056: TIBStringField
      FieldName = 'COL056'
      Origin = '"ARQLOGIN"."COL056"'
      Size = 1
    end
    object IBQuery1COL057: TIBStringField
      FieldName = 'COL057'
      Origin = '"ARQLOGIN"."COL057"'
      Size = 1
    end
    object IBQuery1COL058: TIBStringField
      FieldName = 'COL058'
      Origin = '"ARQLOGIN"."COL058"'
      Size = 1
    end
    object IBQuery1COL059: TIBStringField
      FieldName = 'COL059'
      Origin = '"ARQLOGIN"."COL059"'
      Size = 1
    end
    object IBQuery1COL060: TIBStringField
      FieldName = 'COL060'
      Origin = '"ARQLOGIN"."COL060"'
      Size = 1
    end
    object IBQuery1COL061: TIBStringField
      FieldName = 'COL061'
      Origin = '"ARQLOGIN"."COL061"'
      Size = 1
    end
    object IBQuery1COL062: TIBStringField
      FieldName = 'COL062'
      Origin = '"ARQLOGIN"."COL062"'
      Size = 1
    end
    object IBQuery1COL063: TIBStringField
      FieldName = 'COL063'
      Origin = '"ARQLOGIN"."COL063"'
      Size = 1
    end
    object IBQuery1COL064: TIBStringField
      FieldName = 'COL064'
      Origin = '"ARQLOGIN"."COL064"'
      Size = 1
    end
    object IBQuery1COL065: TIBStringField
      FieldName = 'COL065'
      Origin = '"ARQLOGIN"."COL065"'
      Size = 1
    end
    object IBQuery1COL066: TIBStringField
      FieldName = 'COL066'
      Origin = '"ARQLOGIN"."COL066"'
      Size = 1
    end
    object IBQuery1COL067: TIBStringField
      FieldName = 'COL067'
      Origin = '"ARQLOGIN"."COL067"'
      Size = 1
    end
    object IBQuery1COL068: TIBStringField
      FieldName = 'COL068'
      Origin = '"ARQLOGIN"."COL068"'
      Size = 1
    end
    object IBQuery1COL069: TIBStringField
      FieldName = 'COL069'
      Origin = '"ARQLOGIN"."COL069"'
      Size = 1
    end
    object IBQuery1COL070: TIBStringField
      FieldName = 'COL070'
      Origin = '"ARQLOGIN"."COL070"'
      Size = 1
    end
    object IBQuery1COL071: TIBStringField
      FieldName = 'COL071'
      Origin = '"ARQLOGIN"."COL071"'
      Size = 1
    end
    object IBQuery1COL072: TIBStringField
      FieldName = 'COL072'
      Origin = '"ARQLOGIN"."COL072"'
      Size = 1
    end
    object IBQuery1COL073: TIBStringField
      FieldName = 'COL073'
      Origin = '"ARQLOGIN"."COL073"'
      Size = 1
    end
    object IBQuery1COL074: TIBStringField
      FieldName = 'COL074'
      Origin = '"ARQLOGIN"."COL074"'
      Size = 1
    end
    object IBQuery1COL075: TIBStringField
      FieldName = 'COL075'
      Origin = '"ARQLOGIN"."COL075"'
      Size = 1
    end
    object IBQuery1COL076: TIBStringField
      FieldName = 'COL076'
      Origin = '"ARQLOGIN"."COL076"'
      Size = 1
    end
    object IBQuery1COL077: TIBStringField
      FieldName = 'COL077'
      Origin = '"ARQLOGIN"."COL077"'
      Size = 1
    end
    object IBQuery1COL078: TIBStringField
      FieldName = 'COL078'
      Origin = '"ARQLOGIN"."COL078"'
      Size = 1
    end
    object IBQuery1COL079: TIBStringField
      FieldName = 'COL079'
      Origin = '"ARQLOGIN"."COL079"'
      Size = 1
    end
    object IBQuery1COL080: TIBStringField
      FieldName = 'COL080'
      Origin = '"ARQLOGIN"."COL080"'
      Size = 1
    end
    object IBQuery1DATXI: TIBStringField
      FieldName = 'DATXI'
      Origin = '"ARQLOGIN"."DATXI"'
      Size = 10
    end
    object IBQuery1DATXL: TIBStringField
      FieldName = 'DATXL'
      Origin = '"ARQLOGIN"."DATXL"'
      Size = 10
    end
  end
  object IBQuery2: TIBQuery
    Database = DModRosa.IBDatabase1
    Transaction = DModRosa.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select *  from ARQLOGIN'
      'Order by Nome')
    Left = 298
    Top = 68
    object IBQuery2NOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"ARQLOGIN"."NOME"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 12
    end
    object IBQuery2SENHA: TIBStringField
      FieldName = 'SENHA'
      Origin = '"ARQLOGIN"."SENHA"'
      Size = 6
    end
    object IBQuery2SENHAS: TIBStringField
      FieldName = 'SENHAS'
      Origin = '"ARQLOGIN"."SENHAS"'
      Size = 1
    end
    object IBQuery2COL001: TIBStringField
      FieldName = 'COL001'
      Origin = '"ARQLOGIN"."COL001"'
      Size = 1
    end
    object IBQuery2COL002: TIBStringField
      FieldName = 'COL002'
      Origin = '"ARQLOGIN"."COL002"'
      Size = 1
    end
    object IBQuery2COL003: TIBStringField
      FieldName = 'COL003'
      Origin = '"ARQLOGIN"."COL003"'
      Size = 1
    end
    object IBQuery2COL004: TIBStringField
      FieldName = 'COL004'
      Origin = '"ARQLOGIN"."COL004"'
      Size = 1
    end
    object IBQuery2COL005: TIBStringField
      FieldName = 'COL005'
      Origin = '"ARQLOGIN"."COL005"'
      Size = 1
    end
    object IBQuery2COL006: TIBStringField
      FieldName = 'COL006'
      Origin = '"ARQLOGIN"."COL006"'
      Size = 1
    end
    object IBQuery2COL007: TIBStringField
      FieldName = 'COL007'
      Origin = '"ARQLOGIN"."COL007"'
      Size = 1
    end
    object IBQuery2COL008: TIBStringField
      FieldName = 'COL008'
      Origin = '"ARQLOGIN"."COL008"'
      Size = 1
    end
    object IBQuery2COL009: TIBStringField
      FieldName = 'COL009'
      Origin = '"ARQLOGIN"."COL009"'
      Size = 1
    end
    object IBQuery2COL010: TIBStringField
      FieldName = 'COL010'
      Origin = '"ARQLOGIN"."COL010"'
      Size = 1
    end
    object IBQuery2COL011: TIBStringField
      FieldName = 'COL011'
      Origin = '"ARQLOGIN"."COL011"'
      Size = 1
    end
    object IBQuery2COL012: TIBStringField
      FieldName = 'COL012'
      Origin = '"ARQLOGIN"."COL012"'
      Size = 1
    end
    object IBQuery2COL013: TIBStringField
      FieldName = 'COL013'
      Origin = '"ARQLOGIN"."COL013"'
      Size = 1
    end
    object IBQuery2COL014: TIBStringField
      FieldName = 'COL014'
      Origin = '"ARQLOGIN"."COL014"'
      Size = 1
    end
    object IBQuery2COL015: TIBStringField
      FieldName = 'COL015'
      Origin = '"ARQLOGIN"."COL015"'
      Size = 1
    end
    object IBQuery2COL016: TIBStringField
      FieldName = 'COL016'
      Origin = '"ARQLOGIN"."COL016"'
      Size = 1
    end
    object IBQuery2COL017: TIBStringField
      FieldName = 'COL017'
      Origin = '"ARQLOGIN"."COL017"'
      Size = 1
    end
    object IBQuery2COL018: TIBStringField
      FieldName = 'COL018'
      Origin = '"ARQLOGIN"."COL018"'
      Size = 1
    end
    object IBQuery2COL019: TIBStringField
      FieldName = 'COL019'
      Origin = '"ARQLOGIN"."COL019"'
      Size = 1
    end
    object IBQuery2COL020: TIBStringField
      FieldName = 'COL020'
      Origin = '"ARQLOGIN"."COL020"'
      Size = 1
    end
    object IBQuery2COL021: TIBStringField
      FieldName = 'COL021'
      Origin = '"ARQLOGIN"."COL021"'
      Size = 1
    end
    object IBQuery2COL022: TIBStringField
      FieldName = 'COL022'
      Origin = '"ARQLOGIN"."COL022"'
      Size = 1
    end
    object IBQuery2COL023: TIBStringField
      FieldName = 'COL023'
      Origin = '"ARQLOGIN"."COL023"'
      Size = 1
    end
    object IBQuery2COL024: TIBStringField
      FieldName = 'COL024'
      Origin = '"ARQLOGIN"."COL024"'
      Size = 1
    end
    object IBQuery2COL025: TIBStringField
      FieldName = 'COL025'
      Origin = '"ARQLOGIN"."COL025"'
      Size = 1
    end
    object IBQuery2COL026: TIBStringField
      FieldName = 'COL026'
      Origin = '"ARQLOGIN"."COL026"'
      Size = 1
    end
    object IBQuery2COL027: TIBStringField
      FieldName = 'COL027'
      Origin = '"ARQLOGIN"."COL027"'
      Size = 1
    end
    object IBQuery2COL028: TIBStringField
      FieldName = 'COL028'
      Origin = '"ARQLOGIN"."COL028"'
      Size = 1
    end
    object IBQuery2COL029: TIBStringField
      FieldName = 'COL029'
      Origin = '"ARQLOGIN"."COL029"'
      Size = 1
    end
    object IBQuery2COL030: TIBStringField
      FieldName = 'COL030'
      Origin = '"ARQLOGIN"."COL030"'
      Size = 1
    end
    object IBQuery2COL031: TIBStringField
      FieldName = 'COL031'
      Origin = '"ARQLOGIN"."COL031"'
      Size = 1
    end
    object IBQuery2COL032: TIBStringField
      FieldName = 'COL032'
      Origin = '"ARQLOGIN"."COL032"'
      Size = 1
    end
    object IBQuery2COL033: TIBStringField
      FieldName = 'COL033'
      Origin = '"ARQLOGIN"."COL033"'
      Size = 1
    end
    object IBQuery2COL034: TIBStringField
      FieldName = 'COL034'
      Origin = '"ARQLOGIN"."COL034"'
      Size = 1
    end
    object IBQuery2COL035: TIBStringField
      FieldName = 'COL035'
      Origin = '"ARQLOGIN"."COL035"'
      Size = 1
    end
    object IBQuery2COL036: TIBStringField
      FieldName = 'COL036'
      Origin = '"ARQLOGIN"."COL036"'
      Size = 1
    end
    object IBQuery2COL037: TIBStringField
      FieldName = 'COL037'
      Origin = '"ARQLOGIN"."COL037"'
      Size = 1
    end
    object IBQuery2COL038: TIBStringField
      FieldName = 'COL038'
      Origin = '"ARQLOGIN"."COL038"'
      Size = 1
    end
    object IBQuery2COL039: TIBStringField
      FieldName = 'COL039'
      Origin = '"ARQLOGIN"."COL039"'
      Size = 1
    end
    object IBQuery2COL040: TIBStringField
      FieldName = 'COL040'
      Origin = '"ARQLOGIN"."COL040"'
      Size = 1
    end
    object IBQuery2COL041: TIBStringField
      FieldName = 'COL041'
      Origin = '"ARQLOGIN"."COL041"'
      Size = 1
    end
    object IBQuery2COL042: TIBStringField
      FieldName = 'COL042'
      Origin = '"ARQLOGIN"."COL042"'
      Size = 1
    end
    object IBQuery2COL043: TIBStringField
      FieldName = 'COL043'
      Origin = '"ARQLOGIN"."COL043"'
      Size = 1
    end
    object IBQuery2COL044: TIBStringField
      FieldName = 'COL044'
      Origin = '"ARQLOGIN"."COL044"'
      Size = 1
    end
    object IBQuery2COL045: TIBStringField
      FieldName = 'COL045'
      Origin = '"ARQLOGIN"."COL045"'
      Size = 1
    end
    object IBQuery2COL046: TIBStringField
      FieldName = 'COL046'
      Origin = '"ARQLOGIN"."COL046"'
      Size = 1
    end
    object IBQuery2COL047: TIBStringField
      FieldName = 'COL047'
      Origin = '"ARQLOGIN"."COL047"'
      Size = 1
    end
    object IBQuery2COL048: TIBStringField
      FieldName = 'COL048'
      Origin = '"ARQLOGIN"."COL048"'
      Size = 1
    end
    object IBQuery2COL049: TIBStringField
      FieldName = 'COL049'
      Origin = '"ARQLOGIN"."COL049"'
      Size = 1
    end
    object IBQuery2COL050: TIBStringField
      FieldName = 'COL050'
      Origin = '"ARQLOGIN"."COL050"'
      Size = 1
    end
    object IBQuery2COL051: TIBStringField
      FieldName = 'COL051'
      Origin = '"ARQLOGIN"."COL051"'
      Size = 1
    end
    object IBQuery2COL052: TIBStringField
      FieldName = 'COL052'
      Origin = '"ARQLOGIN"."COL052"'
      Size = 1
    end
    object IBQuery2COL053: TIBStringField
      FieldName = 'COL053'
      Origin = '"ARQLOGIN"."COL053"'
      Size = 1
    end
    object IBQuery2COL054: TIBStringField
      FieldName = 'COL054'
      Origin = '"ARQLOGIN"."COL054"'
      Size = 1
    end
    object IBQuery2COL055: TIBStringField
      FieldName = 'COL055'
      Origin = '"ARQLOGIN"."COL055"'
      Size = 1
    end
    object IBQuery2COL056: TIBStringField
      FieldName = 'COL056'
      Origin = '"ARQLOGIN"."COL056"'
      Size = 1
    end
    object IBQuery2COL057: TIBStringField
      FieldName = 'COL057'
      Origin = '"ARQLOGIN"."COL057"'
      Size = 1
    end
    object IBQuery2COL058: TIBStringField
      FieldName = 'COL058'
      Origin = '"ARQLOGIN"."COL058"'
      Size = 1
    end
    object IBQuery2COL059: TIBStringField
      FieldName = 'COL059'
      Origin = '"ARQLOGIN"."COL059"'
      Size = 1
    end
    object IBQuery2COL060: TIBStringField
      FieldName = 'COL060'
      Origin = '"ARQLOGIN"."COL060"'
      Size = 1
    end
    object IBQuery2COL061: TIBStringField
      FieldName = 'COL061'
      Origin = '"ARQLOGIN"."COL061"'
      Size = 1
    end
    object IBQuery2COL062: TIBStringField
      FieldName = 'COL062'
      Origin = '"ARQLOGIN"."COL062"'
      Size = 1
    end
    object IBQuery2COL063: TIBStringField
      FieldName = 'COL063'
      Origin = '"ARQLOGIN"."COL063"'
      Size = 1
    end
    object IBQuery2COL064: TIBStringField
      FieldName = 'COL064'
      Origin = '"ARQLOGIN"."COL064"'
      Size = 1
    end
    object IBQuery2COL065: TIBStringField
      FieldName = 'COL065'
      Origin = '"ARQLOGIN"."COL065"'
      Size = 1
    end
    object IBQuery2COL066: TIBStringField
      FieldName = 'COL066'
      Origin = '"ARQLOGIN"."COL066"'
      Size = 1
    end
    object IBQuery2COL067: TIBStringField
      FieldName = 'COL067'
      Origin = '"ARQLOGIN"."COL067"'
      Size = 1
    end
    object IBQuery2COL068: TIBStringField
      FieldName = 'COL068'
      Origin = '"ARQLOGIN"."COL068"'
      Size = 1
    end
    object IBQuery2COL069: TIBStringField
      FieldName = 'COL069'
      Origin = '"ARQLOGIN"."COL069"'
      Size = 1
    end
    object IBQuery2COL070: TIBStringField
      FieldName = 'COL070'
      Origin = '"ARQLOGIN"."COL070"'
      Size = 1
    end
    object IBQuery2COL071: TIBStringField
      FieldName = 'COL071'
      Origin = '"ARQLOGIN"."COL071"'
      Size = 1
    end
    object IBQuery2COL072: TIBStringField
      FieldName = 'COL072'
      Origin = '"ARQLOGIN"."COL072"'
      Size = 1
    end
    object IBQuery2COL073: TIBStringField
      FieldName = 'COL073'
      Origin = '"ARQLOGIN"."COL073"'
      Size = 1
    end
    object IBQuery2COL074: TIBStringField
      FieldName = 'COL074'
      Origin = '"ARQLOGIN"."COL074"'
      Size = 1
    end
    object IBQuery2COL075: TIBStringField
      FieldName = 'COL075'
      Origin = '"ARQLOGIN"."COL075"'
      Size = 1
    end
    object IBQuery2COL076: TIBStringField
      FieldName = 'COL076'
      Origin = '"ARQLOGIN"."COL076"'
      Size = 1
    end
    object IBQuery2COL077: TIBStringField
      FieldName = 'COL077'
      Origin = '"ARQLOGIN"."COL077"'
      Size = 1
    end
    object IBQuery2COL078: TIBStringField
      FieldName = 'COL078'
      Origin = '"ARQLOGIN"."COL078"'
      Size = 1
    end
    object IBQuery2COL079: TIBStringField
      FieldName = 'COL079'
      Origin = '"ARQLOGIN"."COL079"'
      Size = 1
    end
    object IBQuery2COL080: TIBStringField
      FieldName = 'COL080'
      Origin = '"ARQLOGIN"."COL080"'
      Size = 1
    end
    object IBQuery2DATXI: TIBStringField
      FieldName = 'DATXI'
      Origin = '"ARQLOGIN"."DATXI"'
      Size = 10
    end
    object IBQuery2DATXL: TIBStringField
      FieldName = 'DATXL'
      Origin = '"ARQLOGIN"."DATXL"'
      Size = 10
    end
  end
end
