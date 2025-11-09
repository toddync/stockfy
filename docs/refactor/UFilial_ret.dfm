object FrmFilial_ret: TFrmFilial_ret
  Left = 120
  Top = 21
  Caption = 
    'SEARCH Inform'#180'tica                                   IMPORTA'#199#195'O ' +
    'DE RETORNO DAS FILIAIS'
  ClientHeight = 473
  ClientWidth = 841
  Color = clSkyBlue
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
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
      Text = 'Edit1'
    end
    object Edit2: TEdit
      Left = 750
      Top = 11
      Width = 65
      Height = 31
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      Text = 'Edit2'
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
      Text = 'ComboBox1'
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
  end
  object DBGrid1: TDBGrid
    Left = 127
    Top = 71
    Width = 706
    Height = 394
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object DataSource1: TDataSource
    Left = 520
    Top = 408
  end
  object IBQuery1: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 376
    Top = 408
  end
  object IBQuery2: TIBQuery
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 448
    Top = 408
  end
  object IBTable1: TIBTable
    BufferChunks = 1000
    CachedUpdates = False
    UniDirectional = False
    Left = 320
    Top = 408
  end
end
