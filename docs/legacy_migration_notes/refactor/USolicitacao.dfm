object FrmSolicitacao: TFrmSolicitacao
  Left = 30
  Top = 31
  Caption = 'TELA DE SOLICITA'#199#195'O DE ARTIGOS'
  ClientHeight = 609
  ClientWidth = 983
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel
    Left = 64
    Top = 11
    Width = 92
    Height = 19
    Caption = 'OPERA'#199#195'O'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label19: TLabel
    Left = 372
    Top = 16
    Width = 568
    Height = 19
    Caption = 
      'COD               DESCRI'#199#194'O                                   P ' +
      '        M       G      GG   '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 161
    Width = 345
    Height = 440
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Label6: TLabel
      Left = 13
      Top = 4
      Width = 60
      Height = 19
      Caption = 'CLIENT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 161
      Top = 4
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
    object Label8: TLabel
      Left = 131
      Top = 55
      Width = 62
      Height = 19
      Caption = 'E_MAIL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 11
      Top = 122
      Width = 66
      Height = 19
      Caption = 'BAIRRO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 13
      Top = 156
      Width = 64
      Height = 19
      Caption = 'CIDADE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label11: TLabel
      Left = 17
      Top = 187
      Width = 32
      Height = 19
      Caption = 'CEP'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 238
      Top = 187
      Width = 21
      Height = 19
      Caption = 'UF'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label13: TLabel
      Left = 108
      Top = 254
      Width = 115
      Height = 19
      Caption = 'REFERENCIAS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 4
      Top = 24
      Width = 73
      Height = 31
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
      Left = 83
      Top = 24
      Width = 244
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit3: TEdit
      Left = 9
      Top = 75
      Width = 318
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit4: TEdit
      Left = 81
      Top = 116
      Width = 246
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Edit5: TEdit
      Left = 81
      Top = 150
      Width = 246
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Edit9: TEdit
      Left = 267
      Top = 181
      Width = 60
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
    end
    object Edit11: TEdit
      Left = 13
      Top = 277
      Width = 314
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 6
    end
    object MaskEdit1: TMaskEdit
      Left = 81
      Top = 181
      Width = 140
      Height = 31
      Color = clSilver
      EditMask = '99999.999'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 9
      ParentFont = False
      TabOrder = 7
      Text = '     .   '
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 41
    Width = 345
    Height = 121
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 3
      Width = 45
      Height = 19
      Caption = 'VEND'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 176
      Top = 3
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
    object Label3: TLabel
      Left = 17
      Top = 57
      Width = 115
      Height = 19
      Caption = 'NUM.SOLICIT.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 238
      Top = 57
      Width = 47
      Height = 19
      Caption = 'DATA'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit6: TEdit
      Left = 9
      Top = 24
      Width = 73
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit6Exit
    end
    object Edit7: TEdit
      Left = 83
      Top = 24
      Width = 250
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Edit10: TEdit
      Left = 9
      Top = 75
      Width = 130
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnExit = Edit10Exit
    end
    object MaskEdit2: TMaskEdit
      Left = 207
      Top = 75
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
      OnExit = MaskEdit2Exit
    end
  end
  object GroupBox3: TGroupBox
    Left = 8
    Top = 415
    Width = 327
    Height = 167
    Color = clMaroon
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    Visible = False
    object Label14: TLabel
      Left = 16
      Top = 9
      Width = 66
      Height = 19
      Caption = 'ARTIGO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 40
      Top = 107
      Width = 11
      Height = 19
      Caption = 'P'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label16: TLabel
      Left = 111
      Top = 107
      Width = 14
      Height = 19
      Caption = 'M'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label17: TLabel
      Left = 178
      Top = 107
      Width = 12
      Height = 19
      Caption = 'G'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label18: TLabel
      Left = 243
      Top = 104
      Width = 24
      Height = 19
      Caption = 'GG'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit8: TEdit
      Left = 16
      Top = 31
      Width = 69
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      OnExit = Edit8Exit
    end
    object Edit12: TEdit
      Left = 15
      Top = 65
      Width = 278
      Height = 31
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object Edit14: TEdit
      Left = 15
      Top = 128
      Width = 65
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object Edit15: TEdit
      Left = 86
      Top = 127
      Width = 65
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
    end
    object Edit16: TEdit
      Left = 157
      Top = 128
      Width = 65
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
    end
    object Edit17: TEdit
      Left = 228
      Top = 128
      Width = 65
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 5
      OnExit = Edit17Exit
    end
  end
  object Edit13: TEdit
    Left = 169
    Top = 6
    Width = 185
    Height = 29
    Color = clRed
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clYellow
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
  end
  object RichEdit1: TRichEdit
    Left = 360
    Top = 41
    Width = 357
    Height = 496
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 4
    Zoom = 100
  end
  object Button1: TButton
    Left = 380
    Top = 543
    Width = 209
    Height = 58
    Caption = 'CONFIRMA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 748
    Top = 543
    Width = 209
    Height = 58
    Caption = 'RESTAURA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = Button2Click
  end
  object RichEdit2: TRichEdit
    Left = 723
    Top = 41
    Width = 252
    Height = 496
    Color = clMoneyGreen
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    Zoom = 100
  end
  object IBTAuxitsolicit: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXITSOLICIT'
    UniDirectional = False
    Left = 624
    Top = 552
    object IBTAuxitsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Required = True
      Size = 3
    end
    object IBTAuxitsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 6
    end
    object IBTAuxitsolicitARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Required = True
      Size = 4
    end
    object IBTAuxitsolicitDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxitsolicitPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      EditFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      EditFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      EditFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      EditFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBTAuxitsolicitOBSER: TIBStringField
      FieldName = 'OBSER'
    end
    object IBTAuxitsolicitOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
  object IBQAuxitsolicit: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXITSOLICIT')
    Left = 696
    Top = 552
    object IBQAuxitsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"AUXITSOLICIT"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxitsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"AUXITSOLICIT"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQAuxitsolicitARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Origin = '"AUXITSOLICIT"."ARTIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQAuxitsolicitDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXITSOLICIT"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxitsolicitPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      Origin = '"AUXITSOLICIT"."PEQUENO"'
      DisplayFormat = '##0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      Origin = '"AUXITSOLICIT"."MEDIO"'
      DisplayFormat = '##0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      Origin = '"AUXITSOLICIT"."GRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      Origin = '"AUXITSOLICIT"."XGRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQAuxitsolicitOBSER: TIBStringField
      FieldName = 'OBSER'
      Origin = '"AUXITSOLICIT"."OBSER"'
    end
    object IBQAuxitsolicitOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXITSOLICIT"."OPER"'
      Size = 1
    end
  end
end
