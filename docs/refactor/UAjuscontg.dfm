object FrmAjuscontg: TFrmAjuscontg
  Left = 15
  Top = 0
  Caption = 'CONTAGEM DO ESTOQUE'
  ClientHeight = 611
  ClientWidth = 1000
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
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
  object Label3: TLabel
    Left = 36
    Top = 9
    Width = 175
    Height = 19
    Caption = 'DATA DA CONTAGEM'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 536
    Top = 8
    Width = 322
    Height = 19
    Caption = 'ARTIGOS  COM CONTCGEM REALIZADA'
  end
  object GroupBox1: TGroupBox
    Left = 11
    Top = 166
    Width = 368
    Height = 365
    Color = clYellow
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Label6: TLabel
      Left = 124
      Top = 40
      Width = 106
      Height = 19
      Caption = 'COD.ARTIGO'
    end
    object Label7: TLabel
      Left = 134
      Top = 124
      Width = 69
      Height = 23
      Caption = 'QUANT'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label9: TLabel
      Left = 134
      Top = 208
      Width = 66
      Height = 23
      Caption = 'CUSTO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit4: TEdit
      Left = 94
      Top = 65
      Width = 147
      Height = 53
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      MaxLength = 4
      ParentFont = False
      TabOrder = 0
      OnExit = Edit4Exit
    end
    object Edit5: TEdit
      Left = 94
      Top = 149
      Width = 147
      Height = 53
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Edit6: TEdit
      Left = 94
      Top = 233
      Width = 147
      Height = 53
      Alignment = taRightJustify
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -37
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnExit = Edit6Exit
    end
  end
  object DBGrid1: TDBGrid
    Left = 385
    Top = 8
    Width = 607
    Height = 585
    DataSource = DModRosa.DsPesq_contg
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -16
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = [fsBold]
    Columns = <
      item
        Color = clBlack
        Expanded = False
        FieldName = 'CODIGO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'COD.'
        Width = 65
        Visible = True
      end
      item
        Color = clSkyBlue
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = '                    DESCRICAO'
        Width = 291
        Visible = True
      end
      item
        Color = clMaroon
        Expanded = False
        FieldName = 'INICIAL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'INIC'
        Width = 70
        Visible = True
      end
      item
        Color = clGreen
        Expanded = False
        FieldName = 'SACOL'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'SAC'
        Width = 72
        Visible = True
      end
      item
        Color = clBlue
        Expanded = False
        FieldName = 'PRECO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Title.Caption = 'CUSTO'
        Width = 85
        Visible = True
      end>
  end
  object MaskEdit1: TMaskEdit
    Left = 11
    Top = 36
    Width = 230
    Height = 47
    EditMask = '99/99/9999;1;_'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    MaxLength = 10
    ParentFont = False
    TabOrder = 0
    Text = '  /  /    '
    OnExit = MaskEdit1Exit
  end
  object Button1: TButton
    Left = 9
    Top = 539
    Width = 370
    Height = 54
    Caption = 'FECHAR O PROGRAMA'
    TabOrder = 3
    OnClick = Button1Click
  end
  object Edit2: TEdit
    Left = 11
    Top = 110
    Width = 368
    Height = 41
    Color = clSilver
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -27
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
  end
end
