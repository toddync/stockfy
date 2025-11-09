object FrmUtilitarios: TFrmUtilitarios
  Left = 200
  Top = 166
  Caption = 
    'SEARCH Informatica                                          UTIL' +
    'ITARIOS'
  ClientHeight = 322
  ClientWidth = 702
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
  object Button1: TButton
    Left = 80
    Top = 8
    Width = 553
    Height = 57
    Caption = 'SENHAS'
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
    Left = 80
    Top = 68
    Width = 553
    Height = 57
    Caption = 'LAY_OUT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
  end
  object Button3: TButton
    Left = 80
    Top = 128
    Width = 553
    Height = 57
    Caption = 'BACKUP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
  end
  object Button4: TButton
    Left = 80
    Top = 190
    Width = 553
    Height = 57
    Caption = 'RESTAURA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
  end
  object Button5: TButton
    Left = 80
    Top = 251
    Width = 553
    Height = 57
    Caption = 'LIMPEZA'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = Button5Click
  end
  object IBQuery1: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      '*select * from CADLOGIN')
    Left = 24
    Top = 56
  end
end
