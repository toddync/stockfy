object FrmRegulamentos: TFrmRegulamentos
  Left = 312
  Top = 92
  Caption = 'FrmAbertura                PROJETO MOVEL PARA VENDEDOR'
  ClientHeight = 458
  ClientWidth = 559
  Color = clWhite
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
  object Label1: TLabel
    Left = 104
    Top = 11
    Width = 360
    Height = 29
    Caption = 'EMISS'#195'O DE REGULAMENTOS'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clNavy
    Font.Height = -24
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object GroupBox4: TGroupBox
    Left = 16
    Top = 46
    Width = 521
    Height = 408
    Color = clBlack
    Ctl3D = True
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    TabOrder = 0
    object Button2: TButton
      Left = 75
      Top = 16
      Width = 340
      Height = 50
      Caption = 'REGULAMENTO VELHO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button4: TButton
      Left = 74
      Top = 72
      Width = 340
      Height = 50
      Caption = 'REGULAMENTO NOVO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = Button4Click
    end
    object Button5: TButton
      Left = 75
      Top = 125
      Width = 340
      Height = 50
      Caption = 'REGULAMENTO DE DEPOSITO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = Button5Click
    end
    object Button1: TButton
      Left = 75
      Top = 181
      Width = 340
      Height = 49
      Caption = 'FICHA DE CORTE'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button3: TButton
      Left = 74
      Top = 236
      Width = 340
      Height = 50
      Caption = 'FAC'#199#195'O'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = Button3Click
    end
  end
  object RvRegnovo: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43087.600731794000000000
    ReportOptions.LastChange = 43504.464719166680000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 208
    Top = 394
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Regulamento: TfrxReportPage
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
        Height = 1023.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 131.645640000000000000
          Top = 34.763760000000000000
          Width = 444.944960000000000000
          Height = 44.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'ATEN'#199#195'O VENDEDORA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 13.000000000000000000
          Top = 119.102350000000000000
          Width = 597.000000000000000000
          Height = 27.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'I - ESTA EMPRESA TRABALHA NA FORMA DE CONSIGUINA'#199#195'O.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 35.677180000000000000
          Top = 144.086580000000000000
          Width = 557.527520000000000000
          Height = 25.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'AS MERCADORIAS N'#195'O VENDIDAS SER'#195'O DEVOLVIDAS.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 13.000000000000000000
          Top = 179.700680000000000000
          Width = 656.000000000000000000
          Height = 25.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'II - AS VENDAS S'#195'O DE TOTAL RESPONSABILIDADE DA VENDEDORA.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 36.220470000000000000
          Top = 200.141620000000000000
          Width = 751.000000000000000000
          Height = 26.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QUEN N'#195'O TEM CONDI'#199#213'ES DE COBRIR A NOTA NO VENCIMENTO')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 37.220470000000000000
          Top = 223.582560000000000000
          Width = 628.000000000000000000
          Height = 29.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#195'O VENDA FIADO. SOMENTE A VISTA.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 34.440940000000000000
          Top = 251.684910000000000000
          Width = 668.000000000000000000
          Height = 49.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'PREFERIMOS A DEVOLU'#199#195'O DAS MERCADORIAS DO QUE VENDER E N'#195'O PAGAR' +
              ' NO VENCIMENTO DA NOTA.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 33.440940000000000000
          Top = 311.464440000000000000
          Width = 732.000000000000000000
          Height = 23.936920000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'AO FAZER O PAGAMENTO PARA O REPRESENTANTE O VALOR TOTAL')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 35.440940000000000000
          Top = 334.684910000000000000
          Width = 654.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA NOTA SER'#193' O PERMITIDO.(N'#195'O ACEITAMOS PARCELAMENTOS)')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 138.440940000000000000
          Top = 392.810760000000000000
          Width = 457.000000000000000000
          Height = 23.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#227'o corte seu cr'#233'dito e nem suje seu nome no SPC.')
          ParentFont = False
        end
      end
    end
  end
  object RvDeposito: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43087.600731794000000000
    ReportOptions.LastChange = 43605.581729942130000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 376
    Top = 390
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Regulamento: TfrxReportPage
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
        Height = 1023.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 56.055040000000000000
          Top = 3.086580000000000000
          Width = 214.393630000000000000
          Height = 32.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 8.220470000000000000
          Top = 31.393630000000000000
          Width = 290.858070000000000000
          Height = 19.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 8.220470000000000000
          Top = 51.936920000000000000
          Width = 292.960420000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU  CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 73.700680000000000000
          Width = 330.960420000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3 ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 9.220470000000000000
          Top = 122.700680000000000000
          Width = 180.251700000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 9.220470000000000000
          Top = 149.464440000000000000
          Width = 308.283240000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E ')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 5.984230000000000000
          Top = 171.464440000000000000
          Width = 327.692640000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 427.086890000000000000
          Top = 3.338590000000000000
          Width = 214.393630000000000000
          Height = 28.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 33.236240000000000000
          Width = 290.858070000000000000
          Height = 15.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 385.512060000000000000
          Top = 54.133890000000000000
          Width = 296.739950000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU   CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 387.732530000000000000
          Top = 73.031540000000000000
          Width = 308.283240000000000000
          Height = 25.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3 ')
          ParentFont = False
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 380.732530000000000000
          Top = 124.724490000000000000
          Width = 187.810760000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 196.535560000000000000
          Top = 136.063080000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 571.945270000000000000
          Top = 141.063080000000000000
          Width = 117.165430000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 380.976500000000000000
          Top = 146.622140000000000000
          Width = 308.283240000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E ')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 365.834880000000000000
          Height = 1020.473100000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = 117.165430000000000000
          Top = 173.858380000000000000
          Width = 3.779530000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 419.527830000000000000
          Top = 132.283550000000000000
          Width = 3.779530000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 381.512060000000000000
          Top = 169.858380000000000000
          Width = 558.243970000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 3.779530000000000000
          Top = 204.094620000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 60.472480000000000000
          Top = 230.551330000000000000
          Width = 214.393630000000000000
          Height = 32.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 430.866420000000000000
          Top = 222.992270000000000000
          Width = 214.393630000000000000
          Height = 32.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 264.567100000000000000
          Width = 290.858070000000000000
          Height = 19.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 257.008040000000000000
          Width = 290.858070000000000000
          Height = 19.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 283.464750000000000000
          Width = 292.960420000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU  CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 275.905690000000000000
          Width = 292.960420000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU  CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 302.362400000000000000
          Width = 270.487940000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3 ')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 294.803340000000000000
          Width = 330.960420000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3 ')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 355.275820000000000000
          Width = 180.251700000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 349.716760000000000000
          Width = 180.251700000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 366.614410000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 578.268090000000000000
          Top = 365.055350000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 377.953000000000000000
          Width = 327.180890000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 374.173470000000000000
          Width = 327.180890000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E ')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 396.850650000000000000
          Width = 331.472170000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 396.850650000000000000
          Width = 339.031230000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 4.118120000000000000
          Top = 431.866420000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 83.149660000000000000
          Top = 457.323130000000000000
          Width = 214.393630000000000000
          Height = 32.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 434.645950000000000000
          Top = 457.323130000000000000
          Width = 214.393630000000000000
          Height = 32.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 491.338900000000000000
          Width = 290.858070000000000000
          Height = 19.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 506.457020000000000000
          Width = 290.858070000000000000
          Height = 19.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 514.016080000000000000
          Width = 292.960420000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU  CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 525.354670000000000000
          Width = 289.180890000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU  CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 536.693260000000000000
          Width = 330.960420000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3 ')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 374.173470000000000000
          Top = 544.252320000000000000
          Width = 312.062770000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3 ')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 9.756030000000000000
          Top = 589.606680000000000000
          Width = 180.251700000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 589.606680000000000000
          Width = 180.251700000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 204.094620000000000000
          Top = 616.063390000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 563.149970000000000000
          Top = 612.283860000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 619.842920000000000000
          Width = 327.180890000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 619.842920000000000000
          Width = 327.180890000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E ')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 642.520100000000000000
          Width = 323.913110000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 377.953000000000000000
          Top = 642.520100000000000000
          Width = 339.031230000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = -3.779530000000000000
          Top = 686.197280000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 64.252010000000000000
          Top = 702.992580000000000000
          Width = 214.393630000000000000
          Height = 32.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 438.425480000000000000
          Top = 702.992580000000000000
          Width = 214.393630000000000000
          Height = 32.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVISO DE COBRAN'#199'A')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 748.346940000000000000
          Width = 290.858070000000000000
          Height = 19.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 771.024120000000000000
          Width = 290.858070000000000000
          Height = 19.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'FA'#199'A O DEP'#211'SITO EM QUALQUER AGENCIA')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 771.024120000000000000
          Width = 292.960420000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU  CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 748.346940000000000000
          Width = 292.960420000000000000
          Height = 18.102350000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA CAIXA ECONOMICA OU  CASA LOT'#201'RICA.')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 793.701300000000000000
          Width = 323.401360000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3 ')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 797.480830000000000000
          Width = 308.283240000000000000
          Height = 21.881880000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Ag: 4747-001 Conta: 22741-3')
          ParentFont = False
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 14.118120000000000000
          Top = 842.835190000000000000
          Width = 180.251700000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 842.835190000000000000
          Width = 180.251700000000000000
          Height = 43.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VALOR A DEPOSITAR:')
          ParentFont = False
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 200.315090000000000000
          Top = 857.953310000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 570.709030000000000000
          Top = 861.732840000000000000
          Width = 113.385900000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 13.338590000000000000
          Top = 868.291900000000000000
          Width = 323.401360000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 382.260050000000000000
          Top = 864.732840000000000000
          Width = 327.180890000000000000
          Height = 17.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TIRE FOTO DO COMPROVANTE DO DEPOSITO E ')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 11.559060000000000000
          Top = 889.189550000000000000
          Width = 331.472170000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 381.732530000000000000
          Top = 888.189550000000000000
          Width = 323.913110000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ENVIE PELO WhatsApp. Num: 969381533.')
          ParentFont = False
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = -3.779530000000000000
          Top = 933.543910000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 56.692950000000000000
          Top = 819.158010000000000000
          Width = 170.078850000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 423.850650000000000000
          Top = 819.717070000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 564.149970000000000000
          Width = 185.196970000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 417.527830000000000000
          Top = 566.590910000000000000
          Width = 173.858380000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 325.819110000000000000
          Width = 173.858380000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 418.071120000000000000
          Top = 320.039580000000000000
          Width = 204.094620000000000000
          Height = 26.456710000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 52.913420000000000000
          Top = 99.488250000000000000
          Width = 207.874150000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 434.630180000000000000
          Top = 97.047310000000000000
          Width = 226.771800000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Monica da Silva')
          ParentFont = False
        end
      end
    end
  end
  object DBRegula: TfrxUserDataSet
    UserName = 'frxUserDataSet1'
    Left = 128
    Top = 395
  end
  object DBRegnovo: TfrxUserDataSet
    UserName = 'frxUserDataSet2'
    Left = 288
    Top = 391
  end
  object DBDeposito: TfrxUserDataSet
    UserName = 'frxUserDataSet3'
    Left = 454
    Top = 390
  end
  object RvFicha: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42656.499686481500000000
    ReportOptions.LastChange = 43734.716924224500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 40
    Top = 78
    Datasets = <
      item
        DataSet = DBFICHA
        DataSetName = 'frxUserDataSet2'
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
        Height = 1001.867350000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 18.392848950000000000
          Top = 7.865328950000000000
          Width = 73.999218950000000000
          Height = 20.687953680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX - ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 94.767975260000000000
          Top = 8.058864740000000000
          Width = 141.831836320000000000
          Height = 21.483644210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FICHA DE CORTE')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 58.472480000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -0.173160000000000000
          Top = 83.811070000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 0.456710000000000000
          Top = 105.212740000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line29: TfrxLineView
          AllowVectorExport = True
          Left = 246.488560000000000000
          Top = 8.440940000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          AllowVectorExport = True
          Left = 289.464750000000000000
          Top = 58.661410000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          AllowVectorExport = True
          Left = 355.598640000000000000
          Top = 60.220470000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          AllowVectorExport = True
          Left = 213.740260000000000000
          Top = 58.606370000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line35: TfrxLineView
          AllowVectorExport = True
          Left = 422.850650000000000000
          Top = 60.677180000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          AllowVectorExport = True
          Left = 557.559370000000000000
          Top = 57.480520000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          AllowVectorExport = True
          Left = 489.866420000000000000
          Top = 59.133890000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 246.134200000000000000
          Top = 26.338590000000000000
          Width = 468.661720000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 16.183152630000000000
          Top = 60.725271050000000000
          Width = 50.526348420000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RISCO')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 498.774843680000000000
          Top = 61.698336840000000000
          Width = 50.327425790000000000
          Height = 20.091185790000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EXGG')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 14.838394740000000000
          Top = 84.746427890000000000
          Width = 50.924193680000000000
          Height = 19.096572630000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QUANT')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 592.370440000000000000
          Top = 62.870325260000000000
          Width = 85.536731580000000000
          Height = 19.096572630000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'FOLHA  PAR')
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 225.653680000000000000
          Top = 61.891872630000000000
          Width = 16.709501050000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 303.609804210000000000
          Top = 61.891872630000000000
          Width = 20.489031050000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 370.888748420000000000
          Top = 61.870325260000000000
          Width = 19.892263160000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 433.108437370000000000
          Top = 61.649855260000000000
          Width = 27.252400530000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 253.598640000000000000
          Top = 3.779530000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGO')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 572.181510000000000000
          Top = 4.000000000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CODIGO:')
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 128.165430000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 155.401670000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = -3.220470000000000000
          Top = 181.637910000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 208.094620000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = -2.220470000000000000
          Top = 238.771800000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = -1.322820000000000000
          Top = 266.023810000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 0.236240000000000000
          Top = 293.937230000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = -0.661410000000000000
          Top = 323.393940000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = -1.102350000000000000
          Top = 351.071120000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line23: TfrxLineView
          AllowVectorExport = True
          Left = -0.645640000000000000
          Top = 377.086890000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line24: TfrxLineView
          AllowVectorExport = True
          Left = -0.661410000000000000
          Top = 403.323130000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line25: TfrxLineView
          AllowVectorExport = True
          Left = -0.543290000000000000
          Top = 433.897960000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 11.913420000000000000
          Top = 133.283550000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COR / Num.FOLHA')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 18.574830000000000000
          Top = 380.953000000000000000
          Width = 253.228510000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'APROVEITAMENTO POR RETALHO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 18.338590000000000000
          Top = 409.630180000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DO PESO')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 19.118120000000000000
          Top = 33.677180000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA:              /              /')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 253.228510000000000000
          Top = 34.456710000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'TIOPO TECIDO :')
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 108.826840000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'COMPRIMENTO DO RISCO')
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 431.968770000000000000
          Top = 108.826840000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'LARGURA')
        end
        object Line48: TfrxLineView
          AllowVectorExport = True
          Left = 288.905690000000000000
          Top = 131.724490000000000000
          Height = 241.889920000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          AllowVectorExport = True
          Left = 355.496290000000000000
          Top = 127.944960000000000000
          Height = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          AllowVectorExport = True
          Left = 422.527830000000000000
          Top = 129.724490000000000000
          Height = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          AllowVectorExport = True
          Left = 489.779840000000000000
          Top = 127.944960000000000000
          Height = 249.448980000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line52: TfrxLineView
          AllowVectorExport = True
          Left = 560.252320000000000000
          Top = 129.724490000000000000
          Height = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line54: TfrxLineView
          AllowVectorExport = True
          Left = 218.094620000000000000
          Top = 128.944960000000000000
          Height = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 241.212740000000000000
          Top = 132.504020000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 308.023810000000000000
          Top = 132.504020000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 376.055350000000000000
          Top = 132.504020000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 443.645950000000000000
          Top = 132.504020000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
          ParentFont = False
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 498.559370000000000000
          Top = 131.504020000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EXGG')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 568.590910000000000000
          Top = 132.504020000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL POR COR')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 18.897650000000000000
          Top = 357.496290000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'T'#214'TAL POR TAMANHO')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 15.118120000000000000
          Top = 449.764070000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CORTADOR:')
        end
        object Line34: TfrxLineView
          AllowVectorExport = True
          Left = 2.267780000000000000
          Top = 597.827150000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line38: TfrxLineView
          AllowVectorExport = True
          Left = 2.897650000000000000
          Top = 619.228820000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line59: TfrxLineView
          AllowVectorExport = True
          Left = 1.677180000000000000
          Top = 807.953310000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line60: TfrxLineView
          AllowVectorExport = True
          Left = 2.779530000000000000
          Top = 837.410020000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line63: TfrxLineView
          AllowVectorExport = True
          Left = -8.220470000000000000
          Top = 917.339210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line64: TfrxLineView
          AllowVectorExport = True
          Left = -8.102350000000000000
          Top = 947.914040000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo48: TfrxMemoView
          AllowVectorExport = True
          Left = 246.039580000000000000
          Top = 517.795610000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGO')
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 564.622450000000000000
          Top = 518.016080000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CODIGO:')
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 10.833788950000000000
          Top = 521.881408950000000000
          Width = 73.999218950000000000
          Height = 20.687953680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX - ')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 94.767975260000000000
          Top = 522.074944740000000000
          Width = 141.831836320000000000
          Height = 21.483644210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FICHA DE CORTE')
          ParentFont = False
        end
        object Line39: TfrxLineView
          AllowVectorExport = True
          Left = 238.929500000000000000
          Top = 522.457020000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line46: TfrxLineView
          AllowVectorExport = True
          Left = 238.575140000000000000
          Top = 540.354670000000000000
          Width = 468.661720000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 11.559060000000000000
          Top = 547.693260000000000000
          Width = 219.212740000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA:              /              /')
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 245.669450000000000000
          Top = 548.472790000000000000
          Width = 109.606370000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'TIOPO TECIDO :')
        end
        object Line44: TfrxLineView
          AllowVectorExport = True
          Left = 550.000310000000000000
          Top = 571.496600000000000000
          Height = 45.354360000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line40: TfrxLineView
          AllowVectorExport = True
          Left = 281.905690000000000000
          Top = 573.677490000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line41: TfrxLineView
          AllowVectorExport = True
          Left = 348.039580000000000000
          Top = 574.236550000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line42: TfrxLineView
          AllowVectorExport = True
          Left = 206.181200000000000000
          Top = 573.622450000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line43: TfrxLineView
          AllowVectorExport = True
          Left = 415.291590000000000000
          Top = 574.693260000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line45: TfrxLineView
          AllowVectorExport = True
          Left = 482.307360000000000000
          Top = 573.149970000000000000
          Height = 41.574830000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 8.624092630000000000
          Top = 575.741351050000000000
          Width = 50.526348420000000000
          Height = 16.112733160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'RISCO')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 491.215783680000000000
          Top = 575.714416840000000000
          Width = 50.327425790000000000
          Height = 20.091185790000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EXGG')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 425.549377370000000000
          Top = 575.665935260000000000
          Width = 27.252400530000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 584.811380000000000000
          Top = 576.886405260000000000
          Width = 85.536731580000000000
          Height = 19.096572630000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'FOLHA  PAR')
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 218.094620000000000000
          Top = 575.907952630000000000
          Width = 16.709501050000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 296.050744210000000000
          Top = 575.907952630000000000
          Width = 20.489031050000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 363.329688420000000000
          Top = 575.886405260000000000
          Width = 19.892263160000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 7.279334740000000000
          Top = 599.762507890000000000
          Width = 50.924193680000000000
          Height = 15.317042630000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QUANT')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 621.842920000000000000
          Width = 177.637910000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'COMPRIMENTO DO RISCO')
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 424.409710000000000000
          Top = 621.842920000000000000
          Width = 75.590600000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'LARGURA')
        end
        object Line66: TfrxLineView
          AllowVectorExport = True
          Left = 347.937230000000000000
          Top = 641.961040000000000000
          Height = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line67: TfrxLineView
          AllowVectorExport = True
          Left = 414.968770000000000000
          Top = 643.740570000000000000
          Height = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line68: TfrxLineView
          AllowVectorExport = True
          Left = 482.220780000000000000
          Top = 641.961040000000000000
          Height = 249.448980000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line69: TfrxLineView
          AllowVectorExport = True
          Left = 552.693260000000000000
          Top = 643.740570000000000000
          Height = 245.669450000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line70: TfrxLineView
          AllowVectorExport = True
          Left = 210.535560000000000000
          Top = 642.961040000000000000
          Height = 241.889920000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 4.354360000000000000
          Top = 647.299630000000000000
          Width = 181.417440000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COR / Num.FOLHA')
          ParentFont = False
        end
        object Line65: TfrxLineView
          AllowVectorExport = True
          Left = 281.346630000000000000
          Top = 645.740570000000000000
          Height = 241.889920000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 233.653680000000000000
          Top = 646.520100000000000000
          Width = 18.897650000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
          ParentFont = False
        end
        object Memo58: TfrxMemoView
          AllowVectorExport = True
          Left = 300.464750000000000000
          Top = 646.520100000000000000
          Width = 22.677180000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
          ParentFont = False
        end
        object Memo59: TfrxMemoView
          AllowVectorExport = True
          Left = 368.496290000000000000
          Top = 646.520100000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
          ParentFont = False
        end
        object Memo60: TfrxMemoView
          AllowVectorExport = True
          Left = 436.086890000000000000
          Top = 646.520100000000000000
          Width = 26.456710000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
          ParentFont = False
        end
        object Memo61: TfrxMemoView
          AllowVectorExport = True
          Left = 491.000310000000000000
          Top = 645.520100000000000000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EXGG')
          ParentFont = False
        end
        object Memo62: TfrxMemoView
          AllowVectorExport = True
          Left = 561.031850000000000000
          Top = 646.520100000000000000
          Width = 136.063080000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL POR COR')
          ParentFont = False
        end
        object Line61: TfrxLineView
          AllowVectorExport = True
          Left = 3.338590000000000000
          Top = 864.087200000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo63: TfrxMemoView
          AllowVectorExport = True
          Left = 11.338590000000000000
          Top = 870.512370000000000000
          Width = 181.417440000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'T'#214'TAL POR TAMANHO')
          ParentFont = False
        end
        object Line62: TfrxLineView
          AllowVectorExport = True
          Left = 1.795300000000000000
          Top = 891.102970000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo51: TfrxMemoView
          AllowVectorExport = True
          Left = 11.015770000000000000
          Top = 895.969080000000000000
          Width = 253.228510000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'APROVEITAMENTO POR RETALHO')
          ParentFont = False
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 10.779530000000000000
          Top = 923.646260000000000000
          Width = 139.842610000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DO PESO')
          ParentFont = False
        end
        object Memo64: TfrxMemoView
          AllowVectorExport = True
          Left = 7.559060000000000000
          Top = 963.780150000000000000
          Width = 94.488250000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CORTADOR:')
        end
        object Line71: TfrxLineView
          AllowVectorExport = True
          Left = 3.338590000000000000
          Top = 489.559370000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.TopLine.Style = fsDot
        end
        object Line32: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 571.488560000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line53: TfrxLineView
          AllowVectorExport = True
          Top = 669.417750000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line57: TfrxLineView
          AllowVectorExport = True
          Left = 2.220470000000000000
          Top = 752.787880000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line47: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 642.181510000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line55: TfrxLineView
          AllowVectorExport = True
          Left = 3.220470000000000000
          Top = 695.653990000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line56: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 722.110700000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line58: TfrxLineView
          AllowVectorExport = True
          Left = 3.118120000000000000
          Top = 780.039890000000000000
          Width = 710.551640000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
    end
  end
  object RvFaccao: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 42656.499686481500000000
    ReportOptions.LastChange = 43785.659659467590000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 472
    Top = 86
    Datasets = <
      item
        DataSet = DBFaccao
        DataSetName = 'frxUserDataSet5'
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
        Height = 1035.883120000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 18.392848950000000000
          Top = 7.424388950000000000
          Width = 73.999218950000000000
          Height = 20.687953680000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'SIDTEX - ')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 102.327035260000000000
          Top = 8.617924740000000000
          Width = 141.831836320000000000
          Height = 21.483644210000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'FAC'#199#195'O')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 58.031540000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -0.173160000000000000
          Top = 83.370130000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 0.456710000000000000
          Top = 104.771800000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -0.102350000000000000
          Top = 269.173470000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
          Frame.Width = 2.000000000000000000
        end
        object Line29: TfrxLineView
          AllowVectorExport = True
          Left = 246.488560000000000000
          Top = 8.000000000000000000
          Height = 49.133890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line30: TfrxLineView
          AllowVectorExport = True
          Left = 280.464750000000000000
          Top = 300.220470000000000000
          Height = 427.086890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line31: TfrxLineView
          AllowVectorExport = True
          Left = 305.244280000000000000
          Top = 59.779530000000000000
          Height = 238.110390000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line33: TfrxLineView
          AllowVectorExport = True
          Left = 219.858380000000000000
          Top = 61.944960000000000000
          Height = 238.110390000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line35: TfrxLineView
          AllowVectorExport = True
          Left = 391.393940000000000000
          Top = 60.236240000000000000
          Height = 238.110390000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line36: TfrxLineView
          AllowVectorExport = True
          Left = 551.000310000000000000
          Top = 57.039580000000000000
          Height = 241.889920000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line37: TfrxLineView
          AllowVectorExport = True
          Left = 473.527830000000000000
          Top = 62.472480000000000000
          Height = 234.330860000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = 246.134200000000000000
          Top = 25.897650000000000000
          Width = 468.661720000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 106.891872630000000000
          Top = 60.284331050000000000
          Width = 35.408228420000000000
          Height = 19.892263160000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COR')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 554.026853680000000000
          Top = 62.257396840000000000
          Width = 42.768365790000000000
          Height = 20.091185790000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EXGG')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Top = 61.628307890000000000
          Width = 43.365133680000000000
          Height = 19.096572630000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N.FLH')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 479.866029470000000000
          Top = 62.843391050000000000
          Width = 27.849168420000000000
          Height = 15.515965260000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'GG')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 655.961040000000000000
          Top = 62.429385260000000000
          Width = 47.741431580000000000
          Height = 19.096572630000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL')
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 231.137324210000000000
          Top = 63.450932630000000000
          Width = 20.489031050000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'P')
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 317.313918420000000000
          Top = 61.429385260000000000
          Width = 19.892263160000000000
          Height = 19.494417890000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'M')
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 401.431257370000000000
          Top = 61.208915260000000000
          Width = 19.693340530000000000
          Height = 19.693340530000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'G')
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 405.338900000000000000
          Top = 3.559060000000000000
          Width = 56.692950000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGO')
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 254.700990000000000000
          Top = 3.559060000000000000
          Width = 64.252010000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'CODIGO:')
        end
        object Line22: TfrxLineView
          AllowVectorExport = True
          Left = 642.299630000000000000
          Top = 59.692950000000000000
          Height = 238.110390000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = -0.559060000000000000
          Top = 129.504020000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 154.960730000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = -2.220470000000000000
          Top = 181.196970000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 207.653680000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = -1.440940000000000000
          Top = 238.330860000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = -1.322820000000000000
          Top = 300.582870000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 12.677180000000000000
          Top = 274.685220000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAIS P / TAMANHO')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 55.008040000000000000
          Top = 304.141930000000000000
          Width = 98.267780000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVIAMENTO:')
          ParentFont = False
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 0.236240000000000000
          Top = 326.496290000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = -0.661410000000000000
          Top = 350.953000000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = -1.102350000000000000
          Top = 373.630180000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line23: TfrxLineView
          AllowVectorExport = True
          Left = -0.645640000000000000
          Top = 397.645950000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line24: TfrxLineView
          AllowVectorExport = True
          Left = -0.661410000000000000
          Top = 421.882190000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line25: TfrxLineView
          AllowVectorExport = True
          Left = -0.543290000000000000
          Top = 447.457020000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line26: TfrxLineView
          AllowVectorExport = True
          Left = -0.984230000000000000
          Top = 473.031850000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line27: TfrxLineView
          AllowVectorExport = True
          Left = 0.118120000000000000
          Top = 499.827150000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 209.008040000000000000
          Top = 303.921460000000000000
          Width = 60.472480000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CORES ->')
          ParentFont = False
        end
        object Line28: TfrxLineView
          AllowVectorExport = True
          Left = 390.732530000000000000
          Top = 303.141930000000000000
          Height = 427.086890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line32: TfrxLineView
          AllowVectorExport = True
          Left = 508.441250000000000000
          Top = 302.141930000000000000
          Height = 427.086890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line34: TfrxLineView
          AllowVectorExport = True
          Left = 615.252320000000000000
          Top = 301.921460000000000000
          Height = 427.086890000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line38: TfrxLineView
          AllowVectorExport = True
          Left = -0.440940000000000000
          Top = 527.354670000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line39: TfrxLineView
          AllowVectorExport = True
          Left = -1.881880000000000000
          Top = 554.149970000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line40: TfrxLineView
          AllowVectorExport = True
          Left = -0.881880000000000000
          Top = 583.386210000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line41: TfrxLineView
          AllowVectorExport = True
          Left = -0.220470000000000000
          Top = 610.622450000000000000
          Width = 714.331170000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line42: TfrxLineView
          AllowVectorExport = True
          Left = -3.527520000000000000
          Top = 669.874460000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line43: TfrxLineView
          AllowVectorExport = True
          Left = -0.543290000000000000
          Top = 698.110700000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line44: TfrxLineView
          AllowVectorExport = True
          Top = 730.126470000000000000
          Width = 721.890156770000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line45: TfrxLineView
          AllowVectorExport = True
          Left = -1.543290000000000000
          Top = 640.299630000000000000
          Width = 718.110700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 56.370130000000000000
          Top = 505.236550000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'AVIAMENTO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 210.653680000000000000
          Top = 507.457020000000000000
          Width = 56.692950000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'CORES ->')
          ParentFont = False
        end
        object Line46: TfrxLineView
          AllowVectorExport = True
          Left = -2.661410000000000000
          Top = 763.803650000000000000
          Width = 721.890230000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 22.677180000000000000
          Top = 737.008350000000000000
          Width = 166.299320000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL DE PE'#199'AS ---->')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 495.118430000000000000
          Top = 740.567410000000000000
          Width = 86.929190000000000000
          Height = 15.118120000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'TOTAL R$ ->')
          ParentFont = False
        end
        object Line47: TfrxLineView
          AllowVectorExport = True
          Left = 359.055350000000000000
          Top = 846.614720000000000000
          Width = 340.157700000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 107.944960000000000000
          Top = 816.158010000000000000
          Width = 238.110390000000000000
          Height = 45.354360000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA : _______/________/___________ ASS:')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 15.559060000000000000
          Top = 34.574830000000000000
          Width = 222.992270000000000000
          Height = 18.897650000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'DATA:               /                 /       ')
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 249.448980000000000000
          Top = 29.795300000000000000
          Width = 90.708720000000000000
          Height = 22.677180000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'COSTUREIRA')
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 567.016080000000000000
          Top = 32.795300000000000000
          Width = 52.913420000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'PRE'#199'O')
        end
        object Line48: TfrxLineView
          AllowVectorExport = True
          Left = 48.472480000000000000
          Top = 60.472480000000000000
          Height = 200.315090000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line49: TfrxLineView
          AllowVectorExport = True
          Left = 602.504330000000000000
          Top = 72.590600000000000000
          Height = 226.771800000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line50: TfrxLineView
          AllowVectorExport = True
          Left = 517.354670000000000000
          Top = 71.811070000000000000
          Height = 226.771800000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line51: TfrxLineView
          AllowVectorExport = True
          Left = 436.307360000000000000
          Top = 78.149660000000000000
          Height = 222.992270000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line52: TfrxLineView
          AllowVectorExport = True
          Left = 351.275820000000000000
          Top = 71.370130000000000000
          Height = 226.771800000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line53: TfrxLineView
          AllowVectorExport = True
          Left = 266.228510000000000000
          Top = 76.370130000000000000
          Height = 222.992270000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 273.787570000000000000
          Top = 64.252010000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'def')
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 356.055350000000000000
          Top = 66.031540000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'def')
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 441.764070000000000000
          Top = 66.031540000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'def')
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 523.693260000000000000
          Top = 66.031540000000000000
          Width = 22.677180000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'def')
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 609.842920000000000000
          Top = 66.031540000000000000
          Width = 26.456710000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            'def')
        end
      end
    end
  end
  object DBFaccao: TfrxUserDataSet
    UserName = 'frxUserDataSet5'
    Left = 464
    Top = 150
  end
  object DBFICHA: TfrxUserDataSet
    UserName = 'frxUserDataSet2'
    Left = 32
    Top = 166
  end
  object RvRegula: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43087.600731794000000000
    ReportOptions.LastChange = 43087.668571307900000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 48
    Top = 398
    Datasets = <>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Regulamento: TfrxReportPage
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
        Height = 1023.677180000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 177.000000000000000000
          Top = 46.102350000000000000
          Width = 324.000000000000000000
          Height = 44.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsUnderline]
          Frame.Typ = []
          Memo.UTF8W = (
            'ATEN'#199#195'O VENDEDORA')
          ParentFont = False
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 13.000000000000000000
          Top = 119.102350000000000000
          Width = 597.000000000000000000
          Height = 27.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'I - ESTA EMPRESA TRABALHA NA FORMA DE CONSIGUINA'#199#195'O.')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 13.000000000000000000
          Top = 171.102350000000000000
          Width = 557.527520000000000000
          Height = 25.661410000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'II - AS MERCADORIAS N'#195'O VENDIDAS SER'#195'O DEVOLVIDAS.')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 13.000000000000000000
          Top = 220.102350000000000000
          Width = 656.000000000000000000
          Height = 29.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'III - AS PE'#199'AS VENDIDAS TEM PRAZO PARA PAGAMENTO DE 60 (dias) ')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 13.000000000000000000
          Top = 272.102350000000000000
          Width = 596.000000000000000000
          Height = 28.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'IV - AP'#211'S O VENCIMENTO DA NOTA PAGA JUROS POR ATRAZO.')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 13.000000000000000000
          Top = 327.102350000000000000
          Width = 656.000000000000000000
          Height = 25.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'V - AS VENDAS S'#195'O DE TOTAL RESPONSABILIDADE DA VENDEDORA.')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 40.000000000000000000
          Top = 355.102350000000000000
          Width = 751.000000000000000000
          Height = 26.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'SE VENDER FIADO E N'#195'O RECEBER ANTES DO VENCIMENTO DA NOTA, ')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 41.000000000000000000
          Top = 386.102350000000000000
          Width = 628.000000000000000000
          Height = 29.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'A VENDEDORA  TER'#193' QUE COBRIR O VALOR DA VENDA REALIZADA.')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 42.000000000000000000
          Top = 433.102350000000000000
          Width = 668.000000000000000000
          Height = 49.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'PREFERIMOS A DEVOLU'#199#195'O DAS MERCADORIAS DO QUE VENDER E N'#195'O PAGAR' +
              ' NO VENCIMENTO DA NOTA.')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 41.000000000000000000
          Top = 489.102350000000000000
          Width = 732.000000000000000000
          Height = 23.936920000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'AO FAZER O PAGAMENTO PARA O REPRESENTANTE O VALOR TOTAL')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 43.000000000000000000
          Top = 516.102350000000000000
          Width = 654.000000000000000000
          Height = 22.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DA NOTA SER'#193' O PERMITIDO.(N'#195'O ACEITAMOS PARCELAMENTOS)')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 14.000000000000000000
          Top = 563.102350000000000000
          Width = 671.000000000000000000
          Height = 28.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'VI - VOCE TER'#193' TRES SEMANAS PARA REALIZAR SUAS VENDAS.')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 48.000000000000000000
          Top = 591.102350000000000000
          Width = 634.000000000000000000
          Height = 69.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'POR FAVOR, ESTEJA PRESENTE (OU RESPONSAVEL) E COM AS MERCADORIAS' +
              ' N'#194'O VENDIDAS, PARA REALIZAR A DEVOLU'#199#195'O DA NOTA.')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 47.000000000000000000
          Top = 671.102350000000000000
          Width = 639.000000000000000000
          Height = 69.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            
              'NESTA DATA O NOSSO REPRESENTANTE FARA RECOLHIMENTO DESSAS MERCAD' +
              'ORIAS E O AJUSTE DE VALORES A SEREM PAGOS NO VENCIMENTO DA NOTA.')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 146.000000000000000000
          Top = 782.102350000000000000
          Width = 457.000000000000000000
          Height = 23.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#227'o corte seu cr'#233'dito e nem suje seu nome no SPC.')
          ParentFont = False
        end
      end
    end
  end
end
