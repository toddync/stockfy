object FrmCompras: TFrmCompras
  Left = 15
  Top = 15
  Caption = 
    'SEARCH Informatica                                              ' +
    '                   TELA COMPRAS DE   FORNECEDOR'
  ClientHeight = 585
  ClientWidth = 999
  Color = clTeal
  Ctl3D = False
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
  object Label16: TLabel
    Left = 333
    Top = 528
    Width = 4
    Height = 16
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 65
    Top = 5
    Width = 41
    Height = 19
    Caption = 'TIPO'
    Color = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentColor = False
    ParentFont = False
  end
  object Label2: TLabel
    Left = 158
    Top = 5
    Width = 83
    Height = 19
    Caption = 'NUM.DOC.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 305
    Top = 5
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
  object Label4: TLabel
    Left = 434
    Top = 5
    Width = 79
    Height = 19
    Caption = 'ENTREGA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 571
    Top = 5
    Width = 137
    Height = 19
    Caption = 'MARCA FORNEC.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 830
    Top = 6
    Width = 107
    Height = 19
    Caption = 'DOC.ORIGEM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 46
    Top = 448
    Width = 523
    Height = 112
    Color = clSilver
    ParentBackground = False
    ParentColor = False
    TabOrder = 5
    object Label7: TLabel
      Left = 50
      Top = 5
      Width = 40
      Height = 19
      Caption = 'COD.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 224
      Top = 5
      Width = 97
      Height = 19
      Caption = 'DESCRI'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 55
      Top = 56
      Width = 42
      Height = 19
      Caption = 'TAM.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 172
      Top = 56
      Width = 35
      Height = 19
      Caption = 'COR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 285
      Top = 56
      Width = 64
      Height = 19
      Caption = 'QUANT.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 376
      Top = 56
      Width = 56
      Height = 19
      Caption = 'CUSTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit8: TEdit
      Left = 121
      Top = 26
      Width = 335
      Height = 29
      Color = clMoneyGreen
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object Edit1: TEdit
      Left = 121
      Top = 75
      Width = 156
      Height = 29
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit15: TEdit
      Left = 279
      Top = 75
      Width = 83
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      OnExit = Edit15Exit
    end
    object Edit16: TEdit
      Left = 363
      Top = 75
      Width = 93
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = Edit16Exit
    end
    object Edit7: TEdit
      Left = 41
      Top = 26
      Width = 77
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit7Exit
    end
    object ComboBox3: TComboBox
      Left = 41
      Top = 75
      Width = 77
      Height = 31
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        'P'
        'M'
        'G'
        'GG'
        'XG')
    end
  end
  object RichEdit2: TRichEdit
    Left = 583
    Top = 93
    Width = 204
    Height = 349
    Color = clNavy
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 8
    Zoom = 100
  end
  object GroupBox2: TGroupBox
    Left = 809
    Top = 27
    Width = 141
    Height = 415
    Color = clSilver
    ParentBackground = False
    ParentColor = False
    TabOrder = 6
    object Label13: TLabel
      Left = 41
      Top = 4
      Width = 41
      Height = 19
      Caption = 'TIPO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 29
      Top = 58
      Width = 72
      Height = 19
      Caption = 'NUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 30
      Top = 108
      Width = 75
      Height = 19
      Caption = 'EMISS'#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 27
      Top = 161
      Width = 79
      Height = 19
      Caption = 'ENTREGA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 40
      Top = 211
      Width = 52
      Height = 19
      Caption = 'FRETE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label19: TLabel
      Left = 21
      Top = 262
      Width = 90
      Height = 19
      Caption = 'DESCONTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label20: TLabel
      Left = 20
      Top = 312
      Width = 91
      Height = 19
      Caption = 'QTD.PARC.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object ComboBox2: TComboBox
      Left = 15
      Top = 21
      Width = 106
      Height = 31
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = ComboBox2Exit
      Items.Strings = (
        'NOT'
        'PED'
        'FAB'
        'OUT')
    end
    object Edit6: TEdit
      Left = 15
      Top = 77
      Width = 106
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit6Exit
    end
    object Edit10: TEdit
      Left = 17
      Top = 333
      Width = 104
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
      OnExit = Edit10Exit
    end
    object Edit18: TEdit
      Left = 17
      Top = 231
      Width = 104
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = Edit18Exit
    end
    object Edit19: TEdit
      Left = 17
      Top = 281
      Width = 104
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnExit = Edit19Exit
    end
    object MaskEdit3: TMaskEdit
      Left = 15
      Top = 128
      Width = 106
      Height = 29
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
    object MaskEdit4: TMaskEdit
      Left = 17
      Top = 181
      Width = 104
      Height = 29
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
  end
  object GroupBox3: TGroupBox
    Left = 583
    Top = 448
    Width = 367
    Height = 109
    Color = clSilver
    ParentBackground = False
    ParentColor = False
    TabOrder = 7
    object Label21: TLabel
      Left = 26
      Top = 5
      Width = 51
      Height = 19
      Caption = 'PARC.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label22: TLabel
      Left = 115
      Top = 6
      Width = 41
      Height = 19
      Caption = 'TIPO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label23: TLabel
      Left = 208
      Top = 5
      Width = 72
      Height = 19
      Caption = 'NUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label24: TLabel
      Left = 27
      Top = 56
      Width = 110
      Height = 19
      Caption = 'VENCIMENTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label25: TLabel
      Left = 204
      Top = 56
      Width = 56
      Height = 19
      Caption = 'VALOR'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit3: TEdit
      Left = 24
      Top = 26
      Width = 57
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit3Exit
    end
    object Edit9: TEdit
      Left = 184
      Top = 24
      Width = 121
      Height = 29
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      OnExit = Edit9Exit
    end
    object ComboBox4: TComboBox
      Left = 97
      Top = 26
      Width = 81
      Height = 31
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = ComboBox4Exit
      Items.Strings = (
        'PED'
        'NOT'
        'BOL'
        'CHE'
        'DIN'
        'CAR'
        'OUT'
        '')
    end
    object Edit17: TEdit
      Left = 184
      Top = 75
      Width = 121
      Height = 29
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = Edit17Exit
    end
    object MaskEdit5: TMaskEdit
      Left = 24
      Top = 75
      Width = 120
      Height = 29
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
  end
  object ComboBox1: TComboBox
    Left = 45
    Top = 26
    Width = 89
    Height = 31
    CharCase = ecUpperCase
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnExit = ComboBox1Exit
    Items.Strings = (
      'PED'
      'NOT'
      'FAB'
      'OUT')
  end
  object Edit4: TEdit
    Left = 141
    Top = 27
    Width = 121
    Height = 29
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
    OnExit = Edit4Exit
  end
  object MaskEdit1: TMaskEdit
    Left = 287
    Top = 27
    Width = 120
    Height = 29
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
    OnExit = MaskEdit1Exit
  end
  object MaskEdit2: TMaskEdit
    Left = 417
    Top = 26
    Width = 123
    Height = 29
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
  object Edit2: TEdit
    Left = 546
    Top = 26
    Width = 173
    Height = 29
    CharCase = ecUpperCase
    Color = clYellow
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnExit = Edit2Exit
  end
  object RichEdit1: TRichEdit
    Left = 46
    Top = 96
    Width = 523
    Height = 346
    Color = clYellow
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
    Zoom = 100
  end
  object RichEdit3: TRichEdit
    Left = 46
    Top = 63
    Width = 741
    Height = 24
    Color = clMoneyGreen
    Ctl3D = True
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 10
    Zoom = 100
  end
  object DBGrid1: TDBGrid
    Left = 45
    Top = 95
    Width = 523
    Height = 347
    DataSource = DtsAuxcont
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 11
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Visible = False
    Columns = <
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'DATVENC'
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
        Visible = True
      end
      item
        Color = clYellow
        Expanded = False
        FieldName = 'NUMDOC'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = []
        Width = 90
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'PARCEL'
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
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'ORICOB'
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
        Width = 109
        Visible = True
      end
      item
        Color = clBlack
        Expanded = False
        FieldName = 'VALOR'
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
        Width = 86
        Visible = True
      end>
  end
  object IBQAuxconta: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXCONTA')
    Left = 64
    Top = 259
    object IBQAuxcontaDATEMIS: TDateField
      FieldName = 'DATEMIS'
      Origin = '"AUXCONTA"."DATEMIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQAuxcontaTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Origin = '"AUXCONTA"."TIPDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxcontaNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"AUXCONTA"."NUMDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQAuxcontaPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"AUXCONTA"."PARCEL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IBQAuxcontaHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Origin = '"AUXCONTA"."HISTOR"'
      Size = 40
    end
    object IBQAuxcontaOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Origin = '"AUXCONTA"."OBSERV"'
      Size = 40
    end
    object IBQAuxcontaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"AUXCONTA"."VALOR"'
      Precision = 18
      Size = 2
    end
    object IBQAuxcontaTIPCOB: TIBStringField
      FieldName = 'TIPCOB'
      Origin = '"AUXCONTA"."TIPCOB"'
      Size = 3
    end
    object IBQAuxcontaNUMCOB: TIBStringField
      FieldName = 'NUMCOB'
      Origin = '"AUXCONTA"."NUMCOB"'
      Size = 8
    end
    object IBQAuxcontaORICOB: TIBStringField
      FieldName = 'ORICOB'
      Origin = '"AUXCONTA"."ORICOB"'
      Size = 15
    end
    object IBQAuxcontaDATVENC: TDateField
      FieldName = 'DATVENC'
      Origin = '"AUXCONTA"."DATVENC"'
    end
    object IBQAuxcontaSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"AUXCONTA"."SINAL"'
      Size = 1
    end
    object IBQAuxcontaSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"AUXCONTA"."SIGLA"'
      Size = 3
    end
    object IBQAuxcontaSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXCONTA"."SITU"'
      Size = 1
    end
    object IBQAuxcontaDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXCONTA"."DATPAG"'
      Size = 10
    end
    object IBQAuxcontaVENDE: TIBStringField
      FieldName = 'VENDE'
      Origin = '"AUXCONTA"."VENDE"'
      Size = 3
    end
    object IBQAuxcontaACOMIS: TIBBCDField
      FieldName = 'ACOMIS'
      Origin = '"AUXCONTA"."ACOMIS"'
      Precision = 9
      Size = 2
    end
    object IBQAuxcontaCOMISS: TIBBCDField
      FieldName = 'COMISS'
      Origin = '"AUXCONTA"."COMISS"'
      Precision = 18
      Size = 2
    end
    object IBQAuxcontaDATBAX: TIBStringField
      FieldName = 'DATBAX'
      Origin = '"AUXCONTA"."DATBAX"'
      Size = 10
    end
    object IBQAuxcontaOPEROU: TIBStringField
      FieldName = 'OPEROU'
      Origin = '"AUXCONTA"."OPEROU"'
      Size = 15
    end
  end
  object IBQAuxitens: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITCOM ')
    Left = 160
    Top = 261
    object IBQAuxitensITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXITCOM"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxitensPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"AUXITCOM"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQAuxitensCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXITCOM"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxitensDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITCOM"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitensQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"AUXITCOM"."QUANT"'
      DisplayFormat = '##0.0'
    end
    object IBQAuxitensCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"AUXITCOM"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitensQTDANT: TIntegerField
      FieldName = 'QTDANT'
      Origin = '"AUXITCOM"."QTDANT"'
      DisplayFormat = '##0.0'
    end
    object IBQAuxitensCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Origin = '"AUXITCOM"."CUSANT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxitensDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"AUXITCOM"."DESCON"'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object IBQAuxitensTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Origin = '"AUXITCOM"."TAMANHO"'
      Size = 2
    end
    object IBQAuxitensCOR: TIBStringField
      FieldName = 'COR'
      Origin = '"AUXITCOM"."COR"'
      Size = 15
    end
    object IBQAuxitensOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITCOM"."OPER"'
      Size = 1
    end
  end
  object IBQAuxcont: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXCONTA')
    Left = 56
    Top = 325
    object IBQAuxcontDATEMIS: TDateField
      FieldName = 'DATEMIS'
      Origin = '"AUXCONTA"."DATEMIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQAuxcontTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Origin = '"AUXCONTA"."TIPDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxcontNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"AUXCONTA"."NUMDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQAuxcontPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"AUXCONTA"."PARCEL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IBQAuxcontHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Origin = '"AUXCONTA"."HISTOR"'
      Size = 40
    end
    object IBQAuxcontOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Origin = '"AUXCONTA"."OBSERV"'
      Size = 40
    end
    object IBQAuxcontVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"AUXCONTA"."VALOR"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQAuxcontTIPCOB: TIBStringField
      FieldName = 'TIPCOB'
      Origin = '"AUXCONTA"."TIPCOB"'
      Size = 3
    end
    object IBQAuxcontNUMCOB: TIBStringField
      FieldName = 'NUMCOB'
      Origin = '"AUXCONTA"."NUMCOB"'
      Size = 8
    end
    object IBQAuxcontORICOB: TIBStringField
      FieldName = 'ORICOB'
      Origin = '"AUXCONTA"."ORICOB"'
      Size = 15
    end
    object IBQAuxcontDATVENC: TDateField
      FieldName = 'DATVENC'
      Origin = '"AUXCONTA"."DATVENC"'
    end
    object IBQAuxcontSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"AUXCONTA"."SINAL"'
      Size = 1
    end
    object IBQAuxcontSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"AUXCONTA"."SIGLA"'
      Size = 3
    end
    object IBQAuxcontSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"AUXCONTA"."SITU"'
      Size = 1
    end
    object IBQAuxcontDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"AUXCONTA"."DATPAG"'
      Size = 10
    end
    object IBQAuxcontVENDE: TIBStringField
      FieldName = 'VENDE'
      Origin = '"AUXCONTA"."VENDE"'
      Size = 3
    end
    object IBQAuxcontACOMIS: TIBBCDField
      FieldName = 'ACOMIS'
      Origin = '"AUXCONTA"."ACOMIS"'
      Precision = 9
      Size = 2
    end
    object IBQAuxcontCOMISS: TIBBCDField
      FieldName = 'COMISS'
      Origin = '"AUXCONTA"."COMISS"'
      Precision = 18
      Size = 2
    end
    object IBQAuxcontDATBAX: TIBStringField
      FieldName = 'DATBAX'
      Origin = '"AUXCONTA"."DATBAX"'
      Size = 10
    end
    object IBQAuxcontOPEROU: TIBStringField
      FieldName = 'OPEROU'
      Origin = '"AUXCONTA"."OPEROU"'
      Size = 15
    end
  end
  object IBTAuxconta: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXCONTA'
    UniDirectional = False
    Left = 64
    Top = 186
    object IBTAuxcontaDATEMIS: TDateField
      FieldName = 'DATEMIS'
      Required = True
    end
    object IBTAuxcontaTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Required = True
      Size = 3
    end
    object IBTAuxcontaNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Required = True
      Size = 8
    end
    object IBTAuxcontaPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Required = True
      Size = 2
    end
    object IBTAuxcontaHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Size = 40
    end
    object IBTAuxcontaOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Size = 40
    end
    object IBTAuxcontaVALOR: TIBBCDField
      FieldName = 'VALOR'
      Precision = 18
      Size = 2
    end
    object IBTAuxcontaTIPCOB: TIBStringField
      FieldName = 'TIPCOB'
      Size = 3
    end
    object IBTAuxcontaNUMCOB: TIBStringField
      FieldName = 'NUMCOB'
      Size = 8
    end
    object IBTAuxcontaORICOB: TIBStringField
      FieldName = 'ORICOB'
      Size = 15
    end
    object IBTAuxcontaDATVENC: TDateField
      FieldName = 'DATVENC'
    end
    object IBTAuxcontaSINAL: TIBStringField
      FieldName = 'SINAL'
      Size = 1
    end
    object IBTAuxcontaSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 3
    end
    object IBTAuxcontaSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTAuxcontaDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTAuxcontaVENDE: TIBStringField
      FieldName = 'VENDE'
      Size = 3
    end
    object IBTAuxcontaACOMIS: TIBBCDField
      FieldName = 'ACOMIS'
      Precision = 9
      Size = 2
    end
    object IBTAuxcontaCOMISS: TIBBCDField
      FieldName = 'COMISS'
      Precision = 18
      Size = 2
    end
    object IBTAuxcontaDATBAX: TIBStringField
      FieldName = 'DATBAX'
      Size = 10
    end
    object IBTAuxcontaOPEROU: TIBStringField
      FieldName = 'OPEROU'
      Size = 15
    end
  end
  object IBTAuxitens: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITCOM'
    UniDirectional = False
    Left = 160
    Top = 187
    object IBTAuxitensITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 3
    end
    object IBTAuxitensPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 8
    end
    object IBTAuxitensCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTAuxitensDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxitensQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object IBTAuxitensCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object IBTAuxitensQTDANT: TIntegerField
      FieldName = 'QTDANT'
    end
    object IBTAuxitensCUSANT: TIBBCDField
      FieldName = 'CUSANT'
      Precision = 18
      Size = 2
    end
    object IBTAuxitensDESCON: TIBBCDField
      FieldName = 'DESCON'
      Precision = 9
      Size = 2
    end
    object IBTAuxitensTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Size = 2
    end
    object IBTAuxitensCOR: TIBStringField
      FieldName = 'COR'
      Size = 15
    end
    object IBTAuxitensOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object DtsAuxcont: TDataSource
    DataSet = IBQAuxcont
    Left = 148
    Top = 325
  end
end
