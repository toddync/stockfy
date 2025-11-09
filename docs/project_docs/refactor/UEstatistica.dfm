object FrmEstatistica: TFrmEstatistica
  Left = 200
  Top = 166
  Caption = 
    'SEARCH Informatica                                        MAPAS ' +
    'ESTATISTICOS'
  ClientHeight = 322
  ClientWidth = 702
  Color = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  PixelsPerInch = 96
  TextHeight = 13
  object Button2: TButton
    Left = 80
    Top = 103
    Width = 553
    Height = 50
    Caption = 'VENDAS DISTRIBUIDAS (NA SACOLEIRA)'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
  end
  object Button3: TButton
    Left = 80
    Top = 159
    Width = 553
    Height = 50
    Caption = 'VENDAS/ COBRAN'#199'AS CONSOLIDADAS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Button4: TButton
    Left = 80
    Top = 211
    Width = 553
    Height = 50
    Caption = 'SAIDAS /RETORNO POR ARTIGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Button5: TButton
    Left = 80
    Top = 265
    Width = 553
    Height = 50
    Caption = 'VENDAS REALIZADAS POR ARTIGO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object GroupBox1: TGroupBox
    Left = 80
    Top = 8
    Width = 553
    Height = 89
    Color = clGreen
    ParentBackground = False
    ParentColor = False
    TabOrder = 4
    object Label1: TLabel
      Left = 116
      Top = 13
      Width = 117
      Height = 19
      Caption = 'DATA INICIAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 372
      Top = 13
      Width = 101
      Height = 19
      Caption = 'DATA FINAL'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object MaskEdit1: TMaskEdit
      Left = 112
      Top = 32
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
      TabOrder = 0
      Text = '  /  /    '
    end
    object MaskEdit2: TMaskEdit
      Left = 360
      Top = 32
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
      TabOrder = 1
      Text = '  /  /    '
    end
  end
end
