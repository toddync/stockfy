object FrmPrintped: TFrmPrintped
  Left = 238
  Top = 137
  Caption = 
    'SEARCH Informatica                                           REL' +
    'ATORIOS DE SAIDA'
  ClientHeight = 322
  ClientWidth = 379
  Color = clCream
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 16
    Width = 363
    Height = 113
    Color = clMaroon
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentColor = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    object Label5: TLabel
      Left = 34
      Top = 11
      Width = 72
      Height = 19
      Caption = 'NUMERO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Edit1: TEdit
      Left = 13
      Top = 36
      Width = 121
      Height = 45
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNone
      Font.Height = -32
      Font.Name = 'Tahoma'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      TabOrder = 0
      OnExit = Edit1Exit
    end
    object Button3: TButton
      Left = 140
      Top = 36
      Width = 204
      Height = 45
      Caption = 'IMPRIMIR'
      TabOrder = 1
      OnClick = Button3Click
    end
  end
  object Button1: TButton
    Left = 8
    Top = 193
    Width = 363
    Height = 99
    Caption = 'RESTAURAR'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    OnClick = Button1Click
  end
  object RvPedidovenda: TfrxReport
    Version = '6.3.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Copies = 2
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 43088.422956782400000000
    ReportOptions.LastChange = 44083.609911562500000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    OnGetValue = RvPedidovendaGetValue
    Left = 53
    Top = 139
    Datasets = <
      item
        DataSet = DtsPedvenda
        DataSetName = 'frxDBDataset3'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Pedidovenda: TfrxReportPage
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
        Height = 241.559060000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 49.102350000000000000
          Width = 717.574830000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line2: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 165.102350000000000000
          Width = 714.456710000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line3: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 212.102350000000000000
          Width = 720.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 125.000000000000000000
          Top = 22.102350000000000000
          Width = 276.000000000000000000
          Height = 24.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'PEDIDO DE MERCADORIA NUM:')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 407.000000000000000000
          Top = 16.102350000000000000
          Width = 105.000000000000000000
          Height = 24.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Numped]')
          ParentFont = False
        end
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 565.000000000000000000
          Top = 22.102350000000000000
          Width = 60.543290000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Num.Via:')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 634.000000000000000000
          Top = 20.102350000000000000
          Width = 35.661410000000000000
          Height = 20.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Via]')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 22.000000000000000000
          Top = 52.102350000000000000
          Width = 47.086580000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Nome:')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 2.000000000000000000
          Top = 73.102350000000000000
          Width = 68.307050000000000000
          Height = 20.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Endere'#231'o:')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 71.102350000000000000
          Width = 386.000000000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Endcli]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 76.000000000000000000
          Top = 51.102350000000000000
          Width = 385.000000000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Nomcli]')
          ParentFont = False
        end
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 75.000000000000000000
          Top = 97.102350000000000000
          Width = 352.118120000000000000
          Height = 21.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Complemento]')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 437.000000000000000000
          Top = 98.102350000000000000
          Width = 257.000000000000000000
          Height = 18.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Horario]')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 468.000000000000000000
          Top = 51.102350000000000000
          Width = 224.000000000000000000
          Height = 19.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Vend: [Vendedor]')
          ParentFont = False
        end
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 26.000000000000000000
          Top = 119.102350000000000000
          Width = 247.000000000000000000
          Height = 16.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Bairro: [Baicli]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 276.000000000000000000
          Top = 119.102350000000000000
          Width = 260.000000000000000000
          Height = 18.440940000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Cidade: [Cidcli]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 543.000000000000000000
          Top = 121.102350000000000000
          Width = 116.000000000000000000
          Height = 16.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Est: [Estcli]')
          ParentFont = False
        end
        object Memo16: TfrxMemoView
          AllowVectorExport = True
          Left = 27.000000000000000000
          Top = 141.102350000000000000
          Width = 118.440940000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CEP: [Cepcli]')
          ParentFont = False
        end
        object Memo17: TfrxMemoView
          AllowVectorExport = True
          Left = 149.000000000000000000
          Top = 139.935683330000000000
          Width = 152.881880000000000000
          Height = 18.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Rg.Num: [Rgncli]')
          ParentFont = False
        end
        object Memo18: TfrxMemoView
          AllowVectorExport = True
          Left = 308.000000000000000000
          Top = 142.102350000000000000
          Width = 122.897650000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CPF: [Cpfcli]')
          ParentFont = False
        end
        object Memo19: TfrxMemoView
          AllowVectorExport = True
          Left = 436.000000000000000000
          Top = 142.102350000000000000
          Width = 268.354360000000000000
          Height = 17.220470000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel: [Telcli]')
          ParentFont = False
        end
        object Line8: TfrxLineView
          AllowVectorExport = True
          Left = 89.833333330000000000
          Top = 169.102350000000000000
          Height = 42.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line9: TfrxLineView
          AllowVectorExport = True
          Left = 196.000000000000000000
          Top = 169.102350000000000000
          Height = 40.559060000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line10: TfrxLineView
          AllowVectorExport = True
          Left = 454.000000000000000000
          Top = 170.102350000000000000
          Height = 40.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line11: TfrxLineView
          AllowVectorExport = True
          Left = 564.000000000000000000
          Top = 168.102350000000000000
          Height = 43.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo20: TfrxMemoView
          AllowVectorExport = True
          Left = 9.000000000000000000
          Top = 171.102350000000000000
          Width = 66.559060000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'EMISS'#195'O')
          ParentFont = False
        end
        object Memo21: TfrxMemoView
          AllowVectorExport = True
          Left = 96.000000000000000000
          Top = 173.102350000000000000
          Width = 88.220470000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DEVOLU'#199#195'O')
          ParentFont = False
        end
        object Memo22: TfrxMemoView
          AllowVectorExport = True
          Left = 200.000000000000000000
          Top = 181.102350000000000000
          Width = 248.692950000000000000
          Height = 22.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Tel: [Contato]')
          ParentFont = False
        end
        object Memo23: TfrxMemoView
          AllowVectorExport = True
          Left = 5.000000000000000000
          Top = 190.102350000000000000
          Width = 74.000000000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Emissao]')
          ParentFont = False
        end
        object Memo24: TfrxMemoView
          AllowVectorExport = True
          Left = 98.000000000000000000
          Top = 193.102350000000000000
          Width = 81.000000000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Devolucao]')
          ParentFont = False
        end
        object Memo25: TfrxMemoView
          AllowVectorExport = True
          Left = 461.000000000000000000
          Top = 171.102350000000000000
          Width = 97.000000000000000000
          Height = 14.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENCIMENTO')
          ParentFont = False
        end
        object Memo26: TfrxMemoView
          AllowVectorExport = True
          Left = 463.220470000000000000
          Top = 188.102350000000000000
          Width = 102.000000000000000000
          Height = 18.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[Vencimento]')
          ParentFont = False
        end
        object Memo27: TfrxMemoView
          AllowVectorExport = True
          Left = 570.833333330000000000
          Top = 168.038033330000000000
          Width = 66.425170000000000000
          Height = 18.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CLIENTE')
          ParentFont = False
        end
        object Memo28: TfrxMemoView
          AllowVectorExport = True
          Left = 619.322820000000000000
          Top = 187.102350000000000000
          Width = 71.102350000000000000
          Height = 19.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -19
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            '[CLiente]')
          ParentFont = False
        end
        object Memo29: TfrxMemoView
          AllowVectorExport = True
          Left = 4.000000000000000000
          Top = 217.102350000000000000
          Width = 42.204700000000000000
          Height = 17.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COD.')
          ParentFont = False
        end
        object Memo30: TfrxMemoView
          AllowVectorExport = True
          Left = 51.166666670000000000
          Top = 215.102350000000000000
          Width = 53.940940000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QT.SAI')
          ParentFont = False
        end
        object Memo31: TfrxMemoView
          AllowVectorExport = True
          Left = 181.000000000000000000
          Top = 215.102350000000000000
          Width = 100.732220000000000000
          Height = 17.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'DESCRI'#199#195'O')
          ParentFont = False
        end
        object Line12: TfrxLineView
          AllowVectorExport = True
          Left = 638.000000000000000000
          Top = 213.102350000000000000
          Height = 21.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line13: TfrxLineView
          AllowVectorExport = True
          Left = 578.000000000000000000
          Top = 215.102350000000000000
          Height = 19.779530000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line14: TfrxLineView
          AllowVectorExport = True
          Left = 515.000000000000000000
          Top = 216.102350000000000000
          Height = 20.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Memo32: TfrxMemoView
          AllowVectorExport = True
          Left = 641.000000000000000000
          Top = 215.102350000000000000
          Width = 74.897650000000000000
          Height = 20.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Val.VEND.')
          ParentFont = False
        end
        object Memo33: TfrxMemoView
          AllowVectorExport = True
          Left = 582.000000000000000000
          Top = 216.102350000000000000
          Width = 54.000000000000000000
          Height = 19.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Qt.VEN')
          ParentFont = False
        end
        object Memo34: TfrxMemoView
          AllowVectorExport = True
          Left = 519.833333330000000000
          Top = 216.102350000000000000
          Width = 56.118120000000000000
          Height = 18.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Qt.DEV')
          ParentFont = False
        end
        object Memo35: TfrxMemoView
          AllowVectorExport = True
          Left = 395.333333330000000000
          Top = 217.769016670000000000
          Width = 55.984230000000000000
          Height = 16.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO')
          ParentFont = False
        end
        object Memo36: TfrxMemoView
          AllowVectorExport = True
          Left = 456.333333330000000000
          Top = 218.269016670000000000
          Width = 54.220470000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'VENDA')
          ParentFont = False
        end
        object Line4: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 238.102350000000000000
          Width = 720.338590000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 1.102350000000000000
          Width = 100.984230000000000000
          Height = 30.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Sidtex')
          ParentFont = False
        end
        object Memo54: TfrxMemoView
          AllowVectorExport = True
          Left = 127.724490000000000000
          Top = 0.779530000000000000
          Width = 83.149660000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'Emitido em:')
          ParentFont = False
        end
        object Memo55: TfrxMemoView
          AllowVectorExport = True
          Left = 215.433210000000000000
          Top = 0.779530000000000000
          Width = 102.047310000000000000
          Height = 18.897650000000000000
          DisplayFormat.FormatStr = 'dd mmm yyyy'
          DisplayFormat.Kind = fkDateTime
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Dat01]')
          ParentFont = False
        end
        object Memo56: TfrxMemoView
          AllowVectorExport = True
          Left = 328.598640000000000000
          Top = 2.559060000000000000
          Width = 71.811070000000000000
          Height = 15.118120000000000000
          Frame.Typ = []
          Memo.UTF8W = (
            '[Temp01]')
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 321.260050000000000000
        Width = 718.110700000000000000
        DataSet = DtsPedvenda
        DataSetName = 'frxDBDataset3'
        RowCount = 0
        object frxDBDataset3CODART: TfrxMemoView
          AllowVectorExport = True
          Left = 5.333333330000000000
          Top = 2.363326669999990000
          Width = 45.236240000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."CODART"]')
          ParentFont = False
        end
        object frxDBDataset3QTDSAI: TfrxMemoView
          AllowVectorExport = True
          Left = 53.833333330000000000
          Top = 2.363326669999990000
          Width = 45.354360000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."QTDSAI"]')
          ParentFont = False
        end
        object frxDBDataset3DESCRICAO: TfrxMemoView
          AllowVectorExport = True
          Left = 111.000000000000000000
          Top = 2.196660000000010000
          Width = 272.732530000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset3."DESCRICAO"]')
          ParentFont = False
        end
        object Line15: TfrxLineView
          AllowVectorExport = True
          Left = 515.000000000000000000
          Top = 2.196660000000010000
          Height = 17.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line17: TfrxLineView
          AllowVectorExport = True
          Left = 638.000000000000000000
          Top = 3.196660000000010000
          Height = 18.000000000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object frxDBDataset3QTDRET: TfrxMemoView
          AllowVectorExport = True
          Left = 521.000000000000000000
          Top = 2.196660000000010000
          Width = 49.133890000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."QTDRET"]')
          ParentFont = False
        end
        object frxDBDataset3QTDANT: TfrxMemoView
          AllowVectorExport = True
          Left = 581.000000000000000000
          Top = 1.196660000000010000
          Width = 52.913420000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."QTDANT"]')
          ParentFont = False
        end
        object frxDBDataset3VENANT: TfrxMemoView
          AllowVectorExport = True
          Left = 641.333333340000000000
          Top = 2.696660000000010000
          Width = 71.811070000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."VENANT"]')
          ParentFont = False
        end
        object frxDBDataset3PRECUS: TfrxMemoView
          AllowVectorExport = True
          Left = 392.000000000000000000
          Top = 3.196660000000010000
          Width = 57.370130000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."PRECUS"]')
          ParentFont = False
        end
        object frxDBDataset3PREVEN: TfrxMemoView
          AllowVectorExport = True
          Left = 454.500000000000000000
          Top = 2.863326669999990000
          Width = 56.031540000000000000
          Height = 18.897650000000000000
          DataSet = DtsPedvenda
          DataSetName = 'frxDBDataset3'
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset3."PREVEN"]')
          ParentFont = False
        end
        object Line16: TfrxLineView
          AllowVectorExport = True
          Left = 575.000000000000000000
          Top = 1.858070000000000000
          Height = 18.661410000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line5: TfrxLineView
          AllowVectorExport = True
          Left = -0.166666670000000000
          Top = 23.863326670000000000
          Width = 718.392703330000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
      end
      object Footer1: TfrxFooter
        FillType = ftBrush
        Frame.Typ = []
        Height = 128.881880000000000000
        Top = 370.393940000000000000
        Width = 718.110700000000000000
        object Line6: TfrxLineView
          AllowVectorExport = True
          Left = -1.000000000000000000
          Top = 22.858070000000000000
          Width = 723.826840000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Memo37: TfrxMemoView
          AllowVectorExport = True
          Left = 6.000000000000000000
          Top = 3.842300000000020000
          Width = 79.645640000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'ARTIGOS->')
          ParentFont = False
        end
        object Memo39: TfrxMemoView
          AllowVectorExport = True
          Left = 90.000000000000000000
          Top = 3.842300000000020000
          Width = 48.763760000000000000
          Height = 16.779530000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Artigos]')
          ParentFont = False
        end
        object Memo38: TfrxMemoView
          AllowVectorExport = True
          Left = 145.000000000000000000
          Top = 3.842300000000020000
          Width = 66.102350000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QUANT->')
          ParentFont = False
        end
        object Memo40: TfrxMemoView
          AllowVectorExport = True
          Left = 216.000000000000000000
          Top = 3.842300000000020000
          Width = 48.307050000000000000
          Height = 15.779530000000000000
          DisplayFormat.FormatStr = '%g'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Quant]')
          ParentFont = False
        end
        object Memo41: TfrxMemoView
          AllowVectorExport = True
          Left = 274.000000000000000000
          Top = 3.842300000000020000
          Width = 64.322820000000000000
          Height = 14.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'CUSTO->')
          ParentFont = False
        end
        object Memo42: TfrxMemoView
          AllowVectorExport = True
          Left = 343.000000000000000000
          Top = 3.842300000000020000
          Width = 61.645640000000000000
          Height = 15.000000000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Total]')
          ParentFont = False
        end
        object Memo43: TfrxMemoView
          AllowVectorExport = True
          Left = 411.000000000000000000
          Top = 2.842300000000020000
          Width = 66.000000000000000000
          Height = 15.779530000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'VENDA->')
          ParentFont = False
        end
        object Memo44: TfrxMemoView
          AllowVectorExport = True
          Left = 481.000000000000000000
          Top = 3.842300000000020000
          Width = 68.118120000000000000
          Height = 16.000000000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Vendeu]')
          ParentFont = False
        end
        object Memo45: TfrxMemoView
          AllowVectorExport = True
          Left = 564.000000000000000000
          Top = 2.842300000000020000
          Width = 38.220470000000000000
          Height = 17.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'DIF->')
          ParentFont = False
        end
        object Memo46: TfrxMemoView
          AllowVectorExport = True
          Left = 611.000000000000000000
          Top = 2.842300000000020000
          Width = 61.661410000000000000
          Height = 17.559060000000000000
          DisplayFormat.FormatStr = '%2.2f'
          DisplayFormat.Kind = fkNumeric
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[Lucro]')
          ParentFont = False
        end
        object Memo47: TfrxMemoView
          AllowVectorExport = True
          Left = 94.333333330000000000
          Top = 61.342300010000000000
          Width = 369.850340000000000000
          Height = 20.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Referencias]')
          ParentFont = False
        end
        object Memo49: TfrxMemoView
          AllowVectorExport = True
          Left = 14.833333330000000000
          Top = 82.675633330000000000
          Width = 450.763760000000000000
          Height = 19.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'COMPROVANTE:[Pedido]')
          ParentFont = False
        end
        object Memo50: TfrxMemoView
          AllowVectorExport = True
          Left = 16.000000000000000000
          Top = 105.175633330000000000
          Width = 451.063080000000000000
          Height = 20.559060000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[Numcliente]')
          ParentFont = False
        end
        object Line18: TfrxLineView
          AllowVectorExport = True
          Left = 556.000000000000000000
          Top = 3.724179999999990000
          Height = 16.220470000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line7: TfrxLineView
          AllowVectorExport = True
          Left = 3.000000000000000000
          Top = 0.724179999999990000
          Width = 711.000000000000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line19: TfrxLineView
          AllowVectorExport = True
          Left = 89.833333330000000000
          Top = 53.724180000000000000
          Width = 352.166666670000000000
          Color = clBlack
          Frame.Typ = [ftTop]
        end
        object Line20: TfrxLineView
          AllowVectorExport = True
          Left = 334.166666670000000000
          Top = 34.724180010000000000
          Width = -6.833333330000000000
          Height = 16.833333330000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Line21: TfrxLineView
          AllowVectorExport = True
          Left = 376.666666670000000000
          Top = 37.224180000000000000
          Width = -5.833333340000000000
          Height = 14.446196670000000000
          Color = clBlack
          Frame.Typ = []
          Diagonal = True
        end
        object Memo52: TfrxMemoView
          AllowVectorExport = True
          Left = 6.500000010000000000
          Top = 30.390846670000000000
          Width = 81.543290000000000000
          Height = 19.000000000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'ASS.DATA')
          ParentFont = False
        end
        object Memo53: TfrxMemoView
          AllowVectorExport = True
          Left = 612.064316670000000000
          Top = 32.003710000000000000
          Width = 67.527520000000000000
          Height = 22.338590000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            ' VENDIDO')
          ParentFont = False
        end
        object Memo57: TfrxMemoView
          AllowVectorExport = True
          Left = 486.779840000000000000
          Top = 32.015770000000000000
          Width = 64.252010000000000000
          Height = 22.677180000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            'QTD.DEV')
          ParentFont = False
        end
        object Line22: TfrxLineView
          AllowVectorExport = True
          Left = 556.149970000000000000
          Top = 29.456710000000000000
          Height = 64.252010000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Line23: TfrxLineView
          AllowVectorExport = True
          Left = 621.401980000000000000
          Top = 65.252010000000000000
          Height = 30.236240000000000000
          Color = clBlack
          Frame.Typ = [ftLeft]
        end
        object Shape1: TfrxShapeView
          AllowVectorExport = True
          Left = 475.167903340000000000
          Top = 27.783240000000000000
          Width = 239.599876670000000000
          Height = 70.295300000000000000
          Frame.Typ = []
        end
      end
    end
  end
  object DtsPedvenda: TfrxDBDataset
    UserName = 'frxDBDataset3'
    CloseDataSource = False
    FieldAliases.Strings = (
      'ITEM=ITEM'
      'CODART=CODART'
      'DESCRICAO=DESCRICAO'
      'QTDSAI=QTDSAI'
      'QTDRET=QTDRET'
      'PRECUS=PRECUS'
      'PREVEN=PREVEN'
      'QTDANT=QTDANT'
      'CUSANT=CUSANT'
      'VENANT=VENANT'
      'OPER=OPER')
    DataSet = IBTAuxrecibo
    BCDToCurrency = False
    Left = 137
    Top = 139
  end
  object IBQAuxrecibo: TIBQuery
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from AUXRECIBO')
    Left = 299
    Top = 130
    object IBQAuxreciboITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"AUXRECIBO"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQAuxreciboCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"AUXRECIBO"."CODART"'
      Size = 4
    end
    object IBQAuxreciboDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"AUXRECIBO"."DESCRICAO"'
      Size = 40
    end
    object IBQAuxreciboQTDSAI: TIBStringField
      FieldName = 'QTDSAI'
      Origin = '"AUXRECIBO"."QTDSAI"'
      Size = 8
    end
    object IBQAuxreciboQTDRET: TIBStringField
      FieldName = 'QTDRET'
      Origin = '"AUXRECIBO"."QTDRET"'
      Size = 8
    end
    object IBQAuxreciboPRECUS: TIBStringField
      FieldName = 'PRECUS'
      Origin = '"AUXRECIBO"."PRECUS"'
      Size = 12
    end
    object IBQAuxreciboPREVEN: TIBStringField
      FieldName = 'PREVEN'
      Origin = '"AUXRECIBO"."PREVEN"'
      Size = 12
    end
    object IBQAuxreciboQTDANT: TIBStringField
      FieldName = 'QTDANT'
      Origin = '"AUXRECIBO"."QTDANT"'
      Size = 8
    end
    object IBQAuxreciboCUSANT: TIBStringField
      FieldName = 'CUSANT'
      Origin = '"AUXRECIBO"."CUSANT"'
      Size = 12
    end
    object IBQAuxreciboVENANT: TIBStringField
      FieldName = 'VENANT'
      Origin = '"AUXRECIBO"."VENANT"'
      Size = 12
    end
    object IBQAuxreciboOPER: TIBStringField
      FieldName = 'OPER'
      Origin = '"AUXRECIBO"."OPER"'
      Size = 1
    end
  end
  object IBTAuxrecibo: TIBTable
    Database = DModRosa.IBDatabase2
    Transaction = DModRosa.IBTransaction2
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'AUXRECIBO'
    UniDirectional = False
    Left = 211
    Top = 137
    object IBTAuxreciboITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 3
    end
    object IBTAuxreciboCODART: TIBStringField
      FieldName = 'CODART'
      Size = 4
    end
    object IBTAuxreciboDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTAuxreciboQTDSAI: TIBStringField
      FieldName = 'QTDSAI'
      Size = 8
    end
    object IBTAuxreciboQTDRET: TIBStringField
      FieldName = 'QTDRET'
      Size = 8
    end
    object IBTAuxreciboPRECUS: TIBStringField
      FieldName = 'PRECUS'
      Size = 12
    end
    object IBTAuxreciboPREVEN: TIBStringField
      FieldName = 'PREVEN'
      Size = 12
    end
    object IBTAuxreciboQTDANT: TIBStringField
      FieldName = 'QTDANT'
      Size = 8
    end
    object IBTAuxreciboCUSANT: TIBStringField
      FieldName = 'CUSANT'
      Size = 12
    end
    object IBTAuxreciboVENANT: TIBStringField
      FieldName = 'VENANT'
      Size = 12
    end
    object IBTAuxreciboOPER: TIBStringField
      FieldName = 'OPER'
      Size = 1
    end
  end
end
