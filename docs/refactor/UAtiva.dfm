object FrmAtiva: TFrmAtiva
  Left = 233
  Top = 101
  Caption = 
    '                                                   ATIVA E DESAT' +
    'IVA LIENTE'
  ClientHeight = 337
  ClientWidth = 527
  Color = clMaroon
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindow
  Font.Height = -16
  Font.Name = 'Tahoma'
  Font.Style = [fsBold]
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 19
  object Label1: TLabel
    Left = 104
    Top = 32
    Width = 51
    Height = 19
    Caption = 'OPER:'
  end
  object Label2: TLabel
    Left = 200
    Top = 103
    Width = 123
    Height = 19
    Caption = 'COMENT'#193'RIOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ComboBox1: TComboBox
    Left = 160
    Top = 29
    Width = 145
    Height = 31
    CharCase = ecUpperCase
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnExit = ComboBox1Exit
    Items.Strings = (
      'ATIVO'
      'DESAT')
  end
  object Edit1: TEdit
    Left = 40
    Top = 128
    Width = 457
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
  object RichEdit1: TRichEdit
    Left = 40
    Top = 184
    Width = 457
    Height = 137
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Lines.Strings = (
      '')
    ParentFont = False
    TabOrder = 2
    Zoom = 100
  end
  object Button1: TButton
    Left = 376
    Top = 29
    Width = 121
    Height = 49
    Caption = 'SAIR'
    TabOrder = 3
    OnClick = Button1Click
  end
  object edAtiv: TEdit
    Left = 40
    Top = 84
    Width = 121
    Height = 27
    TabOrder = 4
    Visible = False
  end
  object edCli: TEdit
    Left = 376
    Top = 84
    Width = 121
    Height = 27
    TabOrder = 5
    Text = 'edCli'
    Visible = False
  end
end
