object DModRosa: TDModRosa
  OldCreateOrder = False
  Height = 795
  Width = 1003
  object IBDatabase1: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Rosa\DBROSA.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction1
    ServerType = 'IBServer'
    Left = 670
    Top = 688
  end
  object IBDatabase2: TIBDatabase
    Connected = True
    DatabaseName = 'C:\Rosa\DBAUXROSA.GDB'
    Params.Strings = (
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = IBTransaction2
    ServerType = 'IBServer'
    Left = 840
    Top = 688
  end
  object IBTransaction1: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase1
    Left = 756
    Top = 688
  end
  object IBTransaction2: TIBTransaction
    Active = True
    DefaultDatabase = IBDatabase2
    Left = 930
    Top = 696
  end
  object IBTCliente: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CLIENTE'
    UniDirectional = False
    Left = 24
    Top = 16
    object IBTClienteIDCLI: TIntegerField
      FieldName = 'IDCLI'
      Required = True
    end
    object IBTClienteNCPF: TIBStringField
      FieldName = 'NCPF'
      Size = 15
    end
    object IBTClienteNIFP: TIBStringField
      FieldName = 'NIFP'
      Size = 15
    end
    object IBTClienteBAIR: TIBStringField
      FieldName = 'BAIR'
    end
    object IBTClienteCIDA: TIBStringField
      FieldName = 'CIDA'
    end
    object IBTClienteESTA: TIBStringField
      FieldName = 'ESTA'
      Size = 2
    end
    object IBTClienteNCEP: TIBStringField
      FieldName = 'NCEP'
      Size = 9
    end
    object IBTClienteNTEL: TIBStringField
      FieldName = 'NTEL'
      Size = 30
    end
    object IBTClienteCONTA: TIBStringField
      FieldName = 'CONTA'
      Size = 30
    end
    object IBTClienteVEND: TIBStringField
      FieldName = 'VEND'
      Size = 3
    end
    object IBTClienteLCRED: TIBBCDField
      FieldName = 'LCRED'
      Precision = 18
      Size = 2
    end
    object IBTClienteDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Size = 10
    end
    object IBTClienteNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Size = 35
    end
    object IBTClienteNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Size = 35
    end
    object IBTClienteDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Size = 10
    end
    object IBTClienteNATU: TIBStringField
      FieldName = 'NATU'
      Size = 2
    end
    object IBTClienteROTA: TIBStringField
      FieldName = 'ROTA'
      Size = 3
    end
    object IBTClientePRACA: TIBStringField
      FieldName = 'PRACA'
      Size = 3
    end
    object IBTClienteREFER: TIBStringField
      FieldName = 'REFER'
      Size = 40
    end
    object IBTClienteOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Size = 4
    end
    object IBTClienteSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTClienteNOME: TIBStringField
      FieldName = 'NOME'
      Size = 50
    end
    object IBTClienteENDE: TIBStringField
      FieldName = 'ENDE'
      Size = 60
    end
    object IBTClienteHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Size = 5
    end
    object IBTClienteHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Size = 5
    end
    object IBTClienteVISITA: TIBStringField
      FieldName = 'VISITA'
      Size = 12
    end
    object IBTClienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Size = 1
    end
    object IBTClienteESPED: TIBStringField
      FieldName = 'ESPED'
      Size = 6
    end
    object IBTClienteOBSV: TBlobField
      FieldName = 'OBSV'
    end
  end
  object IBTArtigo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ARTIGO'
    UniDirectional = False
    Left = 24
    Top = 128
    object IBTArtigoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 4
    end
    object IBTArtigoGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Size = 2
    end
    object IBTArtigoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTArtigoCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
    object IBTArtigoVENDA: TIBBCDField
      FieldName = 'VENDA'
      Precision = 18
      Size = 2
    end
    object IBTArtigoESTOQ: TIBBCDField
      FieldName = 'ESTOQ'
      Precision = 9
      Size = 2
    end
    object IBTArtigoUDATA: TIBStringField
      FieldName = 'UDATA'
      Size = 10
    end
    object IBTArtigoTABEL: TIBStringField
      FieldName = 'TABEL'
      Size = 1
    end
    object IBTArtigoPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Precision = 18
      Size = 2
    end
  end
  object IBTVendedor: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'VENDEDOR'
    UniDirectional = False
    Left = 24
    Top = 72
    object IBTVendedorCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Required = True
      Size = 3
    end
    object IBTVendedorNOME: TIBStringField
      FieldName = 'NOME'
      Size = 35
    end
    object IBTVendedorNCPF: TIBStringField
      FieldName = 'NCPF'
      Size = 15
    end
    object IBTVendedorNIFP: TIBStringField
      FieldName = 'NIFP'
      Size = 15
    end
    object IBTVendedorENDE: TIBStringField
      FieldName = 'ENDE'
      Size = 40
    end
    object IBTVendedorBAIR: TIBStringField
      FieldName = 'BAIR'
    end
    object IBTVendedorCIDA: TIBStringField
      FieldName = 'CIDA'
    end
    object IBTVendedorESTA: TIBStringField
      FieldName = 'ESTA'
      Size = 2
    end
    object IBTVendedorNCEP: TIBStringField
      FieldName = 'NCEP'
      Size = 9
    end
    object IBTVendedorNTEL: TIBStringField
      FieldName = 'NTEL'
      Size = 30
    end
    object IBTVendedorPRACA1: TIBStringField
      FieldName = 'PRACA1'
      Size = 3
    end
    object IBTVendedorPRACA2: TIBStringField
      FieldName = 'PRACA2'
      Size = 3
    end
    object IBTVendedorPRACA3: TIBStringField
      FieldName = 'PRACA3'
      Size = 3
    end
    object IBTVendedorPRACA4: TIBStringField
      FieldName = 'PRACA4'
      Size = 3
    end
    object IBTVendedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Size = 30
    end
    object IBTVendedorDATSOL: TIBStringField
      FieldName = 'DATSOL'
      Size = 10
    end
    object IBTVendedorNUMSOL: TIBStringField
      FieldName = 'NUMSOL'
      Size = 6
    end
  end
  object IBTCompra: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'COMPRA'
    UniDirectional = False
    Left = 24
    Top = 184
    object IBTCompraDATPED: TDateField
      FieldName = 'DATPED'
      Required = True
    end
    object IBTCompraTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Required = True
      Size = 3
    end
    object IBTCompraNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Required = True
      Size = 8
    end
    object IBTCompraFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Size = 15
    end
    object IBTCompraENTREG: TDateField
      FieldName = 'ENTREG'
    end
    object IBTCompraTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Precision = 18
      Size = 2
    end
    object IBTCompraDATNOT: TDateField
      FieldName = 'DATNOT'
    end
    object IBTCompraTIPNOT: TIBStringField
      FieldName = 'TIPNOT'
      Size = 3
    end
    object IBTCompraNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Size = 8
    end
    object IBTCompraDESCON: TIBBCDField
      FieldName = 'DESCON'
      Precision = 18
      Size = 2
    end
    object IBTCompraFRETE: TIBBCDField
      FieldName = 'FRETE'
      Precision = 18
      Size = 2
    end
    object IBTCompraVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Precision = 18
      Size = 2
    end
    object IBTCompraSITPED: TIBStringField
      FieldName = 'SITPED'
      Size = 1
    end
    object IBTCompraPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Size = 2
    end
    object IBTCompraOBSERV: TBlobField
      FieldName = 'OBSERV'
    end
  end
  object IBTDevolucao: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DEVOLUCAO'
    UniDirectional = False
    Left = 24
    Top = 240
    object IBTDevolucaoNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Required = True
      Size = 6
    end
    object IBTDevolucaoDATNOT: TDateField
      FieldName = 'DATNOT'
    end
    object IBTDevolucaoVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Precision = 18
      Size = 2
    end
    object IBTDevolucaoROMNOT: TIBStringField
      FieldName = 'ROMNOT'
      Size = 6
    end
    object IBTDevolucaoCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTDevolucaoDATBAS: TDateField
      FieldName = 'DATBAS'
    end
    object IBTDevolucaoCLIENOT: TIBStringField
      FieldName = 'CLIENOT'
      Size = 40
    end
  end
  object IBTDefeito: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'DEFEITO'
    UniDirectional = False
    Left = 24
    Top = 352
    object IBTDefeitoNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Required = True
      Size = 6
    end
    object IBTDefeitoDATNOT: TDateField
      FieldName = 'DATNOT'
    end
    object IBTDefeitoVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Precision = 18
      Size = 2
    end
  end
  object IBTSolicitacao: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    FieldDefs = <
      item
        Name = 'VENDEDOR'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NUMERO'
        Attributes = [faRequired]
        DataType = ftString
        Size = 6
      end
      item
        Name = 'CLIENTE'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'NOMCLI'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DATSOL'
        DataType = ftDate
      end
      item
        Name = 'SITU'
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    TableName = 'SOLICITACAO'
    UniDirectional = False
    Left = 24
    Top = 408
    object IBTSolicitacaoVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Required = True
      Size = 3
    end
    object IBTSolicitacaoNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Required = True
      Size = 6
    end
    object IBTSolicitacaoCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Size = 4
    end
    object IBTSolicitacaoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTSolicitacaoDATSOL: TDateField
      FieldName = 'DATSOL'
    end
    object IBTSolicitacaoSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
  end
  object IBTPedido: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PEDIDO'
    UniDirectional = False
    Left = 24
    Top = 296
    object IBTPedidoIDPED: TIntegerField
      FieldName = 'IDPED'
      Required = True
    end
    object IBTPedidoPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Size = 6
    end
    object IBTPedidoCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTPedidoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTPedidoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTPedidoBASE: TDateField
      FieldName = 'BASE'
    end
    object IBTPedidoRECOL: TDateField
      FieldName = 'RECOL'
    end
    object IBTPedidoCOBRAN: TDateField
      FieldName = 'COBRAN'
    end
    object IBTPedidoTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Precision = 18
      Size = 2
    end
    object IBTPedidoSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTPedidoDATPED: TIBStringField
      FieldName = 'DATPED'
      Size = 10
    end
    object IBTPedidoSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Size = 6
    end
    object IBTPedidoRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTPedidoTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Precision = 18
      Size = 2
    end
    object IBTPedidoDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTPedidoVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Precision = 18
      Size = 2
    end
    object IBTPedidoRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Precision = 18
      Size = 2
    end
    object IBTPedidoCOB: TIBStringField
      FieldName = 'COB'
      Size = 1
    end
    object IBTPedidoLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Size = 10
    end
    object IBTPedidoVIA: TIBStringField
      FieldName = 'VIA'
      Size = 1
    end
    object IBTPedidoOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Size = 6
    end
  end
  object IBQPesq_solicit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from SOLICITACAO')
    Left = 242
    Top = 408
    object IBQPesq_solicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"SOLICITACAO"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_solicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"SOLICITACAO"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_solicitCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"SOLICITACAO"."CLIENTE"'
      Size = 4
    end
    object IBQPesq_solicitNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"SOLICITACAO"."NOMCLI"'
      Size = 40
    end
    object IBQPesq_solicitDATSOL: TDateField
      FieldName = 'DATSOL'
      Origin = '"SOLICITACAO"."DATSOL"'
    end
    object IBQPesq_solicitSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"SOLICITACAO"."SITU"'
      Size = 1
    end
  end
  object IBQPesq_cli: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CLIENTE')
    Left = 232
    Top = 16
    object IBQPesq_cliIDCLI: TIntegerField
      FieldName = 'IDCLI'
      Origin = '"CLIENTE"."IDCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQPesq_cliNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"CLIENTE"."NCPF"'
      Size = 15
    end
    object IBQPesq_cliNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"CLIENTE"."NIFP"'
      Size = 15
    end
    object IBQPesq_cliBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"CLIENTE"."BAIR"'
    end
    object IBQPesq_cliCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"CLIENTE"."CIDA"'
    end
    object IBQPesq_cliESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"CLIENTE"."ESTA"'
      Size = 2
    end
    object IBQPesq_cliNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"CLIENTE"."NCEP"'
      Size = 9
    end
    object IBQPesq_cliNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"CLIENTE"."NTEL"'
      Size = 30
    end
    object IBQPesq_cliCONTA: TIBStringField
      FieldName = 'CONTA'
      Origin = '"CLIENTE"."CONTA"'
      Size = 30
    end
    object IBQPesq_cliVEND: TIBStringField
      FieldName = 'VEND'
      Origin = '"CLIENTE"."VEND"'
      Size = 3
    end
    object IBQPesq_cliLCRED: TIBBCDField
      FieldName = 'LCRED'
      Origin = '"CLIENTE"."LCRED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_cliDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Origin = '"CLIENTE"."DATIMP"'
      Size = 10
    end
    object IBQPesq_cliNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Origin = '"CLIENTE"."NOMMAE"'
      Size = 35
    end
    object IBQPesq_cliNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Origin = '"CLIENTE"."NOMPAI"'
      Size = 35
    end
    object IBQPesq_cliDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Origin = '"CLIENTE"."DATNASC"'
      Size = 10
    end
    object IBQPesq_cliNATU: TIBStringField
      FieldName = 'NATU'
      Origin = '"CLIENTE"."NATU"'
      Size = 2
    end
    object IBQPesq_cliROTA: TIBStringField
      FieldName = 'ROTA'
      Origin = '"CLIENTE"."ROTA"'
      Size = 3
    end
    object IBQPesq_cliPRACA: TIBStringField
      FieldName = 'PRACA'
      Origin = '"CLIENTE"."PRACA"'
      Size = 3
    end
    object IBQPesq_cliREFER: TIBStringField
      FieldName = 'REFER'
      Origin = '"CLIENTE"."REFER"'
      Size = 40
    end
    object IBQPesq_cliOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Origin = '"CLIENTE"."OLDCLI"'
      Size = 4
    end
    object IBQPesq_cliSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"CLIENTE"."SITU"'
      Size = 1
    end
    object IBQPesq_cliNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Size = 50
    end
    object IBQPesq_cliENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"CLIENTE"."ENDE"'
      Size = 60
    end
    object IBQPesq_cliHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Origin = '"CLIENTE"."HORAIN"'
      Size = 5
    end
    object IBQPesq_cliHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Origin = '"CLIENTE"."HORAFIN"'
      Size = 5
    end
    object IBQPesq_cliVISITA: TIBStringField
      FieldName = 'VISITA'
      Origin = '"CLIENTE"."VISITA"'
      Size = 12
    end
    object IBQPesq_cliATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"CLIENTE"."ATIVO"'
      Size = 1
    end
    object IBQPesq_cliESPED: TIBStringField
      FieldName = 'ESPED'
      Origin = '"CLIENTE"."ESPED"'
      Size = 6
    end
    object IBQPesq_cliOBSV: TBlobField
      FieldName = 'OBSV'
      Origin = '"CLIENTE"."OBSV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBQPesq_art: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ARTIGO')
    Left = 233
    Top = 128
    object IBQPesq_artCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ARTIGO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesq_artGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"ARTIGO"."GRUPO"'
      Size = 2
    end
    object IBQPesq_artDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ARTIGO"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_artCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ARTIGO"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_artVENDA: TIBBCDField
      FieldName = 'VENDA'
      Origin = '"ARTIGO"."VENDA"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_artESTOQ: TIBBCDField
      FieldName = 'ESTOQ'
      Origin = '"ARTIGO"."ESTOQ"'
      DisplayFormat = '###0.0'
      Precision = 9
      Size = 2
    end
    object IBQPesq_artUDATA: TIBStringField
      FieldName = 'UDATA'
      Origin = '"ARTIGO"."UDATA"'
      Size = 10
    end
    object IBQPesq_artTABEL: TIBStringField
      FieldName = 'TABEL'
      Origin = '"ARTIGO"."TABEL"'
      Size = 1
    end
    object IBQPesq_artPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Origin = '"ARTIGO"."PRECOM"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_art: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ARTIGO')
    Left = 365
    Top = 128
    object IBQVer_artCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ARTIGO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQVer_artGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"ARTIGO"."GRUPO"'
      Size = 2
    end
    object IBQVer_artDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ARTIGO"."DESCRICAO"'
      Size = 40
    end
    object IBQVer_artCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ARTIGO"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQVer_artVENDA: TIBBCDField
      FieldName = 'VENDA'
      Origin = '"ARTIGO"."VENDA"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQVer_artESTOQ: TIBBCDField
      FieldName = 'ESTOQ'
      Origin = '"ARTIGO"."ESTOQ"'
      DisplayFormat = '###0.0'
      Precision = 9
      Size = 2
    end
    object IBQVer_artUDATA: TIBStringField
      FieldName = 'UDATA'
      Origin = '"ARTIGO"."UDATA"'
      Size = 10
    end
    object IBQVer_artTABEL: TIBStringField
      FieldName = 'TABEL'
      Origin = '"ARTIGO"."TABEL"'
      Size = 1
    end
    object IBQVer_artPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Origin = '"ARTIGO"."PRECOM"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQLer_ven: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from VENDEDOR')
    Left = 429
    Top = 72
    object IBQLer_venCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"VENDEDOR"."CODVEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQLer_venNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"VENDEDOR"."NOME"'
      Size = 35
    end
    object IBQLer_venNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"VENDEDOR"."NCPF"'
      Size = 15
    end
    object IBQLer_venNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"VENDEDOR"."NIFP"'
      Size = 15
    end
    object IBQLer_venENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"VENDEDOR"."ENDE"'
      Size = 40
    end
    object IBQLer_venBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"VENDEDOR"."BAIR"'
    end
    object IBQLer_venCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"VENDEDOR"."CIDA"'
    end
    object IBQLer_venESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"VENDEDOR"."ESTA"'
      Size = 2
    end
    object IBQLer_venNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"VENDEDOR"."NCEP"'
      Size = 9
    end
    object IBQLer_venNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"VENDEDOR"."NTEL"'
      Size = 30
    end
    object IBQLer_venPRACA1: TIBStringField
      FieldName = 'PRACA1'
      Origin = '"VENDEDOR"."PRACA1"'
      Size = 3
    end
    object IBQLer_venPRACA2: TIBStringField
      FieldName = 'PRACA2'
      Origin = '"VENDEDOR"."PRACA2"'
      Size = 3
    end
    object IBQLer_venPRACA3: TIBStringField
      FieldName = 'PRACA3'
      Origin = '"VENDEDOR"."PRACA3"'
      Size = 3
    end
    object IBQLer_venPRACA4: TIBStringField
      FieldName = 'PRACA4'
      Origin = '"VENDEDOR"."PRACA4"'
      Size = 3
    end
    object IBQLer_venEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"VENDEDOR"."EMAIL"'
      Size = 30
    end
    object IBQLer_venDATSOL: TIBStringField
      FieldName = 'DATSOL'
      Origin = '"VENDEDOR"."DATSOL"'
      Size = 10
    end
    object IBQLer_venNUMSOL: TIBStringField
      FieldName = 'NUMSOL'
      Origin = '"VENDEDOR"."NUMSOL"'
      Size = 6
    end
  end
  object IBQPesq_ped: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PEDIDO')
    Left = 208
    Top = 296
    object IBQPesq_pedIDPED: TIntegerField
      FieldName = 'IDPED'
      Origin = '"PEDIDO"."IDPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQPesq_pedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"PEDIDO"."PEDIDO"'
      Size = 6
    end
    object IBQPesq_pedCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"PEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQPesq_pedCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"PEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQPesq_pedNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"PEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQPesq_pedBASE: TDateField
      FieldName = 'BASE'
      Origin = '"PEDIDO"."BASE"'
    end
    object IBQPesq_pedRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"PEDIDO"."RECOL"'
    end
    object IBQPesq_pedCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"PEDIDO"."COBRAN"'
    end
    object IBQPesq_pedTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"PEDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_pedSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"PEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQPesq_pedDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"PEDIDO"."DATPED"'
      Size = 10
    end
    object IBQPesq_pedSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"PEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQPesq_pedRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"PEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQPesq_pedTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"PEDIDO"."TOTVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_pedDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"PEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQPesq_pedVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"PEDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_pedRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"PEDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_pedCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"PEDIDO"."COB"'
      Size = 1
    end
    object IBQPesq_pedLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"PEDIDO"."LIMITE"'
      Size = 10
    end
    object IBQPesq_pedVIA: TIBStringField
      FieldName = 'VIA'
      Origin = '"PEDIDO"."VIA"'
      Size = 1
    end
    object IBQPesq_pedOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Origin = '"PEDIDO"."OLDPED"'
      Size = 6
    end
  end
  object IBQPesq_dev: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from DEVOLUCAO')
    Left = 237
    Top = 240
    object IBQPesq_devNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"DEVOLUCAO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_devDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"DEVOLUCAO"."DATNOT"'
    end
    object IBQPesq_devVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"DEVOLUCAO"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_devROMNOT: TIBStringField
      FieldName = 'ROMNOT'
      Origin = '"DEVOLUCAO"."ROMNOT"'
      Size = 6
    end
    object IBQPesq_devCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"DEVOLUCAO"."CODVEN"'
      Size = 3
    end
    object IBQPesq_devDATBAS: TDateField
      FieldName = 'DATBAS'
      Origin = '"DEVOLUCAO"."DATBAS"'
    end
    object IBQPesq_devCLIENOT: TIBStringField
      FieldName = 'CLIENOT'
      Origin = '"DEVOLUCAO"."CLIENOT"'
      Size = 40
    end
  end
  object IBQVer_cli: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CLIENTE')
    Left = 368
    Top = 16
  end
  object IBQExc_cli: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CLIENTE')
    Left = 491
    Top = 16
  end
  object IBQVer_ven: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from VENDEDOR')
    Left = 368
    Top = 72
    object IBQVer_venCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"VENDEDOR"."CODVEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_venNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"VENDEDOR"."NOME"'
      Size = 35
    end
    object IBQVer_venNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"VENDEDOR"."NCPF"'
      Size = 15
    end
    object IBQVer_venNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"VENDEDOR"."NIFP"'
      Size = 15
    end
    object IBQVer_venENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"VENDEDOR"."ENDE"'
      Size = 40
    end
    object IBQVer_venBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"VENDEDOR"."BAIR"'
    end
    object IBQVer_venCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"VENDEDOR"."CIDA"'
    end
    object IBQVer_venESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"VENDEDOR"."ESTA"'
      Size = 2
    end
    object IBQVer_venNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"VENDEDOR"."NCEP"'
      Size = 9
    end
    object IBQVer_venNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"VENDEDOR"."NTEL"'
      Size = 30
    end
    object IBQVer_venPRACA1: TIBStringField
      FieldName = 'PRACA1'
      Origin = '"VENDEDOR"."PRACA1"'
      Size = 3
    end
    object IBQVer_venPRACA2: TIBStringField
      FieldName = 'PRACA2'
      Origin = '"VENDEDOR"."PRACA2"'
      Size = 3
    end
    object IBQVer_venPRACA3: TIBStringField
      FieldName = 'PRACA3'
      Origin = '"VENDEDOR"."PRACA3"'
      Size = 3
    end
    object IBQVer_venPRACA4: TIBStringField
      FieldName = 'PRACA4'
      Origin = '"VENDEDOR"."PRACA4"'
      Size = 3
    end
    object IBQVer_venEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"VENDEDOR"."EMAIL"'
      Size = 30
    end
    object IBQVer_venDATSOL: TIBStringField
      FieldName = 'DATSOL'
      Origin = '"VENDEDOR"."DATSOL"'
      Size = 10
    end
    object IBQVer_venNUMSOL: TIBStringField
      FieldName = 'NUMSOL'
      Origin = '"VENDEDOR"."NUMSOL"'
      Size = 6
    end
  end
  object IBQVer_comp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from COMPRA')
    Left = 349
    Top = 184
    object IBQVer_compDATPED: TDateField
      FieldName = 'DATPED'
      Origin = '"COMPRA"."DATPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQVer_compTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"COMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_compNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"COMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQVer_compFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Origin = '"COMPRA"."FORNEC"'
      Size = 15
    end
    object IBQVer_compENTREG: TDateField
      FieldName = 'ENTREG'
      Origin = '"COMPRA"."ENTREG"'
    end
    object IBQVer_compTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"COMPRA"."TOTPED"'
      Precision = 18
      Size = 2
    end
    object IBQVer_compDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"COMPRA"."DATNOT"'
    end
    object IBQVer_compTIPNOT: TIBStringField
      FieldName = 'TIPNOT'
      Origin = '"COMPRA"."TIPNOT"'
      Size = 3
    end
    object IBQVer_compNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"COMPRA"."NUMNOT"'
      Size = 8
    end
    object IBQVer_compDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"COMPRA"."DESCON"'
      Precision = 18
      Size = 2
    end
    object IBQVer_compFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = '"COMPRA"."FRETE"'
      Precision = 18
      Size = 2
    end
    object IBQVer_compVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"COMPRA"."VALNOT"'
      Precision = 18
      Size = 2
    end
    object IBQVer_compSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"COMPRA"."SITPED"'
      Size = 1
    end
    object IBQVer_compPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"COMPRA"."PARCEL"'
      Size = 2
    end
    object IBQVer_compOBSERV: TBlobField
      FieldName = 'OBSERV'
      Origin = '"COMPRA"."OBSERV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBQPesq_comp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from COMPRA')
    Left = 206
    Top = 184
    object IBQPesq_compDATPED: TDateField
      FieldName = 'DATPED'
      Origin = '"COMPRA"."DATPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQPesq_compTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"COMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_compNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"COMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQPesq_compFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Origin = '"COMPRA"."FORNEC"'
      Size = 15
    end
    object IBQPesq_compENTREG: TDateField
      FieldName = 'ENTREG'
      Origin = '"COMPRA"."ENTREG"'
    end
    object IBQPesq_compTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"COMPRA"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_compDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"COMPRA"."DATNOT"'
    end
    object IBQPesq_compTIPNOT: TIBStringField
      FieldName = 'TIPNOT'
      Origin = '"COMPRA"."TIPNOT"'
      Size = 3
    end
    object IBQPesq_compNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"COMPRA"."NUMNOT"'
      Size = 8
    end
    object IBQPesq_compDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"COMPRA"."DESCON"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_compFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = '"COMPRA"."FRETE"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_compVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"COMPRA"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_compSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"COMPRA"."SITPED"'
      Size = 1
    end
    object IBQPesq_compPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"COMPRA"."PARCEL"'
      Size = 2
    end
    object IBQPesq_compOBSERV: TBlobField
      FieldName = 'OBSERV'
      Origin = '"COMPRA"."OBSERV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBQPesq_def: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from DEFEITO')
    Left = 216
    Top = 352
    object IBQPesq_defNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"DEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_defDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"DEFEITO"."DATNOT"'
    end
    object IBQPesq_defVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"DEFEITO"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQLer_art: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ARTIGO')
    Left = 428
    Top = 128
    object IBQLer_artCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ARTIGO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQLer_artGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"ARTIGO"."GRUPO"'
      Size = 2
    end
    object IBQLer_artDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ARTIGO"."DESCRICAO"'
      Size = 40
    end
    object IBQLer_artCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ARTIGO"."CUSTO"'
      Precision = 18
      Size = 2
    end
    object IBQLer_artVENDA: TIBBCDField
      FieldName = 'VENDA'
      Origin = '"ARTIGO"."VENDA"'
      Precision = 18
      Size = 2
    end
    object IBQLer_artESTOQ: TIBBCDField
      FieldName = 'ESTOQ'
      Origin = '"ARTIGO"."ESTOQ"'
      Precision = 9
      Size = 2
    end
    object IBQLer_artUDATA: TIBStringField
      FieldName = 'UDATA'
      Origin = '"ARTIGO"."UDATA"'
      Size = 10
    end
    object IBQLer_artTABEL: TIBStringField
      FieldName = 'TABEL'
      Origin = '"ARTIGO"."TABEL"'
      Size = 1
    end
    object IBQLer_artPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Origin = '"ARTIGO"."PRECOM"'
      Precision = 18
      Size = 2
    end
    object IBQLer_artPREVIP: TIBBCDField
      FieldName = 'PREVIP'
      Origin = '"ARTIGO"."PREVIP"'
      Precision = 18
      Size = 2
    end
  end
  object IBQPesq_ven: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from VENDEDOR')
    Left = 234
    Top = 72
    object IBQPesq_venCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"VENDEDOR"."CODVEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_venNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"VENDEDOR"."NOME"'
      Size = 35
    end
    object IBQPesq_venNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"VENDEDOR"."NCPF"'
      Size = 15
    end
    object IBQPesq_venNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"VENDEDOR"."NIFP"'
      Size = 15
    end
    object IBQPesq_venENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"VENDEDOR"."ENDE"'
      Size = 40
    end
    object IBQPesq_venBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"VENDEDOR"."BAIR"'
    end
    object IBQPesq_venCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"VENDEDOR"."CIDA"'
    end
    object IBQPesq_venESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"VENDEDOR"."ESTA"'
      Size = 2
    end
    object IBQPesq_venNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"VENDEDOR"."NCEP"'
      Size = 9
    end
    object IBQPesq_venNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"VENDEDOR"."NTEL"'
      Size = 30
    end
    object IBQPesq_venPRACA1: TIBStringField
      FieldName = 'PRACA1'
      Origin = '"VENDEDOR"."PRACA1"'
      Size = 3
    end
    object IBQPesq_venPRACA2: TIBStringField
      FieldName = 'PRACA2'
      Origin = '"VENDEDOR"."PRACA2"'
      Size = 3
    end
    object IBQPesq_venPRACA3: TIBStringField
      FieldName = 'PRACA3'
      Origin = '"VENDEDOR"."PRACA3"'
      Size = 3
    end
    object IBQPesq_venPRACA4: TIBStringField
      FieldName = 'PRACA4'
      Origin = '"VENDEDOR"."PRACA4"'
      Size = 3
    end
    object IBQPesq_venEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"VENDEDOR"."EMAIL"'
      Size = 30
    end
    object IBQPesq_venDATSOL: TIBStringField
      FieldName = 'DATSOL'
      Origin = '"VENDEDOR"."DATSOL"'
      Size = 10
    end
    object IBQPesq_venNUMSOL: TIBStringField
      FieldName = 'NUMSOL'
      Origin = '"VENDEDOR"."NUMSOL"'
      Size = 6
    end
  end
  object IBQLer_cli: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CLIENTE')
    Left = 428
    Top = 16
  end
  object IBQLer_comp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from COMPRA')
    Left = 417
    Top = 184
    object IBQLer_compDATPED: TDateField
      FieldName = 'DATPED'
      Origin = '"COMPRA"."DATPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQLer_compTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"COMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQLer_compNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"COMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQLer_compFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Origin = '"COMPRA"."FORNEC"'
      Size = 15
    end
    object IBQLer_compENTREG: TDateField
      FieldName = 'ENTREG'
      Origin = '"COMPRA"."ENTREG"'
    end
    object IBQLer_compTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"COMPRA"."TOTPED"'
      Precision = 18
      Size = 2
    end
    object IBQLer_compDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"COMPRA"."DATNOT"'
    end
    object IBQLer_compTIPNOT: TIBStringField
      FieldName = 'TIPNOT'
      Origin = '"COMPRA"."TIPNOT"'
      Size = 3
    end
    object IBQLer_compNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"COMPRA"."NUMNOT"'
      Size = 8
    end
    object IBQLer_compDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"COMPRA"."DESCON"'
      Precision = 18
      Size = 2
    end
    object IBQLer_compFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = '"COMPRA"."FRETE"'
      Precision = 18
      Size = 2
    end
    object IBQLer_compVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"COMPRA"."VALNOT"'
      Precision = 18
      Size = 2
    end
    object IBQLer_compSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"COMPRA"."SITPED"'
      Size = 1
    end
    object IBQLer_compPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"COMPRA"."PARCEL"'
      Size = 2
    end
    object IBQLer_compOBSERV: TBlobField
      FieldName = 'OBSERV'
      Origin = '"COMPRA"."OBSERV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBQLer_itped: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMPEDIDO')
    Left = 931
    Top = 296
  end
  object IBQVer_dev: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from DEVOLUCAO')
    Left = 363
    Top = 240
    object IBQVer_devNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"DEVOLUCAO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_devDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"DEVOLUCAO"."DATNOT"'
    end
    object IBQVer_devVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"DEVOLUCAO"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQVer_devROMNOT: TIBStringField
      FieldName = 'ROMNOT'
      Origin = '"DEVOLUCAO"."ROMNOT"'
      Size = 6
    end
    object IBQVer_devCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"DEVOLUCAO"."CODVEN"'
      Size = 3
    end
    object IBQVer_devDATBAS: TDateField
      FieldName = 'DATBAS'
      Origin = '"DEVOLUCAO"."DATBAS"'
    end
    object IBQVer_devCLIENOT: TIBStringField
      FieldName = 'CLIENOT'
      Origin = '"DEVOLUCAO"."CLIENOT"'
      Size = 40
    end
  end
  object IBQExc_ven: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from VENDEDOR')
    Left = 492
    Top = 72
    object IBQExc_venCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"VENDEDOR"."CODVEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQExc_venNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"VENDEDOR"."NOME"'
      Size = 35
    end
    object IBQExc_venNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"VENDEDOR"."NCPF"'
      Size = 15
    end
    object IBQExc_venNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"VENDEDOR"."NIFP"'
      Size = 15
    end
    object IBQExc_venENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"VENDEDOR"."ENDE"'
      Size = 40
    end
    object IBQExc_venBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"VENDEDOR"."BAIR"'
    end
    object IBQExc_venCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"VENDEDOR"."CIDA"'
    end
    object IBQExc_venESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"VENDEDOR"."ESTA"'
      Size = 2
    end
    object IBQExc_venNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"VENDEDOR"."NCEP"'
      Size = 9
    end
    object IBQExc_venNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"VENDEDOR"."NTEL"'
      Size = 30
    end
    object IBQExc_venPRACA1: TIBStringField
      FieldName = 'PRACA1'
      Origin = '"VENDEDOR"."PRACA1"'
      Size = 3
    end
    object IBQExc_venPRACA2: TIBStringField
      FieldName = 'PRACA2'
      Origin = '"VENDEDOR"."PRACA2"'
      Size = 3
    end
    object IBQExc_venPRACA3: TIBStringField
      FieldName = 'PRACA3'
      Origin = '"VENDEDOR"."PRACA3"'
      Size = 3
    end
    object IBQExc_venPRACA4: TIBStringField
      FieldName = 'PRACA4'
      Origin = '"VENDEDOR"."PRACA4"'
      Size = 3
    end
    object IBQExc_venEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"VENDEDOR"."EMAIL"'
      Size = 30
    end
    object IBQExc_venDATSOL: TIBStringField
      FieldName = 'DATSOL'
      Origin = '"VENDEDOR"."DATSOL"'
      Size = 10
    end
    object IBQExc_venNUMSOL: TIBStringField
      FieldName = 'NUMSOL'
      Origin = '"VENDEDOR"."NUMSOL"'
      Size = 6
    end
  end
  object IBQExc_art: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ARTIGO')
    Left = 492
    Top = 128
  end
  object IBDtsVendedor: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from VENDEDOR'
      'where'
      '  CODVEN = :OLD_CODVEN')
    InsertSQL.Strings = (
      'insert into VENDEDOR'
      
        '  (CODVEN, NOME, NCPF, NIFP, ENDE, BAIR, CIDA, ESTA, NCEP, NTEL,' +
        ' PRACA1, '
      '   PRACA2, PRACA3, PRACA4, EMAIL, DATSOL, NUMSOL)'
      'values'
      
        '  (:CODVEN, :NOME, :NCPF, :NIFP, :ENDE, :BAIR, :CIDA, :ESTA, :NC' +
        'EP, :NTEL, '
      '   :PRACA1, :PRACA2, :PRACA3, :PRACA4, :EMAIL, :DATSOL, :NUMSOL)')
    SelectSQL.Strings = (
      'select * from VENDEDOR')
    ModifySQL.Strings = (
      'update VENDEDOR'
      'set'
      '  CODVEN = :CODVEN,'
      '  NOME = :NOME,'
      '  NCPF = :NCPF,'
      '  NIFP = :NIFP,'
      '  ENDE = :ENDE,'
      '  BAIR = :BAIR,'
      '  CIDA = :CIDA,'
      '  ESTA = :ESTA,'
      '  NCEP = :NCEP,'
      '  NTEL = :NTEL,'
      '  PRACA1 = :PRACA1,'
      '  PRACA2 = :PRACA2,'
      '  PRACA3 = :PRACA3,'
      '  PRACA4 = :PRACA4,'
      '  EMAIL = :EMAIL,'
      '  DATSOL = :DATSOL,'
      '  NUMSOL = :NUMSOL'
      'where'
      '  CODVEN = :OLD_CODVEN')
    ParamCheck = True
    UniDirectional = False
    Left = 96
    Top = 72
    object IBDtsVendedorCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"VENDEDOR"."CODVEN"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBDtsVendedorNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"VENDEDOR"."NOME"'
      Size = 35
    end
    object IBDtsVendedorNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"VENDEDOR"."NCPF"'
      Size = 15
    end
    object IBDtsVendedorNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"VENDEDOR"."NIFP"'
      Size = 15
    end
    object IBDtsVendedorENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"VENDEDOR"."ENDE"'
      Size = 40
    end
    object IBDtsVendedorBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"VENDEDOR"."BAIR"'
    end
    object IBDtsVendedorCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"VENDEDOR"."CIDA"'
    end
    object IBDtsVendedorESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"VENDEDOR"."ESTA"'
      Size = 2
    end
    object IBDtsVendedorNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"VENDEDOR"."NCEP"'
      Size = 9
    end
    object IBDtsVendedorNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"VENDEDOR"."NTEL"'
      Size = 30
    end
    object IBDtsVendedorPRACA1: TIBStringField
      FieldName = 'PRACA1'
      Origin = '"VENDEDOR"."PRACA1"'
      Size = 3
    end
    object IBDtsVendedorPRACA2: TIBStringField
      FieldName = 'PRACA2'
      Origin = '"VENDEDOR"."PRACA2"'
      Size = 3
    end
    object IBDtsVendedorPRACA3: TIBStringField
      FieldName = 'PRACA3'
      Origin = '"VENDEDOR"."PRACA3"'
      Size = 3
    end
    object IBDtsVendedorPRACA4: TIBStringField
      FieldName = 'PRACA4'
      Origin = '"VENDEDOR"."PRACA4"'
      Size = 3
    end
    object IBDtsVendedorEMAIL: TIBStringField
      FieldName = 'EMAIL'
      Origin = '"VENDEDOR"."EMAIL"'
      Size = 30
    end
    object IBDtsVendedorDATSOL: TIBStringField
      FieldName = 'DATSOL'
      Origin = '"VENDEDOR"."DATSOL"'
      Size = 10
    end
    object IBDtsVendedorNUMSOL: TIBStringField
      FieldName = 'NUMSOL'
      Origin = '"VENDEDOR"."NUMSOL"'
      Size = 6
    end
  end
  object IBDtsArtigo: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ARTIGO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into ARTIGO'
      
        '  (CODIGO, CUSTO, DESCRICAO, ESTOQ, GRUPO, PRECOM, TABEL, UDATA,' +
        ' VENDA)'
      'values'
      
        '  (:CODIGO, :CUSTO, :DESCRICAO, :ESTOQ, :GRUPO, :PRECOM, :TABEL,' +
        ' :UDATA, '
      '   :VENDA)')
    SelectSQL.Strings = (
      'select * from ARTIGO')
    ModifySQL.Strings = (
      'update ARTIGO'
      'set'
      '  CODIGO = :CODIGO,'
      '  CUSTO = :CUSTO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ESTOQ = :ESTOQ,'
      '  GRUPO = :GRUPO,'
      '  PRECOM = :PRECOM,'
      '  TABEL = :TABEL,'
      '  UDATA = :UDATA,'
      '  VENDA = :VENDA'
      'where'
      '  CODIGO = :OLD_CODIGO')
    ParamCheck = True
    UniDirectional = False
    Left = 96
    Top = 128
    object IBDtsArtigoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ARTIGO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBDtsArtigoGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"ARTIGO"."GRUPO"'
      Size = 2
    end
    object IBDtsArtigoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ARTIGO"."DESCRICAO"'
      Size = 40
    end
    object IBDtsArtigoCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ARTIGO"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsArtigoVENDA: TIBBCDField
      FieldName = 'VENDA'
      Origin = '"ARTIGO"."VENDA"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsArtigoESTOQ: TIBBCDField
      FieldName = 'ESTOQ'
      Origin = '"ARTIGO"."ESTOQ"'
      DisplayFormat = '###0.0'
      Precision = 9
      Size = 2
    end
    object IBDtsArtigoUDATA: TIBStringField
      FieldName = 'UDATA'
      Origin = '"ARTIGO"."UDATA"'
      Size = 10
    end
    object IBDtsArtigoTABEL: TIBStringField
      FieldName = 'TABEL'
      Origin = '"ARTIGO"."TABEL"'
      Size = 1
    end
    object IBDtsArtigoPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Origin = '"ARTIGO"."PRECOM"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsCompra: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from COMPRA'
      'where'
      '  DATPED = :OLD_DATPED and'
      '  NUMPED = :OLD_NUMPED and'
      '  TIPPED = :OLD_TIPPED')
    InsertSQL.Strings = (
      'insert into COMPRA'
      
        '  (DATNOT, DATPED, DESCON, ENTREG, FORNEC, FRETE, NUMNOT, NUMPED' +
        ', OBSERV, '
      '   PARCEL, SITPED, TIPNOT, TIPPED, TOTPED, VALNOT)'
      'values'
      
        '  (:DATNOT, :DATPED, :DESCON, :ENTREG, :FORNEC, :FRETE, :NUMNOT,' +
        ' :NUMPED, '
      
        '   :OBSERV, :PARCEL, :SITPED, :TIPNOT, :TIPPED, :TOTPED, :VALNOT' +
        ')')
    SelectSQL.Strings = (
      'select * from COMPRA')
    ModifySQL.Strings = (
      'update COMPRA'
      'set'
      '  DATNOT = :DATNOT,'
      '  DATPED = :DATPED,'
      '  DESCON = :DESCON,'
      '  ENTREG = :ENTREG,'
      '  FORNEC = :FORNEC,'
      '  FRETE = :FRETE,'
      '  NUMNOT = :NUMNOT,'
      '  NUMPED = :NUMPED,'
      '  OBSERV = :OBSERV,'
      '  PARCEL = :PARCEL,'
      '  SITPED = :SITPED,'
      '  TIPNOT = :TIPNOT,'
      '  TIPPED = :TIPPED,'
      '  TOTPED = :TOTPED,'
      '  VALNOT = :VALNOT'
      'where'
      '  DATPED = :OLD_DATPED and'
      '  NUMPED = :OLD_NUMPED and'
      '  TIPPED = :OLD_TIPPED')
    ParamCheck = True
    UniDirectional = False
    Left = 85
    Top = 184
    object IBDtsCompraDATPED: TDateField
      FieldName = 'DATPED'
      Origin = '"COMPRA"."DATPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDtsCompraTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"COMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBDtsCompraNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"COMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBDtsCompraFORNEC: TIBStringField
      FieldName = 'FORNEC'
      Origin = '"COMPRA"."FORNEC"'
      Size = 15
    end
    object IBDtsCompraENTREG: TDateField
      FieldName = 'ENTREG'
      Origin = '"COMPRA"."ENTREG"'
    end
    object IBDtsCompraTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"COMPRA"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsCompraDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"COMPRA"."DATNOT"'
    end
    object IBDtsCompraTIPNOT: TIBStringField
      FieldName = 'TIPNOT'
      Origin = '"COMPRA"."TIPNOT"'
      Size = 3
    end
    object IBDtsCompraNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"COMPRA"."NUMNOT"'
      Size = 8
    end
    object IBDtsCompraDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"COMPRA"."DESCON"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsCompraFRETE: TIBBCDField
      FieldName = 'FRETE'
      Origin = '"COMPRA"."FRETE"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsCompraVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"COMPRA"."VALNOT"'
      DisplayFormat = '##,##0-.00'
      Precision = 18
      Size = 2
    end
    object IBDtsCompraSITPED: TIBStringField
      FieldName = 'SITPED'
      Origin = '"COMPRA"."SITPED"'
      Size = 1
    end
    object IBDtsCompraPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"COMPRA"."PARCEL"'
      Size = 2
    end
    object IBDtsCompraOBSERV: TBlobField
      FieldName = 'OBSERV'
      Origin = '"COMPRA"."OBSERV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBDstDevolucao: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from DEVOLUCAO'
      'where'
      '  NUMNOT = :OLD_NUMNOT')
    InsertSQL.Strings = (
      'insert into DEVOLUCAO'
      '  (CLIENOT, CODVEN, DATBAS, DATNOT, NUMNOT, ROMNOT, VALNOT)'
      'values'
      
        '  (:CLIENOT, :CODVEN, :DATBAS, :DATNOT, :NUMNOT, :ROMNOT, :VALNO' +
        'T)')
    SelectSQL.Strings = (
      'select * from DEVOLUCAO')
    ModifySQL.Strings = (
      'update DEVOLUCAO'
      'set'
      '  CLIENOT = :CLIENOT,'
      '  CODVEN = :CODVEN,'
      '  DATBAS = :DATBAS,'
      '  DATNOT = :DATNOT,'
      '  NUMNOT = :NUMNOT,'
      '  ROMNOT = :ROMNOT,'
      '  VALNOT = :VALNOT'
      'where'
      '  NUMNOT = :OLD_NUMNOT')
    ParamCheck = True
    UniDirectional = False
    Left = 98
    Top = 240
    object IBDstDevolucaoNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"DEVOLUCAO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBDstDevolucaoDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"DEVOLUCAO"."DATNOT"'
    end
    object IBDstDevolucaoVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"DEVOLUCAO"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDstDevolucaoROMNOT: TIBStringField
      FieldName = 'ROMNOT'
      Origin = '"DEVOLUCAO"."ROMNOT"'
      Size = 6
    end
    object IBDstDevolucaoCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"DEVOLUCAO"."CODVEN"'
      Size = 3
    end
    object IBDstDevolucaoDATBAS: TDateField
      FieldName = 'DATBAS'
      Origin = '"DEVOLUCAO"."DATBAS"'
    end
    object IBDstDevolucaoCLIENOT: TIBStringField
      FieldName = 'CLIENOT'
      Origin = '"DEVOLUCAO"."CLIENOT"'
      Size = 40
    end
  end
  object DsCliente: TDataSource
    DataSet = IBDtsCliente
    Left = 166
    Top = 16
  end
  object DsPesq_cli: TDataSource
    DataSet = IBQPesq_cli
    Left = 302
    Top = 16
  end
  object DsVendedor: TDataSource
    DataSet = IBDtsVendedor
    Left = 168
    Top = 72
  end
  object DsCompra: TDataSource
    DataSet = IBDtsCompra
    Left = 143
    Top = 184
  end
  object DsDevolucao: TDataSource
    DataSet = IBDstDevolucao
    Left = 169
    Top = 240
  end
  object DsDefeito: TDataSource
    DataSet = IBDtsDefeito
    Left = 152
    Top = 352
  end
  object DsArtigo: TDataSource
    DataSet = IBDtsArtigo
    Left = 166
    Top = 128
  end
  object DsPedido: TDataSource
    DataSet = IBDtsPedido
    Left = 143
    Top = 296
  end
  object DsSolicitacao: TDataSource
    DataSet = IBDtsSolicitacao
    Left = 170
    Top = 408
  end
  object DsPesq_ven: TDataSource
    DataSet = IBQPesq_ven
    Left = 304
    Top = 72
  end
  object IBDtsCliente: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CLIENTE'
      'where'
      '  IDCLI = :OLD_IDCLI')
    InsertSQL.Strings = (
      'insert into CLIENTE'
      
        '  (ATIVO, BAIR, CIDA, CONTA, DATIMP, DATNASC, ENDE, ESPED, ESTA,' +
        ' HORAFIN, '
      
        '   HORAIN, IDCLI, LCRED, NATU, NCEP, NCPF, NIFP, NOME, NOMMAE, N' +
        'OMPAI, '
      '   NTEL, OBSV, OLDCLI, PRACA, REFER, ROTA, SITU, VEND, VISITA)'
      'values'
      
        '  (:ATIVO, :BAIR, :CIDA, :CONTA, :DATIMP, :DATNASC, :ENDE, :ESPE' +
        'D, :ESTA, '
      
        '   :HORAFIN, :HORAIN, :IDCLI, :LCRED, :NATU, :NCEP, :NCPF, :NIFP' +
        ', :NOME, '
      
        '   :NOMMAE, :NOMPAI, :NTEL, :OBSV, :OLDCLI, :PRACA, :REFER, :ROT' +
        'A, :SITU, '
      '   :VEND, :VISITA)')
    SelectSQL.Strings = (
      'select *  from CLIENTE')
    ModifySQL.Strings = (
      'update CLIENTE'
      'set'
      '  ATIVO = :ATIVO,'
      '  BAIR = :BAIR,'
      '  CIDA = :CIDA,'
      '  CONTA = :CONTA,'
      '  DATIMP = :DATIMP,'
      '  DATNASC = :DATNASC,'
      '  ENDE = :ENDE,'
      '  ESPED = :ESPED,'
      '  ESTA = :ESTA,'
      '  HORAFIN = :HORAFIN,'
      '  HORAIN = :HORAIN,'
      '  IDCLI = :IDCLI,'
      '  LCRED = :LCRED,'
      '  NATU = :NATU,'
      '  NCEP = :NCEP,'
      '  NCPF = :NCPF,'
      '  NIFP = :NIFP,'
      '  NOME = :NOME,'
      '  NOMMAE = :NOMMAE,'
      '  NOMPAI = :NOMPAI,'
      '  NTEL = :NTEL,'
      '  OBSV = :OBSV,'
      '  OLDCLI = :OLDCLI,'
      '  PRACA = :PRACA,'
      '  REFER = :REFER,'
      '  ROTA = :ROTA,'
      '  SITU = :SITU,'
      '  VEND = :VEND,'
      '  VISITA = :VISITA'
      'where'
      '  IDCLI = :OLD_IDCLI')
    ParamCheck = True
    UniDirectional = False
    Left = 96
    Top = 16
    object IBDtsClienteIDCLI: TIntegerField
      FieldName = 'IDCLI'
      Origin = '"CLIENTE"."IDCLI"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDtsClienteNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"CLIENTE"."NCPF"'
      Size = 15
    end
    object IBDtsClienteNIFP: TIBStringField
      FieldName = 'NIFP'
      Origin = '"CLIENTE"."NIFP"'
      Size = 15
    end
    object IBDtsClienteBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"CLIENTE"."BAIR"'
    end
    object IBDtsClienteCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"CLIENTE"."CIDA"'
    end
    object IBDtsClienteESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"CLIENTE"."ESTA"'
      Size = 2
    end
    object IBDtsClienteNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"CLIENTE"."NCEP"'
      Size = 9
    end
    object IBDtsClienteNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"CLIENTE"."NTEL"'
      Size = 30
    end
    object IBDtsClienteCONTA: TIBStringField
      FieldName = 'CONTA'
      Origin = '"CLIENTE"."CONTA"'
      Size = 30
    end
    object IBDtsClienteVEND: TIBStringField
      FieldName = 'VEND'
      Origin = '"CLIENTE"."VEND"'
      Size = 3
    end
    object IBDtsClienteLCRED: TIBBCDField
      FieldName = 'LCRED'
      Origin = '"CLIENTE"."LCRED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsClienteDATIMP: TIBStringField
      FieldName = 'DATIMP'
      Origin = '"CLIENTE"."DATIMP"'
      Size = 10
    end
    object IBDtsClienteNOMMAE: TIBStringField
      FieldName = 'NOMMAE'
      Origin = '"CLIENTE"."NOMMAE"'
      Size = 35
    end
    object IBDtsClienteNOMPAI: TIBStringField
      FieldName = 'NOMPAI'
      Origin = '"CLIENTE"."NOMPAI"'
      Size = 35
    end
    object IBDtsClienteDATNASC: TIBStringField
      FieldName = 'DATNASC'
      Origin = '"CLIENTE"."DATNASC"'
      Size = 10
    end
    object IBDtsClienteNATU: TIBStringField
      FieldName = 'NATU'
      Origin = '"CLIENTE"."NATU"'
      Size = 2
    end
    object IBDtsClienteROTA: TIBStringField
      FieldName = 'ROTA'
      Origin = '"CLIENTE"."ROTA"'
      Size = 3
    end
    object IBDtsClientePRACA: TIBStringField
      FieldName = 'PRACA'
      Origin = '"CLIENTE"."PRACA"'
      Size = 3
    end
    object IBDtsClienteREFER: TIBStringField
      FieldName = 'REFER'
      Origin = '"CLIENTE"."REFER"'
      Size = 40
    end
    object IBDtsClienteOLDCLI: TIBStringField
      FieldName = 'OLDCLI'
      Origin = '"CLIENTE"."OLDCLI"'
      Size = 4
    end
    object IBDtsClienteSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"CLIENTE"."SITU"'
      Size = 1
    end
    object IBDtsClienteNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"CLIENTE"."NOME"'
      Size = 50
    end
    object IBDtsClienteENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"CLIENTE"."ENDE"'
      Size = 60
    end
    object IBDtsClienteHORAIN: TIBStringField
      FieldName = 'HORAIN'
      Origin = '"CLIENTE"."HORAIN"'
      Size = 5
    end
    object IBDtsClienteHORAFIN: TIBStringField
      FieldName = 'HORAFIN'
      Origin = '"CLIENTE"."HORAFIN"'
      Size = 5
    end
    object IBDtsClienteVISITA: TIBStringField
      FieldName = 'VISITA'
      Origin = '"CLIENTE"."VISITA"'
      Size = 12
    end
    object IBDtsClienteATIVO: TIBStringField
      FieldName = 'ATIVO'
      Origin = '"CLIENTE"."ATIVO"'
      Size = 1
    end
    object IBDtsClienteESPED: TIBStringField
      FieldName = 'ESPED'
      Origin = '"CLIENTE"."ESPED"'
      Size = 6
    end
    object IBDtsClienteOBSV: TBlobField
      FieldName = 'OBSV'
      Origin = '"CLIENTE"."OBSV"'
      ProviderFlags = [pfInUpdate]
      Size = 8
    end
  end
  object IBDtsPedido: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PEDIDO'
      'where'
      '  IDPED = :OLD_IDPED')
    InsertSQL.Strings = (
      'insert into PEDIDO'
      
        '  (BASE, COB, COBRAN, CODCLI, CODVEN, DATPAG, DATPED, IDPED, LIM' +
        'ITE, NOMCLI, '
      
        '   OLDPED, PEDIDO, RECOL, RESIDUO, RETORNO, SITU, SOLICIT, TOTPE' +
        'D, TOTVEN, '
      '   VALPAG, VIA)'
      'values'
      
        '  (:BASE, :COB, :COBRAN, :CODCLI, :CODVEN, :DATPAG, :DATPED, :ID' +
        'PED, :LIMITE, '
      
        '   :NOMCLI, :OLDPED, :PEDIDO, :RECOL, :RESIDUO, :RETORNO, :SITU,' +
        ' :SOLICIT, '
      '   :TOTPED, :TOTVEN, :VALPAG, :VIA)')
    SelectSQL.Strings = (
      'select * from PEDIDO')
    ModifySQL.Strings = (
      'update PEDIDO'
      'set'
      '  BASE = :BASE,'
      '  COB = :COB,'
      '  COBRAN = :COBRAN,'
      '  CODCLI = :CODCLI,'
      '  CODVEN = :CODVEN,'
      '  DATPAG = :DATPAG,'
      '  DATPED = :DATPED,'
      '  IDPED = :IDPED,'
      '  LIMITE = :LIMITE,'
      '  NOMCLI = :NOMCLI,'
      '  OLDPED = :OLDPED,'
      '  PEDIDO = :PEDIDO,'
      '  RECOL = :RECOL,'
      '  RESIDUO = :RESIDUO,'
      '  RETORNO = :RETORNO,'
      '  SITU = :SITU,'
      '  SOLICIT = :SOLICIT,'
      '  TOTPED = :TOTPED,'
      '  TOTVEN = :TOTVEN,'
      '  VALPAG = :VALPAG,'
      '  VIA = :VIA'
      'where'
      '  IDPED = :OLD_IDPED')
    ParamCheck = True
    UniDirectional = False
    Left = 84
    Top = 296
    object IBDtsPedidoIDPED: TIntegerField
      FieldName = 'IDPED'
      Origin = '"PEDIDO"."IDPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDtsPedidoPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"PEDIDO"."PEDIDO"'
      Size = 6
    end
    object IBDtsPedidoCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"PEDIDO"."CODVEN"'
      Size = 3
    end
    object IBDtsPedidoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"PEDIDO"."CODCLI"'
      Size = 4
    end
    object IBDtsPedidoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"PEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBDtsPedidoBASE: TDateField
      FieldName = 'BASE'
      Origin = '"PEDIDO"."BASE"'
    end
    object IBDtsPedidoRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"PEDIDO"."RECOL"'
    end
    object IBDtsPedidoCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"PEDIDO"."COBRAN"'
    end
    object IBDtsPedidoTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"PEDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPedidoSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"PEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBDtsPedidoDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"PEDIDO"."DATPED"'
      Size = 10
    end
    object IBDtsPedidoSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"PEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBDtsPedidoRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"PEDIDO"."RETORNO"'
      Size = 10
    end
    object IBDtsPedidoTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"PEDIDO"."TOTVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPedidoDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"PEDIDO"."DATPAG"'
      Size = 10
    end
    object IBDtsPedidoVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"PEDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPedidoRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"PEDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPedidoCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"PEDIDO"."COB"'
      Size = 1
    end
    object IBDtsPedidoLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"PEDIDO"."LIMITE"'
      Size = 10
    end
    object IBDtsPedidoVIA: TIBStringField
      FieldName = 'VIA'
      Origin = '"PEDIDO"."VIA"'
      Size = 1
    end
    object IBDtsPedidoOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Origin = '"PEDIDO"."OLDPED"'
      Size = 6
    end
  end
  object IBDtsDefeito: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from DEFEITO')
    ParamCheck = True
    UniDirectional = False
    Left = 88
    Top = 352
    object IBDtsDefeitoNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"DEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBDtsDefeitoDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"DEFEITO"."DATNOT"'
    end
    object IBDtsDefeitoVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"DEFEITO"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsSolicitacao: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from SOLICITACAO')
    ParamCheck = True
    UniDirectional = False
    Left = 97
    Top = 408
  end
  object IBQLer_dev: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from DEVOLUCAO')
    Left = 424
    Top = 240
  end
  object IBQVer_ped: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PEDIDO')
    Left = 341
    Top = 296
    object IBQVer_pedIDPED: TIntegerField
      FieldName = 'IDPED'
      Origin = '"PEDIDO"."IDPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQVer_pedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"PEDIDO"."PEDIDO"'
      Size = 6
    end
    object IBQVer_pedCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"PEDIDO"."CODVEN"'
      Size = 3
    end
    object IBQVer_pedCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"PEDIDO"."CODCLI"'
      Size = 4
    end
    object IBQVer_pedNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"PEDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQVer_pedBASE: TDateField
      FieldName = 'BASE'
      Origin = '"PEDIDO"."BASE"'
    end
    object IBQVer_pedRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"PEDIDO"."RECOL"'
    end
    object IBQVer_pedCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"PEDIDO"."COBRAN"'
    end
    object IBQVer_pedTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"PEDIDO"."TOTPED"'
      Precision = 18
      Size = 2
    end
    object IBQVer_pedSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"PEDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQVer_pedDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"PEDIDO"."DATPED"'
      Size = 10
    end
    object IBQVer_pedSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"PEDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQVer_pedRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"PEDIDO"."RETORNO"'
      Size = 10
    end
    object IBQVer_pedTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"PEDIDO"."TOTVEN"'
      Precision = 18
      Size = 2
    end
    object IBQVer_pedDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"PEDIDO"."DATPAG"'
      Size = 10
    end
    object IBQVer_pedVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"PEDIDO"."VALPAG"'
      Precision = 18
      Size = 2
    end
    object IBQVer_pedRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"PEDIDO"."RESIDUO"'
      Precision = 18
      Size = 2
    end
    object IBQVer_pedCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"PEDIDO"."COB"'
      Size = 1
    end
    object IBQVer_pedLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"PEDIDO"."LIMITE"'
      Size = 10
    end
    object IBQVer_pedVIA: TIBStringField
      FieldName = 'VIA'
      Origin = '"PEDIDO"."VIA"'
      Size = 1
    end
    object IBQVer_pedOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Origin = '"PEDIDO"."OLDPED"'
      Size = 6
    end
  end
  object IBQPesq_itdev: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMDEVOLUCAO')
    Left = 721
    Top = 240
    object IBQPesq_itdevNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEVOLUCAO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_itdevCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEVOLUCAO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesq_itdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEVOLUCAO"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_itdevQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEVOLUCAO"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBQPesq_itdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEVOLUCAO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQExc_ped: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PEDIDO')
    Left = 467
    Top = 296
  end
  object IBQVer_gru: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from GRUPO')
    Left = 862
    Top = 72
  end
  object IBQVer_itped: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMPEDIDO')
    Left = 863
    Top = 296
    object IBQVer_itpedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"ITEMPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_itpedCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMPEDIDO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQVer_itpedDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMPEDIDO"."DESCRICAO"'
      Size = 40
    end
    object IBQVer_itpedQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"ITEMPEDIDO"."QTDSAI"'
      DisplayFormat = '###0.0'
    end
    object IBQVer_itpedQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"ITEMPEDIDO"."QTDRET"'
      DisplayFormat = '###0.0'
    end
    object IBQVer_itpedPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMPEDIDO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQVer_itpedPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"ITEMPEDIDO"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQPesq_gru: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from GRUPO')
    Left = 741
    Top = 72
    object IBQPesq_gruCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"GRUPO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IBQPesq_gruDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPO"."DESCRICAO"'
      Size = 25
    end
  end
  object IBQPesq_und: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 745
    Top = 128
  end
  object IBQLer_und: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from UNIDADE')
    Left = 932
    Top = 128
  end
  object IBQVer_und: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from UNIDADE')
    Left = 872
    Top = 128
    object IBQVer_undCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"UNIDADE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_undDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"UNIDADE"."DESCRICAO"'
      Size = 25
    end
  end
  object IBQLer_itcomp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMCOMPRA')
    Left = 929
    Top = 184
    object IBQLer_itcompTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"ITEMCOMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQLer_itcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"ITEMCOMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQLer_itcompITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"ITEMCOMPRA"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQLer_itcompCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMCOMPRA"."CODART"'
      Size = 4
    end
    object IBQLer_itcompDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMCOMPRA"."DESCRICAO"'
      Size = 40
    end
    object IBQLer_itcompQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMCOMPRA"."QUANT"'
    end
    object IBQLer_itcompPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Origin = '"ITEMCOMPRA"."PRECOM"'
      Precision = 18
      Size = 2
    end
    object IBQLer_itcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"ITEMCOMPRA"."DESCON"'
      Precision = 9
      Size = 2
    end
    object IBQLer_itcompVALART: TIBBCDField
      FieldName = 'VALART'
      Origin = '"ITEMCOMPRA"."VALART"'
      Precision = 18
      Size = 2
    end
    object IBQLer_itcompTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Origin = '"ITEMCOMPRA"."TAMANHO"'
      Size = 2
    end
    object IBQLer_itcompCOR: TIBStringField
      FieldName = 'COR'
      Origin = '"ITEMCOMPRA"."COR"'
      Size = 15
    end
  end
  object IBTEtiqueta: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ETIQUETA'
    UniDirectional = False
    Left = 24
    Top = 464
    object IBTEtiquetaIDETIQ: TIntegerField
      FieldName = 'IDETIQ'
      Required = True
    end
    object IBTEtiquetaCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTEtiquetaNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
    end
    object IBTEtiquetaSOBNOM: TIBStringField
      FieldName = 'SOBNOM'
      Size = 15
    end
    object IBTEtiquetaBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
    end
    object IBTEtiquetaCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTEtiquetaNOMVEN: TIBStringField
      FieldName = 'NOMVEN'
      Size = 35
    end
  end
  object IBTLivro: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'LIVRO'
    UniDirectional = False
    Left = 24
    Top = 520
  end
  object IBTFornec: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'FORNECEDOR'
    UniDirectional = False
    Left = 24
    Top = 576
    object IBTFornecMARCA: TIBStringField
      FieldName = 'MARCA'
      Required = True
      Size = 15
    end
    object IBTFornecRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Size = 45
    end
    object IBTFornecPESSO: TIBStringField
      FieldName = 'PESSO'
      Size = 1
    end
    object IBTFornecNCPF: TIBStringField
      FieldName = 'NCPF'
    end
    object IBTFornecCNPJ: TIBStringField
      FieldName = 'CNPJ'
    end
    object IBTFornecINSC: TIBStringField
      FieldName = 'INSC'
    end
    object IBTFornecENDE: TIBStringField
      FieldName = 'ENDE'
      Size = 40
    end
    object IBTFornecBAIR: TIBStringField
      FieldName = 'BAIR'
    end
    object IBTFornecCIDA: TIBStringField
      FieldName = 'CIDA'
    end
    object IBTFornecESTA: TIBStringField
      FieldName = 'ESTA'
      Size = 2
    end
    object IBTFornecNCEP: TIBStringField
      FieldName = 'NCEP'
      Size = 9
    end
    object IBTFornecNTEL: TIBStringField
      FieldName = 'NTEL'
      Size = 30
    end
    object IBTFornecRESP: TIBStringField
      FieldName = 'RESP'
      Size = 30
    end
    object IBTFornecRTEL: TIBStringField
      FieldName = 'RTEL'
    end
    object IBTFornecSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
  end
  object IBTPerdido: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'PERDIDO'
    UniDirectional = False
    Left = 24
    Top = 632
    object IBTPerdidoPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTPerdidoCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Size = 3
    end
    object IBTPerdidoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Size = 4
    end
    object IBTPerdidoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Size = 40
    end
    object IBTPerdidoBASE: TDateField
      FieldName = 'BASE'
    end
    object IBTPerdidoRECOL: TDateField
      FieldName = 'RECOL'
    end
    object IBTPerdidoCOBRAN: TDateField
      FieldName = 'COBRAN'
    end
    object IBTPerdidoTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Precision = 18
      Size = 2
    end
    object IBTPerdidoSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTPerdidoDATPED: TIBStringField
      FieldName = 'DATPED'
      Size = 10
    end
    object IBTPerdidoSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Size = 6
    end
    object IBTPerdidoRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Size = 10
    end
    object IBTPerdidoTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Precision = 18
      Size = 2
    end
    object IBTPerdidoDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTPerdidoVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Precision = 18
      Size = 2
    end
    object IBTPerdidoRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Precision = 18
      Size = 2
    end
    object IBTPerdidoCOB: TIBStringField
      FieldName = 'COB'
      Size = 1
    end
    object IBTPerdidoLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Size = 10
    end
    object IBTPerdidoVIA: TIBStringField
      FieldName = 'VIA'
      Size = 1
    end
    object IBTPerdidoOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Size = 6
    end
  end
  object IBQVer_solicit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from SOLICITACAO')
    Left = 384
    Top = 408
    object IBQVer_solicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"SOLICITACAO"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_solicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"SOLICITACAO"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_solicitCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"SOLICITACAO"."CLIENTE"'
      Size = 4
    end
    object IBQVer_solicitNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"SOLICITACAO"."NOMCLI"'
      Size = 40
    end
    object IBQVer_solicitDATSOL: TDateField
      FieldName = 'DATSOL'
      Origin = '"SOLICITACAO"."DATSOL"'
    end
    object IBQVer_solicitSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"SOLICITACAO"."SITU"'
      Size = 1
    end
  end
  object IBQLer_itper: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMPERDIDO')
    Left = 942
    Top = 632
  end
  object IBQPesq_rot: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ROTA')
    Left = 737
    Top = 16
  end
  object IBQVer_rot: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ROTA')
    Left = 861
    Top = 16
    object IBQVer_rotROTA: TIBStringField
      FieldName = 'ROTA'
      Origin = '"ROTA"."ROTA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_rotBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"ROTA"."BAIR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_rotNOME: TIBStringField
      FieldName = 'NOME'
      Origin = '"ROTA"."NOME"'
      Size = 25
    end
  end
  object IBQLer_rot: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ROTA')
    Left = 922
    Top = 16
  end
  object IBQLer_gru: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from GRUPO')
    Left = 925
    Top = 72
    object IBQLer_gruCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"GRUPO"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IBQLer_gruDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"GRUPO"."DESCRICAO"'
      Size = 25
    end
  end
  object IBQLer_def: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from DEFEITO')
    Left = 400
    Top = 352
    object IBQLer_defNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"DEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQLer_defDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"DEFEITO"."DATNOT"'
    end
    object IBQLer_defVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"DEFEITO"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_def: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from DEFEITO')
    Left = 341
    Top = 352
    object IBQVer_defNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"DEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_defDATNOT: TDateField
      FieldName = 'DATNOT'
      Origin = '"DEFEITO"."DATNOT"'
    end
    object IBQVer_defVALNOT: TIBBCDField
      FieldName = 'VALNOT'
      Origin = '"DEFEITO"."VALNOT"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQLer_ped: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PERDIDO')
    Left = 404
    Top = 296
  end
  object IBQLer_itdev: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMDEVOLUCAO')
    Left = 930
    Top = 240
    object IBQLer_itdevNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEVOLUCAO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQLer_itdevCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEVOLUCAO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQLer_itdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEVOLUCAO"."DESCRICAO"'
      Size = 40
    end
    object IBQLer_itdevQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEVOLUCAO"."QUANT"'
    end
    object IBQLer_itdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEVOLUCAO"."PRECUS"'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_itdev: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMDEVOLUCAO')
    Left = 862
    Top = 240
    object IBQVer_itdevNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEVOLUCAO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_itdevCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEVOLUCAO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQVer_itdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEVOLUCAO"."DESCRICAO"'
      Size = 40
    end
    object IBQVer_itdevQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEVOLUCAO"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBQVer_itdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEVOLUCAO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQPesq_itcomp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMCOMPRA')
    Left = 703
    Top = 184
    object IBQPesq_itcompTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"ITEMCOMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_itcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"ITEMCOMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQPesq_itcompITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"ITEMCOMPRA"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_itcompCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMCOMPRA"."CODART"'
      Size = 4
    end
    object IBQPesq_itcompDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMCOMPRA"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_itcompQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMCOMPRA"."QUANT"'
      DisplayFormat = '###0.00'
    end
    object IBQPesq_itcompPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Origin = '"ITEMCOMPRA"."PRECOM"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_itcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"ITEMCOMPRA"."DESCON"'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object IBQPesq_itcompVALART: TIBBCDField
      FieldName = 'VALART'
      Origin = '"ITEMCOMPRA"."VALART"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_itcompTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Origin = '"ITEMCOMPRA"."TAMANHO"'
      Size = 2
    end
    object IBQPesq_itcompCOR: TIBStringField
      FieldName = 'COR'
      Origin = '"ITEMCOMPRA"."COR"'
      Size = 15
    end
  end
  object IBQPesq_itped: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMPEDIDO')
    Left = 723
    Top = 296
    object IBQPesq_itpedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"ITEMPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_itpedCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMPEDIDO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesq_itpedDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMPEDIDO"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_itpedQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"ITEMPEDIDO"."QTDSAI"'
      DisplayFormat = '###0.0'
    end
    object IBQPesq_itpedQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"ITEMPEDIDO"."QTDRET"'
      DisplayFormat = '###0.0'
    end
    object IBQPesq_itpedPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMPEDIDO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_itpedPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"ITEMPEDIDO"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_itcomp: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMCOMPRA')
    Left = 856
    Top = 184
  end
  object IBDtsEtiqueta: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ETIQUETA'
      'where'
      '  IDETIQ = :OLD_IDETIQ')
    InsertSQL.Strings = (
      'insert into ETIQUETA'
      '  (BAIRRO, CODCLI, CODVEN, IDETIQ, NOMCLI, NOMVEN, SOBNOM)'
      'values'
      
        '  (:BAIRRO, :CODCLI, :CODVEN, :IDETIQ, :NOMCLI, :NOMVEN, :SOBNOM' +
        ')')
    SelectSQL.Strings = (
      'select * from ETIQUETA')
    ModifySQL.Strings = (
      'update ETIQUETA'
      'set'
      '  BAIRRO = :BAIRRO,'
      '  CODCLI = :CODCLI,'
      '  CODVEN = :CODVEN,'
      '  IDETIQ = :IDETIQ,'
      '  NOMCLI = :NOMCLI,'
      '  NOMVEN = :NOMVEN,'
      '  SOBNOM = :SOBNOM'
      'where'
      '  IDETIQ = :OLD_IDETIQ')
    ParamCheck = True
    UniDirectional = False
    Left = 88
    Top = 464
    object IBDtsEtiquetaIDETIQ: TIntegerField
      FieldName = 'IDETIQ'
      Origin = '"ETIQUETA"."IDETIQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDtsEtiquetaCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"ETIQUETA"."CODCLI"'
      Size = 4
    end
    object IBDtsEtiquetaNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"ETIQUETA"."NOMCLI"'
    end
    object IBDtsEtiquetaSOBNOM: TIBStringField
      FieldName = 'SOBNOM'
      Origin = '"ETIQUETA"."SOBNOM"'
      Size = 15
    end
    object IBDtsEtiquetaBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"ETIQUETA"."BAIRRO"'
    end
    object IBDtsEtiquetaCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"ETIQUETA"."CODVEN"'
      Size = 3
    end
    object IBDtsEtiquetaNOMVEN: TIBStringField
      FieldName = 'NOMVEN'
      Origin = '"ETIQUETA"."NOMVEN"'
      Size = 35
    end
  end
  object IBDsLivro: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from LIVRO'
      'where'
      '  DATMOV = :OLD_DATMOV and'
      '  ITEM = :OLD_ITEM')
    InsertSQL.Strings = (
      'insert into LIVRO'
      
        '  (DATMOV, HISTOR, ITEM, NUMDOC, NUMPAG, OBSERV, ORIPAG, PARCEL,' +
        ' SINAL, '
      '   TIPDOC, TIPPAG, VALPAG)'
      'values'
      
        '  (:DATMOV, :HISTOR, :ITEM, :NUMDOC, :NUMPAG, :OBSERV, :ORIPAG, ' +
        ':PARCEL, '
      '   :SINAL, :TIPDOC, :TIPPAG, :VALPAG)')
    SelectSQL.Strings = (
      'select * from LIVRO')
    ModifySQL.Strings = (
      'update LIVRO'
      'set'
      '  DATMOV = :DATMOV,'
      '  HISTOR = :HISTOR,'
      '  ITEM = :ITEM,'
      '  NUMDOC = :NUMDOC,'
      '  NUMPAG = :NUMPAG,'
      '  OBSERV = :OBSERV,'
      '  ORIPAG = :ORIPAG,'
      '  PARCEL = :PARCEL,'
      '  SINAL = :SINAL,'
      '  TIPDOC = :TIPDOC,'
      '  TIPPAG = :TIPPAG,'
      '  VALPAG = :VALPAG'
      'where'
      '  DATMOV = :OLD_DATMOV and'
      '  ITEM = :OLD_ITEM')
    ParamCheck = True
    UniDirectional = False
    Left = 71
    Top = 520
  end
  object IBDtsFornec: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from FORNECEDOR'
      'where'
      '  MARCA = :OLD_MARCA')
    InsertSQL.Strings = (
      'insert into FORNECEDOR'
      
        '  (BAIR, CIDA, CNPJ, ENDE, ESTA, INSC, MARCA, NCEP, NCPF, NTEL, ' +
        'PESSO, '
      '   RAZAO, RESP, RTEL, SITU)'
      'values'
      
        '  (:BAIR, :CIDA, :CNPJ, :ENDE, :ESTA, :INSC, :MARCA, :NCEP, :NCP' +
        'F, :NTEL, '
      '   :PESSO, :RAZAO, :RESP, :RTEL, :SITU)')
    SelectSQL.Strings = (
      'select * from FORNECEDOR')
    ModifySQL.Strings = (
      'update FORNECEDOR'
      'set'
      '  BAIR = :BAIR,'
      '  CIDA = :CIDA,'
      '  CNPJ = :CNPJ,'
      '  ENDE = :ENDE,'
      '  ESTA = :ESTA,'
      '  INSC = :INSC,'
      '  MARCA = :MARCA,'
      '  NCEP = :NCEP,'
      '  NCPF = :NCPF,'
      '  NTEL = :NTEL,'
      '  PESSO = :PESSO,'
      '  RAZAO = :RAZAO,'
      '  RESP = :RESP,'
      '  RTEL = :RTEL,'
      '  SITU = :SITU'
      'where'
      '  MARCA = :OLD_MARCA')
    ParamCheck = True
    UniDirectional = False
    Left = 80
    Top = 576
    object IBDtsFornecMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"FORNECEDOR"."MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBDtsFornecRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"FORNECEDOR"."RAZAO"'
      Size = 45
    end
    object IBDtsFornecPESSO: TIBStringField
      FieldName = 'PESSO'
      Origin = '"FORNECEDOR"."PESSO"'
      Size = 1
    end
    object IBDtsFornecNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"FORNECEDOR"."NCPF"'
    end
    object IBDtsFornecCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"FORNECEDOR"."CNPJ"'
    end
    object IBDtsFornecINSC: TIBStringField
      FieldName = 'INSC'
      Origin = '"FORNECEDOR"."INSC"'
    end
    object IBDtsFornecENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"FORNECEDOR"."ENDE"'
      Size = 40
    end
    object IBDtsFornecBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"FORNECEDOR"."BAIR"'
    end
    object IBDtsFornecCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"FORNECEDOR"."CIDA"'
    end
    object IBDtsFornecESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"FORNECEDOR"."ESTA"'
      Size = 2
    end
    object IBDtsFornecNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"FORNECEDOR"."NCEP"'
      Size = 9
    end
    object IBDtsFornecNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"FORNECEDOR"."NTEL"'
      Size = 30
    end
    object IBDtsFornecRESP: TIBStringField
      FieldName = 'RESP'
      Origin = '"FORNECEDOR"."RESP"'
      Size = 30
    end
    object IBDtsFornecRTEL: TIBStringField
      FieldName = 'RTEL'
      Origin = '"FORNECEDOR"."RTEL"'
    end
    object IBDtsFornecSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"FORNECEDOR"."SITU"'
      Size = 1
    end
  end
  object IBDtsPerdido: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from PERDIDO'
      'where'
      '  PEDIDO = :OLD_PEDIDO')
    InsertSQL.Strings = (
      'insert into PERDIDO'
      
        '  (BASE, COB, COBRAN, CODCLI, CODVEN, DATPAG, DATPED, LIMITE, NO' +
        'MCLI, OLDPED, '
      
        '   PEDIDO, RECOL, RESIDUO, RETORNO, SITU, SOLICIT, TOTPED, TOTVE' +
        'N, VALPAG, '
      '   VIA)'
      'values'
      
        '  (:BASE, :COB, :COBRAN, :CODCLI, :CODVEN, :DATPAG, :DATPED, :LI' +
        'MITE, :NOMCLI, '
      
        '   :OLDPED, :PEDIDO, :RECOL, :RESIDUO, :RETORNO, :SITU, :SOLICIT' +
        ', :TOTPED, '
      '   :TOTVEN, :VALPAG, :VIA)')
    SelectSQL.Strings = (
      'select * from PERDIDO')
    ModifySQL.Strings = (
      'update PERDIDO'
      'set'
      '  BASE = :BASE,'
      '  COB = :COB,'
      '  COBRAN = :COBRAN,'
      '  CODCLI = :CODCLI,'
      '  CODVEN = :CODVEN,'
      '  DATPAG = :DATPAG,'
      '  DATPED = :DATPED,'
      '  LIMITE = :LIMITE,'
      '  NOMCLI = :NOMCLI,'
      '  OLDPED = :OLDPED,'
      '  PEDIDO = :PEDIDO,'
      '  RECOL = :RECOL,'
      '  RESIDUO = :RESIDUO,'
      '  RETORNO = :RETORNO,'
      '  SITU = :SITU,'
      '  SOLICIT = :SOLICIT,'
      '  TOTPED = :TOTPED,'
      '  TOTVEN = :TOTVEN,'
      '  VALPAG = :VALPAG,'
      '  VIA = :VIA'
      'where'
      '  PEDIDO = :OLD_PEDIDO')
    ParamCheck = True
    UniDirectional = False
    Left = 88
    Top = 632
    object IBDtsPerdidoPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"PERDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBDtsPerdidoCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"PERDIDO"."CODVEN"'
      Size = 3
    end
    object IBDtsPerdidoCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"PERDIDO"."CODCLI"'
      Size = 4
    end
    object IBDtsPerdidoNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"PERDIDO"."NOMCLI"'
      Size = 40
    end
    object IBDtsPerdidoBASE: TDateField
      FieldName = 'BASE'
      Origin = '"PERDIDO"."BASE"'
    end
    object IBDtsPerdidoRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"PERDIDO"."RECOL"'
    end
    object IBDtsPerdidoCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"PERDIDO"."COBRAN"'
    end
    object IBDtsPerdidoTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"PERDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPerdidoSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"PERDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBDtsPerdidoDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"PERDIDO"."DATPED"'
      Size = 10
    end
    object IBDtsPerdidoSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"PERDIDO"."SOLICIT"'
      Size = 6
    end
    object IBDtsPerdidoRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"PERDIDO"."RETORNO"'
      Size = 10
    end
    object IBDtsPerdidoTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"PERDIDO"."TOTVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPerdidoDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"PERDIDO"."DATPAG"'
      Size = 10
    end
    object IBDtsPerdidoVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"PERDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPerdidoRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"PERDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsPerdidoCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"PERDIDO"."COB"'
      Size = 1
    end
    object IBDtsPerdidoLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"PERDIDO"."LIMITE"'
      Size = 10
    end
    object IBDtsPerdidoVIA: TIBStringField
      FieldName = 'VIA'
      Origin = '"PERDIDO"."VIA"'
      Size = 1
    end
    object IBDtsPerdidoOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Origin = '"PERDIDO"."OLDPED"'
      Size = 6
    end
  end
  object IBDtsItemdev: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ITEMDEVOLUCAO'
      'where'
      '  CODART = :OLD_CODART and'
      '  NUMNOT = :OLD_NUMNOT')
    InsertSQL.Strings = (
      'insert into ITEMDEVOLUCAO'
      '  (CODART, DESCRICAO, NUMNOT, PRECUS, QUANT)'
      'values'
      '  (:CODART, :DESCRICAO, :NUMNOT, :PRECUS, :QUANT)')
    SelectSQL.Strings = (
      'select * from ITEMDEVOLUCAO')
    ModifySQL.Strings = (
      'update ITEMDEVOLUCAO'
      'set'
      '  CODART = :CODART,'
      '  DESCRICAO = :DESCRICAO,'
      '  NUMNOT = :NUMNOT,'
      '  PRECUS = :PRECUS,'
      '  QUANT = :QUANT'
      'where'
      '  CODART = :OLD_CODART and'
      '  NUMNOT = :OLD_NUMNOT')
    ParamCheck = True
    UniDirectional = False
    Left = 589
    Top = 240
    object IBDtsItemdevNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEVOLUCAO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBDtsItemdevCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEVOLUCAO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBDtsItemdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEVOLUCAO"."DESCRICAO"'
      Size = 40
    end
    object IBDtsItemdevQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEVOLUCAO"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBDtsItemdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEVOLUCAO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsItemdef: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ITEMDEFEITO'
      'where'
      '  CODART = :OLD_CODART and'
      '  NUMNOT = :OLD_NUMNOT')
    InsertSQL.Strings = (
      'insert into ITEMDEFEITO'
      '  (CODART, DESCRICAO, NUMNOT, PRECUS, QUANT)'
      'values'
      '  (:CODART, :DESCRICAO, :NUMNOT, :PRECUS, :QUANT)')
    SelectSQL.Strings = (
      'select * from ITEMDEFEITO')
    ModifySQL.Strings = (
      'update ITEMDEFEITO'
      'set'
      '  CODART = :CODART,'
      '  DESCRICAO = :DESCRICAO,'
      '  NUMNOT = :NUMNOT,'
      '  PRECUS = :PRECUS,'
      '  QUANT = :QUANT'
      'where'
      '  CODART = :OLD_CODART and'
      '  NUMNOT = :OLD_NUMNOT')
    ParamCheck = True
    UniDirectional = False
    Left = 593
    Top = 352
    object IBDtsItemdefNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBDtsItemdefCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEFEITO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBDtsItemdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEFEITO"."DESCRICAO"'
      Size = 40
    end
    object IBDtsItemdefQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEFEITO"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBDtsItemdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEFEITO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsEstoque: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ESTOQUE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into ESTOQUE'
      '  (CODIGO, CUSTO, DATB1, DATB2, DESCRICAO, ESTOQ)'
      'values'
      '  (:CODIGO, :CUSTO, :DATB1, :DATB2, :DESCRICAO, :ESTOQ)')
    SelectSQL.Strings = (
      'select * from ESTOQUE')
    ModifySQL.Strings = (
      'update ESTOQUE'
      'set'
      '  CODIGO = :CODIGO,'
      '  CUSTO = :CUSTO,'
      '  DATB1 = :DATB1,'
      '  DATB2 = :DATB2,'
      '  DESCRICAO = :DESCRICAO,'
      '  ESTOQ = :ESTOQ'
      'where'
      '  CODIGO = :OLD_CODIGO')
    ParamCheck = True
    UniDirectional = False
    Left = 608
    Top = 464
    object IBDtsEstoqueCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBDtsEstoqueDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 40
    end
    object IBDtsEstoqueESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      Origin = '"ESTOQUE"."ESTOQ"'
      DisplayFormat = '###0'
    end
    object IBDtsEstoqueDATB1: TDateField
      FieldName = 'DATB1'
      Origin = '"ESTOQUE"."DATB1"'
    end
    object IBDtsEstoqueDATB2: TDateField
      FieldName = 'DATB2'
      Origin = '"ESTOQUE"."DATB2"'
    end
    object IBDtsEstoqueCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ESTOQUE"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsItsolicit: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    SelectSQL.Strings = (
      'select * from ITSOLICIT')
    ParamCheck = True
    UniDirectional = False
    Left = 573
    Top = 408
    object IBDtsItsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"ITSOLICIT"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBDtsItsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"ITSOLICIT"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBDtsItsolicitARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Origin = '"ITSOLICIT"."ARTIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBDtsItsolicitDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITSOLICIT"."DESCRICAO"'
      Size = 40
    end
    object IBDtsItsolicitPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      Origin = '"ITSOLICIT"."PEQUENO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBDtsItsolicitMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      Origin = '"ITSOLICIT"."MEDIO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBDtsItsolicitGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      Origin = '"ITSOLICIT"."GRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBDtsItsolicitXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      Origin = '"ITSOLICIT"."XGRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBDtsItsolicitOBSER: TIBStringField
      FieldName = 'OBSER'
      Origin = '"ITSOLICIT"."OBSER"'
    end
  end
  object IBTGrupo: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'GRUPO'
    UniDirectional = False
    Left = 564
    Top = 72
    object IBTGrupoCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 2
    end
    object IBTGrupoDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object IBTUnidade: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'UNIDADE'
    UniDirectional = False
    Left = 563
    Top = 128
    object IBTUnidadeCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 3
    end
    object IBTUnidadeDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 25
    end
  end
  object IBTItemcomp: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ITEMCOMPRA'
    UniDirectional = False
    Left = 492
    Top = 184
    object IBTItemcompTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Required = True
      Size = 3
    end
    object IBTItemcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Required = True
      Size = 8
    end
    object IBTItemcompITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 3
    end
    object IBTItemcompCODART: TIBStringField
      FieldName = 'CODART'
      Size = 4
    end
    object IBTItemcompDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTItemcompQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object IBTItemcompPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Precision = 18
      Size = 2
    end
    object IBTItemcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Precision = 9
      Size = 2
    end
    object IBTItemcompVALART: TIBBCDField
      FieldName = 'VALART'
      Precision = 18
      Size = 2
    end
    object IBTItemcompTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Size = 2
    end
    object IBTItemcompCOR: TIBStringField
      FieldName = 'COR'
      Size = 15
    end
  end
  object IBTItemped: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ITEMPEDIDO'
    UniDirectional = False
    Left = 531
    Top = 296
    object IBTItempedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTItempedCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTItempedDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTItempedQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
    end
    object IBTItempedQTDRET: TIntegerField
      FieldName = 'QTDRET'
    end
    object IBTItempedPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Precision = 18
      Size = 2
    end
    object IBTItempedPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Precision = 18
      Size = 2
    end
  end
  object IBTItemdev: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ITEMDEVOLUCAO'
    UniDirectional = False
    Left = 524
    Top = 239
    object IBTItemdevNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Required = True
      Size = 6
    end
    object IBTItemdevCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTItemdevDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTItemdevQUANT: TIntegerField
      FieldName = 'QUANT'
      DisplayFormat = '###0'
    end
    object IBTItemdevPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBTRota: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ROTA'
    UniDirectional = False
    Left = 563
    Top = 16
    object IBTRotaROTA: TIBStringField
      FieldName = 'ROTA'
      Required = True
      Size = 3
    end
    object IBTRotaBAIR: TIBStringField
      FieldName = 'BAIR'
      Required = True
      Size = 3
    end
    object IBTRotaNOME: TIBStringField
      FieldName = 'NOME'
      Size = 25
    end
  end
  object IBDtsUnidade: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from UNIDADE'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into UNIDADE'
      '  (CODIGO, DESCRICAO)'
      'values'
      '  (:CODIGO, :DESCRICAO)')
    SelectSQL.Strings = (
      'select * from UNIDADE'
      'Order by Descricao')
    ModifySQL.Strings = (
      'update UNIDADE'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    ParamCheck = True
    UniDirectional = False
    Left = 624
    Top = 128
  end
  object IBDtsItenped: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ITEMPEDIDO'
      'where'
      '  CODART = :OLD_CODART and'
      '  PEDIDO = :OLD_PEDIDO')
    InsertSQL.Strings = (
      'insert into ITEMPEDIDO'
      '  (CODART, DESCRICAO, PEDIDO, PRECUS, PREVEN, QTDRET, QTDSAI)'
      'values'
      
        '  (:CODART, :DESCRICAO, :PEDIDO, :PRECUS, :PREVEN, :QTDRET, :QTD' +
        'SAI)')
    SelectSQL.Strings = (
      'select * from ITEMPEDIDO')
    ModifySQL.Strings = (
      'update ITEMPEDIDO'
      'set'
      '  CODART = :CODART,'
      '  DESCRICAO = :DESCRICAO,'
      '  PEDIDO = :PEDIDO,'
      '  PRECUS = :PRECUS,'
      '  PREVEN = :PREVEN,'
      '  QTDRET = :QTDRET,'
      '  QTDSAI = :QTDSAI'
      'where'
      '  CODART = :OLD_CODART and'
      '  PEDIDO = :OLD_PEDIDO')
    ParamCheck = True
    UniDirectional = False
    Left = 594
    Top = 296
    object IBDtsItenpedPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"ITEMPEDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBDtsItenpedCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMPEDIDO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBDtsItenpedDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMPEDIDO"."DESCRICAO"'
      Size = 40
    end
    object IBDtsItenpedQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"ITEMPEDIDO"."QTDSAI"'
      DisplayFormat = '###0.0'
    end
    object IBDtsItenpedQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"ITEMPEDIDO"."QTDRET"'
      DisplayFormat = '###0.0'
    end
    object IBDtsItenpedPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMPEDIDO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsItenpedPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"ITEMPEDIDO"."PREVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsItemcomp: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ITEMCOMPRA'
      'where'
      '  ITEM = :OLD_ITEM and'
      '  NUMPED = :OLD_NUMPED and'
      '  TIPPED = :OLD_TIPPED')
    InsertSQL.Strings = (
      'insert into ITEMCOMPRA'
      
        '  (CODART, COR, DESCON, DESCRICAO, ITEM, NUMPED, PRECOM, QUANT, ' +
        'TAMANHO, '
      '   TIPPED, VALART)'
      'values'
      
        '  (:CODART, :COR, :DESCON, :DESCRICAO, :ITEM, :NUMPED, :PRECOM, ' +
        ':QUANT, '
      '   :TAMANHO, :TIPPED, :VALART)')
    SelectSQL.Strings = (
      'select * from ITEMCOMPRA')
    ModifySQL.Strings = (
      'update ITEMCOMPRA'
      'set'
      '  CODART = :CODART,'
      '  COR = :COR,'
      '  DESCON = :DESCON,'
      '  DESCRICAO = :DESCRICAO,'
      '  ITEM = :ITEM,'
      '  NUMPED = :NUMPED,'
      '  PRECOM = :PRECOM,'
      '  QUANT = :QUANT,'
      '  TAMANHO = :TAMANHO,'
      '  TIPPED = :TIPPED,'
      '  VALART = :VALART'
      'where'
      '  ITEM = :OLD_ITEM and'
      '  NUMPED = :OLD_NUMPED and'
      '  TIPPED = :OLD_TIPPED')
    ParamCheck = True
    UniDirectional = False
    Left = 563
    Top = 184
    object IBDtsItemcompTIPPED: TIBStringField
      FieldName = 'TIPPED'
      Origin = '"ITEMCOMPRA"."TIPPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBDtsItemcompNUMPED: TIBStringField
      FieldName = 'NUMPED'
      Origin = '"ITEMCOMPRA"."NUMPED"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBDtsItemcompITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"ITEMCOMPRA"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBDtsItemcompCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMCOMPRA"."CODART"'
      Size = 4
    end
    object IBDtsItemcompDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMCOMPRA"."DESCRICAO"'
      Size = 40
    end
    object IBDtsItemcompQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMCOMPRA"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBDtsItemcompPRECOM: TIBBCDField
      FieldName = 'PRECOM'
      Origin = '"ITEMCOMPRA"."PRECOM"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsItemcompDESCON: TIBBCDField
      FieldName = 'DESCON'
      Origin = '"ITEMCOMPRA"."DESCON"'
      DisplayFormat = '##,##0.00'
      Precision = 9
      Size = 2
    end
    object IBDtsItemcompVALART: TIBBCDField
      FieldName = 'VALART'
      Origin = '"ITEMCOMPRA"."VALART"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsItemcompTAMANHO: TIBStringField
      FieldName = 'TAMANHO'
      Origin = '"ITEMCOMPRA"."TAMANHO"'
      Size = 2
    end
    object IBDtsItemcompCOR: TIBStringField
      FieldName = 'COR'
      Origin = '"ITEMCOMPRA"."COR"'
      Size = 15
    end
  end
  object IBDtsRota: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ROTA'
      'where'
      '  BAIR = :OLD_BAIR and'
      '  ROTA = :OLD_ROTA')
    InsertSQL.Strings = (
      'insert into ROTA'
      '  (BAIR, NOME, ROTA)'
      'values'
      '  (:BAIR, :NOME, :ROTA)')
    SelectSQL.Strings = (
      'select * from ROTA'
      'Order by Rota,Bair')
    ModifySQL.Strings = (
      'update ROTA'
      'set'
      '  BAIR = :BAIR,'
      '  NOME = :NOME,'
      '  ROTA = :ROTA'
      'where'
      '  BAIR = :OLD_BAIR and'
      '  ROTA = :OLD_ROTA')
    ParamCheck = True
    UniDirectional = False
    Left = 622
    Top = 16
  end
  object IBDtsGrupo: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      '  (CODIGO, DESCRICAO)'
      'values'
      '  (:CODIGO, :DESCRICAO)')
    SelectSQL.Strings = (
      'select * from GRUPO'
      'Order by Descricao')
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CODIGO = :CODIGO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODIGO = :OLD_CODIGO')
    ParamCheck = True
    UniDirectional = False
    Left = 624
    Top = 72
  end
  object DsPesq_def: TDataSource
    DataSet = IBQPesq_def
    Left = 280
    Top = 352
  end
  object DsPesq_solicit: TDataSource
    DataSet = IBQPesq_solicit
    Left = 315
    Top = 408
  end
  object DsEtiqueta: TDataSource
    DataSet = IBDtsEtiqueta
    Left = 153
    Top = 464
  end
  object DsRota: TDataSource
    DataSet = IBDtsRota
    Left = 678
    Top = 16
  end
  object DsFornec: TDataSource
    DataSet = IBDtsFornec
    Left = 144
    Top = 576
  end
  object DsGrupo: TDataSource
    DataSet = IBDtsGrupo
    Left = 682
    Top = 72
  end
  object DstLivro: TDataSource
    DataSet = IBDsLivro
    Left = 117
    Top = 520
  end
  object DsPesq_ped: TDataSource
    DataSet = IBQPesq_ped
    Left = 278
    Top = 296
  end
  object DsPesq_dev: TDataSource
    DataSet = IBQPesq_dev
    Left = 303
    Top = 240
  end
  object DsPesq_art: TDataSource
    DataSet = IBQPesq_art
    Left = 301
    Top = 128
  end
  object DsPesq_comp: TDataSource
    DataSet = IBQPesq_comp
    Left = 279
    Top = 184
  end
  object DsPesq_rot: TDataSource
    DataSet = IBQPesq_rot
    Left = 801
    Top = 16
  end
  object DsUnidade: TDataSource
    DataSet = IBDtsUnidade
    Left = 685
    Top = 128
  end
  object DsItemdev: TDataSource
    DataSet = IBDtsItemdev
    Left = 652
    Top = 240
  end
  object DsItemcomp: TDataSource
    DataSet = IBDtsItemcomp
    Left = 632
    Top = 184
  end
  object DsItemped: TDataSource
    DataSet = IBDtsItenped
    Left = 657
    Top = 296
  end
  object DsItemdef: TDataSource
    DataSet = IBDtsItemdef
    Left = 657
    Top = 352
  end
  object DsPesq_gru: TDataSource
    DataSet = IBQPesq_gru
    Left = 804
    Top = 72
  end
  object DsPesq_und: TDataSource
    DataSet = IBQPesq_und
    Left = 811
    Top = 128
  end
  object DsPesq_itcomp: TDataSource
    DataSet = IBQPesq_itcomp
    Left = 781
    Top = 184
  end
  object DsPesq_itsolicit: TDataSource
    DataSet = IBQPesq_itsolicit
    Left = 776
    Top = 408
  end
  object DsPesq_itdev: TDataSource
    DataSet = IBQPesq_itdev
    Left = 794
    Top = 240
  end
  object DsPesq_itped: TDataSource
    DataSet = IBQPesq_itped
    Left = 795
    Top = 296
  end
  object DsItsolicit: TDataSource
    DataSet = IBDtsItsolicit
    Left = 629
    Top = 408
  end
  object DsEstoque: TDataSource
    DataSet = IBDtsEstoque
    Left = 672
    Top = 464
  end
  object DsPesq_itdef: TDataSource
    DataSet = IBQPesq_itdef
    Left = 792
    Top = 352
  end
  object DsPerdido: TDataSource
    DataSet = IBDtsPerdido
    Left = 150
    Top = 632
  end
  object IBTItemdef: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ITEMDEFEITO'
    UniDirectional = False
    Left = 527
    Top = 352
    object IBTItemdefNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Required = True
      Size = 6
    end
    object IBTItemdefCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTItemdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTItemdefQUANT: TIntegerField
      FieldName = 'QUANT'
    end
    object IBTItemdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Precision = 18
      Size = 2
    end
  end
  object IBTItsolicit: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ITSOLICIT'
    UniDirectional = False
    Left = 515
    Top = 408
  end
  object IBTEstoque: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ESTOQUE'
    UniDirectional = False
    Left = 536
    Top = 464
    object IBTEstoqueCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Required = True
      Size = 4
    end
    object IBTEstoqueDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTEstoqueESTOQ: TIntegerField
      FieldName = 'ESTOQ'
    end
    object IBTEstoqueDATB1: TDateField
      FieldName = 'DATB1'
    end
    object IBTEstoqueDATB2: TDateField
      FieldName = 'DATB2'
    end
    object IBTEstoqueCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Precision = 18
      Size = 2
    end
  end
  object IBTResido: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'RESIDOS'
    UniDirectional = False
    Left = 471
    Top = 520
    object IBTResidoDATMOV: TDateField
      FieldName = 'DATMOV'
      Required = True
    end
    object IBTResidoITEM: TIBStringField
      FieldName = 'ITEM'
      Required = True
      Size = 3
    end
    object IBTResidoNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Size = 6
    end
    object IBTResidoVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Precision = 18
      Size = 2
    end
  end
  object IBTContas: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CONTAS'
    UniDirectional = False
    Left = 538
    Top = 576
    object IBTContasDATEMIS: TDateField
      FieldName = 'DATEMIS'
      Required = True
    end
    object IBTContasTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Required = True
      Size = 3
    end
    object IBTContasNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Required = True
      Size = 8
    end
    object IBTContasPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Required = True
      Size = 2
    end
    object IBTContasHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Size = 40
    end
    object IBTContasOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Size = 40
    end
    object IBTContasVALOR: TIBBCDField
      FieldName = 'VALOR'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTContasTIPCOB: TIBStringField
      FieldName = 'TIPCOB'
      Size = 3
    end
    object IBTContasNUMCOB: TIBStringField
      FieldName = 'NUMCOB'
      Size = 8
    end
    object IBTContasORICOB: TIBStringField
      FieldName = 'ORICOB'
      Size = 15
    end
    object IBTContasDATVENC: TDateField
      FieldName = 'DATVENC'
    end
    object IBTContasSINAL: TIBStringField
      FieldName = 'SINAL'
      Size = 1
    end
    object IBTContasSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Size = 3
    end
    object IBTContasSITU: TIBStringField
      FieldName = 'SITU'
      Size = 1
    end
    object IBTContasDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Size = 10
    end
    object IBTContasVENDE: TIBStringField
      FieldName = 'VENDE'
      Size = 3
    end
    object IBTContasACOMIS: TIBBCDField
      FieldName = 'ACOMIS'
      DisplayFormat = '##0,0'
      Precision = 9
      Size = 2
    end
    object IBTContasCOMISS: TIBBCDField
      FieldName = 'COMISS'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBTContasDATBAX: TIBStringField
      FieldName = 'DATBAX'
      Size = 10
    end
    object IBTContasOPEROU: TIBStringField
      FieldName = 'OPEROU'
      Size = 15
    end
    object IBTContasNUMCLI: TIBStringField
      FieldName = 'NUMCLI'
      Size = 6
    end
  end
  object IBTItemper: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'ITEMPERDIDO'
    UniDirectional = False
    Left = 538
    Top = 632
    object IBTItemperPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Required = True
      Size = 6
    end
    object IBTItemperCODART: TIBStringField
      FieldName = 'CODART'
      Required = True
      Size = 4
    end
    object IBTItemperDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object IBTItemperQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
    end
    object IBTItemperQTDRET: TIntegerField
      FieldName = 'QTDRET'
    end
    object IBTItemperPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Precision = 18
      Size = 2
    end
    object IBTItemperPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsResido: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from RESIDOS'
      'where'
      '  DATMOV = :OLD_DATMOV and'
      '  ITEM = :OLD_ITEM')
    InsertSQL.Strings = (
      'insert into RESIDOS'
      '  (DATMOV, ITEM, NUMDOC, VALPAG)'
      'values'
      '  (:DATMOV, :ITEM, :NUMDOC, :VALPAG)')
    SelectSQL.Strings = (
      'select * from RESIDOS')
    ModifySQL.Strings = (
      'update RESIDOS'
      'set'
      '  DATMOV = :DATMOV,'
      '  ITEM = :ITEM,'
      '  NUMDOC = :NUMDOC,'
      '  VALPAG = :VALPAG'
      'where'
      '  DATMOV = :OLD_DATMOV and'
      '  ITEM = :OLD_ITEM')
    ParamCheck = True
    UniDirectional = False
    Left = 551
    Top = 520
    object IBDtsResidoDATMOV: TDateField
      FieldName = 'DATMOV'
      Origin = '"RESIDOS"."DATMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDtsResidoITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"RESIDOS"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBDtsResidoNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"RESIDOS"."NUMDOC"'
      Size = 6
    end
    object IBDtsResidoVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"RESIDOS"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBDtsContas: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CONTAS'
      'where'
      '  DATEMIS = :OLD_DATEMIS and'
      '  NUMDOC = :OLD_NUMDOC and'
      '  PARCEL = :OLD_PARCEL and'
      '  TIPDOC = :OLD_TIPDOC')
    InsertSQL.Strings = (
      'insert into CONTAS'
      
        '  (ACOMIS, COMISS, DATBAX, DATEMIS, DATPAG, DATVENC, HISTOR, NUM' +
        'CLI, NUMCOB, '
      
        '   NUMDOC, OBSERV, OPEROU, ORICOB, PARCEL, SIGLA, SINAL, SITU, T' +
        'IPCOB, '
      '   TIPDOC, VALOR, VENDE)'
      'values'
      
        '  (:ACOMIS, :COMISS, :DATBAX, :DATEMIS, :DATPAG, :DATVENC, :HIST' +
        'OR, :NUMCLI, '
      
        '   :NUMCOB, :NUMDOC, :OBSERV, :OPEROU, :ORICOB, :PARCEL, :SIGLA,' +
        ' :SINAL, '
      '   :SITU, :TIPCOB, :TIPDOC, :VALOR, :VENDE)')
    SelectSQL.Strings = (
      'select * from CONTAS')
    ModifySQL.Strings = (
      'update CONTAS'
      'set'
      '  ACOMIS = :ACOMIS,'
      '  COMISS = :COMISS,'
      '  DATBAX = :DATBAX,'
      '  DATEMIS = :DATEMIS,'
      '  DATPAG = :DATPAG,'
      '  DATVENC = :DATVENC,'
      '  HISTOR = :HISTOR,'
      '  NUMCLI = :NUMCLI,'
      '  NUMCOB = :NUMCOB,'
      '  NUMDOC = :NUMDOC,'
      '  OBSERV = :OBSERV,'
      '  OPEROU = :OPEROU,'
      '  ORICOB = :ORICOB,'
      '  PARCEL = :PARCEL,'
      '  SIGLA = :SIGLA,'
      '  SINAL = :SINAL,'
      '  SITU = :SITU,'
      '  TIPCOB = :TIPCOB,'
      '  TIPDOC = :TIPDOC,'
      '  VALOR = :VALOR,'
      '  VENDE = :VENDE'
      'where'
      '  DATEMIS = :OLD_DATEMIS and'
      '  NUMDOC = :OLD_NUMDOC and'
      '  PARCEL = :OLD_PARCEL and'
      '  TIPDOC = :OLD_TIPDOC')
    ParamCheck = True
    UniDirectional = False
    Left = 608
    Top = 576
    object IBDtsContasDATEMIS: TDateField
      FieldName = 'DATEMIS'
      Origin = '"CONTAS"."DATEMIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDtsContasTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Origin = '"CONTAS"."TIPDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBDtsContasNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"CONTAS"."NUMDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBDtsContasPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"CONTAS"."PARCEL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IBDtsContasHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Origin = '"CONTAS"."HISTOR"'
      Size = 40
    end
    object IBDtsContasOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Origin = '"CONTAS"."OBSERV"'
      Size = 40
    end
    object IBDtsContasVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"CONTAS"."VALOR"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsContasTIPCOB: TIBStringField
      FieldName = 'TIPCOB'
      Origin = '"CONTAS"."TIPCOB"'
      Size = 3
    end
    object IBDtsContasNUMCOB: TIBStringField
      FieldName = 'NUMCOB'
      Origin = '"CONTAS"."NUMCOB"'
      Size = 8
    end
    object IBDtsContasORICOB: TIBStringField
      FieldName = 'ORICOB'
      Origin = '"CONTAS"."ORICOB"'
      Size = 15
    end
    object IBDtsContasDATVENC: TDateField
      FieldName = 'DATVENC'
      Origin = '"CONTAS"."DATVENC"'
    end
    object IBDtsContasSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"CONTAS"."SINAL"'
      Size = 1
    end
    object IBDtsContasSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"CONTAS"."SIGLA"'
      Size = 3
    end
    object IBDtsContasSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"CONTAS"."SITU"'
      Size = 1
    end
    object IBDtsContasDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"CONTAS"."DATPAG"'
      Size = 10
    end
    object IBDtsContasVENDE: TIBStringField
      FieldName = 'VENDE'
      Origin = '"CONTAS"."VENDE"'
      Size = 3
    end
    object IBDtsContasACOMIS: TIBBCDField
      FieldName = 'ACOMIS'
      Origin = '"CONTAS"."ACOMIS"'
      DisplayFormat = '##0'
      Precision = 9
      Size = 2
    end
    object IBDtsContasCOMISS: TIBBCDField
      FieldName = 'COMISS'
      Origin = '"CONTAS"."COMISS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBDtsContasDATBAX: TIBStringField
      FieldName = 'DATBAX'
      Origin = '"CONTAS"."DATBAX"'
      Size = 10
    end
    object IBDtsContasOPEROU: TIBStringField
      FieldName = 'OPEROU'
      Origin = '"CONTAS"."OPEROU"'
      Size = 15
    end
    object IBDtsContasNUMCLI: TIBStringField
      FieldName = 'NUMCLI'
      Origin = '"CONTAS"."NUMCLI"'
      Size = 6
    end
  end
  object IBDtsItemper: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ITEMPERDIDO'
      'where'
      '  CODART = :OLD_CODART and'
      '  PEDIDO = :OLD_PEDIDO')
    InsertSQL.Strings = (
      'insert into ITEMPERDIDO'
      '  (CODART, DESCRICAO, PEDIDO, PRECUS, PREVEN, QTDRET, QTDSAI)'
      'values'
      
        '  (:CODART, :DESCRICAO, :PEDIDO, :PRECUS, :PREVEN, :QTDRET, :QTD' +
        'SAI)')
    SelectSQL.Strings = (
      'select * from ITEMPERDIDO')
    ModifySQL.Strings = (
      'update ITEMPERDIDO'
      'set'
      '  CODART = :CODART,'
      '  DESCRICAO = :DESCRICAO,'
      '  PEDIDO = :PEDIDO,'
      '  PRECUS = :PRECUS,'
      '  PREVEN = :PREVEN,'
      '  QTDRET = :QTDRET,'
      '  QTDSAI = :QTDSAI'
      'where'
      '  CODART = :OLD_CODART and'
      '  PEDIDO = :OLD_PEDIDO')
    ParamCheck = True
    UniDirectional = False
    Left = 609
    Top = 632
  end
  object IBQPesq_etic: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ETIQUETA')
    Left = 216
    Top = 463
    object IBQPesq_eticIDETIQ: TIntegerField
      FieldName = 'IDETIQ'
      Origin = '"ETIQUETA"."IDETIQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQPesq_eticCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"ETIQUETA"."CODCLI"'
      Size = 4
    end
    object IBQPesq_eticNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"ETIQUETA"."NOMCLI"'
    end
    object IBQPesq_eticSOBNOM: TIBStringField
      FieldName = 'SOBNOM'
      Origin = '"ETIQUETA"."SOBNOM"'
      Size = 15
    end
    object IBQPesq_eticBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"ETIQUETA"."BAIRRO"'
    end
    object IBQPesq_eticCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"ETIQUETA"."CODVEN"'
      Size = 3
    end
    object IBQPesq_eticNOMVEN: TIBStringField
      FieldName = 'NOMVEN'
      Origin = '"ETIQUETA"."NOMVEN"'
      Size = 35
    end
  end
  object IBQLer_solicit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from SOLICITACAO')
    Left = 455
    Top = 408
    object IBQLer_solicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"SOLICITACAO"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQLer_solicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"SOLICITACAO"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQLer_solicitCLIENTE: TIBStringField
      FieldName = 'CLIENTE'
      Origin = '"SOLICITACAO"."CLIENTE"'
      Size = 4
    end
    object IBQLer_solicitNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"SOLICITACAO"."NOMCLI"'
      Size = 40
    end
    object IBQLer_solicitDATSOL: TDateField
      FieldName = 'DATSOL'
      Origin = '"SOLICITACAO"."DATSOL"'
    end
    object IBQLer_solicitSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"SOLICITACAO"."SITU"'
      Size = 1
    end
  end
  object IBQVer_itper: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMPERDIDO')
    Left = 876
    Top = 632
  end
  object IBQPesq_itdef: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMDEFEITO')
    Left = 722
    Top = 352
    object IBQPesq_itdefNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_itdefCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEFEITO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesq_itdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEFEITO"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_itdefQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEFEITO"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBQPesq_itdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEFEITO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_itdef: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMDEFEITO')
    Left = 856
    Top = 352
    object IBQVer_itdefNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_itdefCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEFEITO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQVer_itdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEFEITO"."DESCRICAO"'
      Size = 40
    end
    object IBQVer_itdefQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEFEITO"."QUANT"'
      DisplayFormat = '###0.0'
    end
    object IBQVer_itdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEFEITO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQLer_itdef: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMDEFEITO')
    Left = 928
    Top = 352
    object IBQLer_itdefNUMNOT: TIBStringField
      FieldName = 'NUMNOT'
      Origin = '"ITEMDEFEITO"."NUMNOT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQLer_itdefCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMDEFEITO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQLer_itdefDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMDEFEITO"."DESCRICAO"'
      Size = 40
    end
    object IBQLer_itdefQUANT: TIntegerField
      FieldName = 'QUANT'
      Origin = '"ITEMDEFEITO"."QUANT"'
    end
    object IBQLer_itdefPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMDEFEITO"."PRECUS"'
      Precision = 18
      Size = 2
    end
  end
  object IBQLer_itsolicit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITSOLICIT')
    Left = 928
    Top = 408
  end
  object IBQVer_itsolicit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITSOLICIT')
    Left = 852
    Top = 408
    object IBQVer_itsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"ITSOLICIT"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_itsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"ITSOLICIT"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_itsolicitARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Origin = '"ITSOLICIT"."ARTIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQVer_itsolicitDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITSOLICIT"."DESCRICAO"'
      Size = 40
    end
    object IBQVer_itsolicitPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      Origin = '"ITSOLICIT"."PEQUENO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQVer_itsolicitMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      Origin = '"ITSOLICIT"."MEDIO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQVer_itsolicitGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      Origin = '"ITSOLICIT"."GRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQVer_itsolicitXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      Origin = '"ITSOLICIT"."XGRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQVer_itsolicitOBSER: TIBStringField
      FieldName = 'OBSER'
      Origin = '"ITSOLICIT"."OBSER"'
    end
  end
  object IBQVer_etic: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ETIQUETA')
    Left = 347
    Top = 464
    object IBQVer_eticIDETIQ: TIntegerField
      FieldName = 'IDETIQ'
      Origin = '"ETIQUETA"."IDETIQ"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQVer_eticCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"ETIQUETA"."CODCLI"'
      Size = 4
    end
    object IBQVer_eticNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"ETIQUETA"."NOMCLI"'
    end
    object IBQVer_eticSOBNOM: TIBStringField
      FieldName = 'SOBNOM'
      Origin = '"ETIQUETA"."SOBNOM"'
      Size = 15
    end
    object IBQVer_eticBAIRRO: TIBStringField
      FieldName = 'BAIRRO'
      Origin = '"ETIQUETA"."BAIRRO"'
    end
    object IBQVer_eticCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"ETIQUETA"."CODVEN"'
      Size = 3
    end
    object IBQVer_eticNOMVEN: TIBStringField
      FieldName = 'NOMVEN'
      Origin = '"ETIQUETA"."NOMVEN"'
      Size = 35
    end
  end
  object IBQLer_etic: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ETIQUETA')
    Left = 407
    Top = 463
  end
  object IBQPesq_liv: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from LIVRO')
    Left = 169
    Top = 520
    object IBQPesq_livDATMOV: TDateField
      FieldName = 'DATMOV'
      Origin = '"LIVRO"."DATMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQPesq_livITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"LIVRO"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_livHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Origin = '"LIVRO"."HISTOR"'
      Size = 40
    end
    object IBQPesq_livOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Origin = '"LIVRO"."OBSERV"'
      Size = 30
    end
    object IBQPesq_livORIPAG: TIBStringField
      FieldName = 'ORIPAG'
      Origin = '"LIVRO"."ORIPAG"'
      Size = 15
    end
    object IBQPesq_livTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = '"LIVRO"."TIPPAG"'
      Size = 4
    end
    object IBQPesq_livNUMPAG: TIBStringField
      FieldName = 'NUMPAG'
      Origin = '"LIVRO"."NUMPAG"'
      Size = 12
    end
    object IBQPesq_livVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"LIVRO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_livSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"LIVRO"."SINAL"'
      Size = 1
    end
    object IBQPesq_livTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Origin = '"LIVRO"."TIPDOC"'
      Size = 3
    end
    object IBQPesq_livNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"LIVRO"."NUMDOC"'
      Size = 12
    end
    object IBQPesq_livPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"LIVRO"."PARCEL"'
      Size = 3
    end
  end
  object IBQPesq_for: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from FORNECEDOR')
    Left = 208
    Top = 576
    object IBQPesq_forMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"FORNECEDOR"."MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBQPesq_forRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"FORNECEDOR"."RAZAO"'
      Size = 45
    end
    object IBQPesq_forPESSO: TIBStringField
      FieldName = 'PESSO'
      Origin = '"FORNECEDOR"."PESSO"'
      Size = 1
    end
    object IBQPesq_forNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"FORNECEDOR"."NCPF"'
    end
    object IBQPesq_forCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"FORNECEDOR"."CNPJ"'
    end
    object IBQPesq_forINSC: TIBStringField
      FieldName = 'INSC'
      Origin = '"FORNECEDOR"."INSC"'
    end
    object IBQPesq_forENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"FORNECEDOR"."ENDE"'
      Size = 40
    end
    object IBQPesq_forBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"FORNECEDOR"."BAIR"'
    end
    object IBQPesq_forCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"FORNECEDOR"."CIDA"'
    end
    object IBQPesq_forESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"FORNECEDOR"."ESTA"'
      Size = 2
    end
    object IBQPesq_forNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"FORNECEDOR"."NCEP"'
      Size = 9
    end
    object IBQPesq_forNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"FORNECEDOR"."NTEL"'
      Size = 30
    end
    object IBQPesq_forRESP: TIBStringField
      FieldName = 'RESP'
      Origin = '"FORNECEDOR"."RESP"'
      Size = 30
    end
    object IBQPesq_forRTEL: TIBStringField
      FieldName = 'RTEL'
      Origin = '"FORNECEDOR"."RTEL"'
    end
    object IBQPesq_forSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"FORNECEDOR"."SITU"'
      Size = 1
    end
  end
  object IBQPesq_per: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PERDIDO')
    Left = 213
    Top = 632
    object IBQPesq_perPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"PERDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_perCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"PERDIDO"."CODVEN"'
      Size = 3
    end
    object IBQPesq_perCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"PERDIDO"."CODCLI"'
      Size = 4
    end
    object IBQPesq_perNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"PERDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQPesq_perBASE: TDateField
      FieldName = 'BASE'
      Origin = '"PERDIDO"."BASE"'
    end
    object IBQPesq_perRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"PERDIDO"."RECOL"'
    end
    object IBQPesq_perCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"PERDIDO"."COBRAN"'
    end
    object IBQPesq_perTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"PERDIDO"."TOTPED"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_perSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"PERDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQPesq_perDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"PERDIDO"."DATPED"'
      Size = 10
    end
    object IBQPesq_perSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"PERDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQPesq_perRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"PERDIDO"."RETORNO"'
      Size = 10
    end
    object IBQPesq_perTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"PERDIDO"."TOTVEN"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_perDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"PERDIDO"."DATPAG"'
      Size = 10
    end
    object IBQPesq_perVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"PERDIDO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_perRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"PERDIDO"."RESIDUO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_perCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"PERDIDO"."COB"'
      Size = 1
    end
    object IBQPesq_perLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"PERDIDO"."LIMITE"'
      Size = 10
    end
    object IBQPesq_perVIA: TIBStringField
      FieldName = 'VIA'
      Origin = '"PERDIDO"."VIA"'
      Size = 1
    end
    object IBQPesq_perOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Origin = '"PERDIDO"."OLDPED"'
      Size = 6
    end
  end
  object IBQVer_liv: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from LIVRO')
    Left = 285
    Top = 520
    object IBQVer_livDATMOV: TDateField
      FieldName = 'DATMOV'
      Origin = '"LIVRO"."DATMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQVer_livITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"LIVRO"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_livHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Origin = '"LIVRO"."HISTOR"'
      Size = 40
    end
    object IBQVer_livOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Origin = '"LIVRO"."OBSERV"'
      Size = 30
    end
    object IBQVer_livORIPAG: TIBStringField
      FieldName = 'ORIPAG'
      Origin = '"LIVRO"."ORIPAG"'
      Size = 15
    end
    object IBQVer_livTIPPAG: TIBStringField
      FieldName = 'TIPPAG'
      Origin = '"LIVRO"."TIPPAG"'
      Size = 4
    end
    object IBQVer_livNUMPAG: TIBStringField
      FieldName = 'NUMPAG'
      Origin = '"LIVRO"."NUMPAG"'
      Size = 12
    end
    object IBQVer_livVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"LIVRO"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQVer_livSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"LIVRO"."SINAL"'
      Size = 1
    end
    object IBQVer_livTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Origin = '"LIVRO"."TIPDOC"'
      Size = 3
    end
    object IBQVer_livNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"LIVRO"."NUMDOC"'
      Size = 12
    end
    object IBQVer_livPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"LIVRO"."PARCEL"'
      Size = 3
    end
  end
  object IBQPesq_contg: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTAGEM')
    Left = 212
    Top = 689
  end
  object IBQLer_contg: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTAGEM')
    Left = 432
    Top = 688
    object IBQLer_contgDATCONT: TDateField
      FieldName = 'DATCONT'
      Origin = '"CONTAGEM"."DATCONT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQLer_contgTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CONTAGEM"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object IBQLer_contgCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"CONTAGEM"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQLer_contgGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"CONTAGEM"."GRUPO"'
      Size = 2
    end
    object IBQLer_contgDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CONTAGEM"."DESCRICAO"'
      Size = 40
    end
    object IBQLer_contgINICIAL: TIntegerField
      FieldName = 'INICIAL'
      Origin = '"CONTAGEM"."INICIAL"'
    end
    object IBQLer_contgSACOL: TIntegerField
      FieldName = 'SACOL'
      Origin = '"CONTAGEM"."SACOL"'
    end
    object IBQLer_contgPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"CONTAGEM"."PRECO"'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_est: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ESTOQUE')
    Left = 864
    Top = 464
    object IBQVer_estCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQVer_estDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 40
    end
    object IBQVer_estESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      Origin = '"ESTOQUE"."ESTOQ"'
      DisplayFormat = '###0'
    end
    object IBQVer_estDATB1: TDateField
      FieldName = 'DATB1'
      Origin = '"ESTOQUE"."DATB1"'
    end
    object IBQVer_estDATB2: TDateField
      FieldName = 'DATB2'
      Origin = '"ESTOQUE"."DATB2"'
    end
    object IBQVer_estCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ESTOQUE"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQLer_est: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ESTOQUE')
    Left = 928
    Top = 464
    object IBQLer_estCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQLer_estDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 40
    end
    object IBQLer_estESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      Origin = '"ESTOQUE"."ESTOQ"'
      DisplayFormat = '###0'
    end
    object IBQLer_estDATB1: TDateField
      FieldName = 'DATB1'
      Origin = '"ESTOQUE"."DATB1"'
    end
    object IBQLer_estDATB2: TDateField
      FieldName = 'DATB2'
      Origin = '"ESTOQUE"."DATB2"'
    end
    object IBQLer_estCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ESTOQUE"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_per: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PERDIDO')
    Left = 344
    Top = 632
    object IBQVer_perPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"PERDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQVer_perCODVEN: TIBStringField
      FieldName = 'CODVEN'
      Origin = '"PERDIDO"."CODVEN"'
      Size = 3
    end
    object IBQVer_perCODCLI: TIBStringField
      FieldName = 'CODCLI'
      Origin = '"PERDIDO"."CODCLI"'
      Size = 4
    end
    object IBQVer_perNOMCLI: TIBStringField
      FieldName = 'NOMCLI'
      Origin = '"PERDIDO"."NOMCLI"'
      Size = 40
    end
    object IBQVer_perBASE: TDateField
      FieldName = 'BASE'
      Origin = '"PERDIDO"."BASE"'
    end
    object IBQVer_perRECOL: TDateField
      FieldName = 'RECOL'
      Origin = '"PERDIDO"."RECOL"'
    end
    object IBQVer_perCOBRAN: TDateField
      FieldName = 'COBRAN'
      Origin = '"PERDIDO"."COBRAN"'
    end
    object IBQVer_perTOTPED: TIBBCDField
      FieldName = 'TOTPED'
      Origin = '"PERDIDO"."TOTPED"'
      Precision = 18
      Size = 2
    end
    object IBQVer_perSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"PERDIDO"."SITU"'
      FixedChar = True
      Size = 1
    end
    object IBQVer_perDATPED: TIBStringField
      FieldName = 'DATPED'
      Origin = '"PERDIDO"."DATPED"'
      Size = 10
    end
    object IBQVer_perSOLICIT: TIBStringField
      FieldName = 'SOLICIT'
      Origin = '"PERDIDO"."SOLICIT"'
      Size = 6
    end
    object IBQVer_perRETORNO: TIBStringField
      FieldName = 'RETORNO'
      Origin = '"PERDIDO"."RETORNO"'
      Size = 10
    end
    object IBQVer_perTOTVEN: TIBBCDField
      FieldName = 'TOTVEN'
      Origin = '"PERDIDO"."TOTVEN"'
      Precision = 18
      Size = 2
    end
    object IBQVer_perDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"PERDIDO"."DATPAG"'
      Size = 10
    end
    object IBQVer_perVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"PERDIDO"."VALPAG"'
      Precision = 18
      Size = 2
    end
    object IBQVer_perRESIDUO: TIBBCDField
      FieldName = 'RESIDUO'
      Origin = '"PERDIDO"."RESIDUO"'
      Precision = 18
      Size = 2
    end
    object IBQVer_perCOB: TIBStringField
      FieldName = 'COB'
      Origin = '"PERDIDO"."COB"'
      Size = 1
    end
    object IBQVer_perLIMITE: TIBStringField
      FieldName = 'LIMITE'
      Origin = '"PERDIDO"."LIMITE"'
      Size = 10
    end
    object IBQVer_perVIA: TIBStringField
      FieldName = 'VIA'
      Origin = '"PERDIDO"."VIA"'
      Size = 1
    end
    object IBQVer_perOLDPED: TIBStringField
      FieldName = 'OLDPED'
      Origin = '"PERDIDO"."OLDPED"'
      Size = 6
    end
  end
  object IBQLer_per: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from PERDIDO')
    Left = 408
    Top = 632
  end
  object IBQPesq_itper: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITEMPERDIDO')
    Left = 736
    Top = 632
    object IBQPesq_itperPEDIDO: TIBStringField
      FieldName = 'PEDIDO'
      Origin = '"ITEMPERDIDO"."PEDIDO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_itperCODART: TIBStringField
      FieldName = 'CODART'
      Origin = '"ITEMPERDIDO"."CODART"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesq_itperDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITEMPERDIDO"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_itperQTDSAI: TIntegerField
      FieldName = 'QTDSAI'
      Origin = '"ITEMPERDIDO"."QTDSAI"'
      DisplayFormat = '###0'
    end
    object IBQPesq_itperQTDRET: TIntegerField
      FieldName = 'QTDRET'
      Origin = '"ITEMPERDIDO"."QTDRET"'
      DisplayFormat = '###0'
    end
    object IBQPesq_itperPRECUS: TIBBCDField
      FieldName = 'PRECUS'
      Origin = '"ITEMPERDIDO"."PRECUS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_itperPREVEN: TIBBCDField
      FieldName = 'PREVEN'
      Origin = '"ITEMPERDIDO"."PREVEN"'
      DisplayFormat = '##<##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_for: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from FORNECEDOR')
    Left = 344
    Top = 576
    object IBQVer_forMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"FORNECEDOR"."MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBQVer_forRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"FORNECEDOR"."RAZAO"'
      Size = 45
    end
    object IBQVer_forPESSO: TIBStringField
      FieldName = 'PESSO'
      Origin = '"FORNECEDOR"."PESSO"'
      Size = 1
    end
    object IBQVer_forNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"FORNECEDOR"."NCPF"'
    end
    object IBQVer_forCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"FORNECEDOR"."CNPJ"'
    end
    object IBQVer_forINSC: TIBStringField
      FieldName = 'INSC'
      Origin = '"FORNECEDOR"."INSC"'
    end
    object IBQVer_forENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"FORNECEDOR"."ENDE"'
      Size = 40
    end
    object IBQVer_forBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"FORNECEDOR"."BAIR"'
    end
    object IBQVer_forCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"FORNECEDOR"."CIDA"'
    end
    object IBQVer_forESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"FORNECEDOR"."ESTA"'
      Size = 2
    end
    object IBQVer_forNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"FORNECEDOR"."NCEP"'
      Size = 9
    end
    object IBQVer_forNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"FORNECEDOR"."NTEL"'
      Size = 30
    end
    object IBQVer_forRESP: TIBStringField
      FieldName = 'RESP'
      Origin = '"FORNECEDOR"."RESP"'
      Size = 30
    end
    object IBQVer_forRTEL: TIBStringField
      FieldName = 'RTEL'
      Origin = '"FORNECEDOR"."RTEL"'
    end
    object IBQVer_forSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"FORNECEDOR"."SITU"'
      Size = 1
    end
  end
  object IBQLer_for: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from FORNECEDOR')
    Left = 408
    Top = 576
    object IBQLer_forMARCA: TIBStringField
      FieldName = 'MARCA'
      Origin = '"FORNECEDOR"."MARCA"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 15
    end
    object IBQLer_forRAZAO: TIBStringField
      FieldName = 'RAZAO'
      Origin = '"FORNECEDOR"."RAZAO"'
      Size = 45
    end
    object IBQLer_forPESSO: TIBStringField
      FieldName = 'PESSO'
      Origin = '"FORNECEDOR"."PESSO"'
      Size = 1
    end
    object IBQLer_forNCPF: TIBStringField
      FieldName = 'NCPF'
      Origin = '"FORNECEDOR"."NCPF"'
    end
    object IBQLer_forCNPJ: TIBStringField
      FieldName = 'CNPJ'
      Origin = '"FORNECEDOR"."CNPJ"'
    end
    object IBQLer_forINSC: TIBStringField
      FieldName = 'INSC'
      Origin = '"FORNECEDOR"."INSC"'
    end
    object IBQLer_forENDE: TIBStringField
      FieldName = 'ENDE'
      Origin = '"FORNECEDOR"."ENDE"'
      Size = 40
    end
    object IBQLer_forBAIR: TIBStringField
      FieldName = 'BAIR'
      Origin = '"FORNECEDOR"."BAIR"'
    end
    object IBQLer_forCIDA: TIBStringField
      FieldName = 'CIDA'
      Origin = '"FORNECEDOR"."CIDA"'
    end
    object IBQLer_forESTA: TIBStringField
      FieldName = 'ESTA'
      Origin = '"FORNECEDOR"."ESTA"'
      Size = 2
    end
    object IBQLer_forNCEP: TIBStringField
      FieldName = 'NCEP'
      Origin = '"FORNECEDOR"."NCEP"'
      Size = 9
    end
    object IBQLer_forNTEL: TIBStringField
      FieldName = 'NTEL'
      Origin = '"FORNECEDOR"."NTEL"'
      Size = 30
    end
    object IBQLer_forRESP: TIBStringField
      FieldName = 'RESP'
      Origin = '"FORNECEDOR"."RESP"'
      Size = 30
    end
    object IBQLer_forRTEL: TIBStringField
      FieldName = 'RTEL'
      Origin = '"FORNECEDOR"."RTEL"'
    end
    object IBQLer_forSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"FORNECEDOR"."SITU"'
      Size = 1
    end
  end
  object IBQPesq_itsolicit: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ITSOLICIT')
    Left = 696
    Top = 408
    object IBQPesq_itsolicitVENDEDOR: TIBStringField
      FieldName = 'VENDEDOR'
      Origin = '"ITSOLICIT"."VENDEDOR"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_itsolicitNUMERO: TIBStringField
      FieldName = 'NUMERO'
      Origin = '"ITSOLICIT"."NUMERO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 6
    end
    object IBQPesq_itsolicitARTIGO: TIBStringField
      FieldName = 'ARTIGO'
      Origin = '"ITSOLICIT"."ARTIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesq_itsolicitDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ITSOLICIT"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_itsolicitPEQUENO: TIBBCDField
      FieldName = 'PEQUENO'
      Origin = '"ITSOLICIT"."PEQUENO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQPesq_itsolicitMEDIO: TIBBCDField
      FieldName = 'MEDIO'
      Origin = '"ITSOLICIT"."MEDIO"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQPesq_itsolicitGRANDE: TIBBCDField
      FieldName = 'GRANDE'
      Origin = '"ITSOLICIT"."GRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQPesq_itsolicitXGRANDE: TIBBCDField
      FieldName = 'XGRANDE'
      Origin = '"ITSOLICIT"."XGRANDE"'
      DisplayFormat = '###0'
      Precision = 4
      Size = 1
    end
    object IBQPesq_itsolicitOBSER: TIBStringField
      FieldName = 'OBSER'
      Origin = '"ITSOLICIT"."OBSER"'
    end
  end
  object IBQPesq_est: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from ESTOQUE')
    Left = 732
    Top = 464
    object IBQPesq_estCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"ESTOQUE"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQPesq_estDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"ESTOQUE"."DESCRICAO"'
      Size = 40
    end
    object IBQPesq_estESTOQ: TIntegerField
      FieldName = 'ESTOQ'
      Origin = '"ESTOQUE"."ESTOQ"'
      DisplayFormat = '###0.0'
    end
    object IBQPesq_estDATB1: TDateField
      FieldName = 'DATB1'
      Origin = '"ESTOQUE"."DATB1"'
    end
    object IBQPesq_estDATB2: TDateField
      FieldName = 'DATB2'
      Origin = '"ESTOQUE"."DATB2"'
    end
    object IBQPesq_estCUSTO: TIBBCDField
      FieldName = 'CUSTO'
      Origin = '"ESTOQUE"."CUSTO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQPesq_resi: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from RESIDOS')
    Left = 675
    Top = 520
    object IBQPesq_resiDATMOV: TDateField
      FieldName = 'DATMOV'
      Origin = '"RESIDOS"."DATMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQPesq_resiITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"RESIDOS"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_resiNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"RESIDOS"."NUMDOC"'
      Size = 6
    end
    object IBQPesq_resiVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"RESIDOS"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQPesq_cont: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTAS')
    Left = 733
    Top = 576
    object IBQPesq_contDATEMIS: TDateField
      FieldName = 'DATEMIS'
      Origin = '"CONTAS"."DATEMIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQPesq_contTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Origin = '"CONTAS"."TIPDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQPesq_contNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"CONTAS"."NUMDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQPesq_contPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"CONTAS"."PARCEL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IBQPesq_contHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Origin = '"CONTAS"."HISTOR"'
      Size = 40
    end
    object IBQPesq_contOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Origin = '"CONTAS"."OBSERV"'
      Size = 40
    end
    object IBQPesq_contVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"CONTAS"."VALOR"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_contTIPCOB: TIBStringField
      FieldName = 'TIPCOB'
      Origin = '"CONTAS"."TIPCOB"'
      Size = 3
    end
    object IBQPesq_contNUMCOB: TIBStringField
      FieldName = 'NUMCOB'
      Origin = '"CONTAS"."NUMCOB"'
      Size = 8
    end
    object IBQPesq_contORICOB: TIBStringField
      FieldName = 'ORICOB'
      Origin = '"CONTAS"."ORICOB"'
      Size = 15
    end
    object IBQPesq_contDATVENC: TDateField
      FieldName = 'DATVENC'
      Origin = '"CONTAS"."DATVENC"'
    end
    object IBQPesq_contSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"CONTAS"."SINAL"'
      Size = 1
    end
    object IBQPesq_contSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"CONTAS"."SIGLA"'
      Size = 3
    end
    object IBQPesq_contSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"CONTAS"."SITU"'
      Size = 1
    end
    object IBQPesq_contDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"CONTAS"."DATPAG"'
      Size = 10
    end
    object IBQPesq_contVENDE: TIBStringField
      FieldName = 'VENDE'
      Origin = '"CONTAS"."VENDE"'
      Size = 3
    end
    object IBQPesq_contACOMIS: TIBBCDField
      FieldName = 'ACOMIS'
      Origin = '"CONTAS"."ACOMIS"'
      DisplayFormat = '##0'
      Precision = 9
      Size = 2
    end
    object IBQPesq_contCOMISS: TIBBCDField
      FieldName = 'COMISS'
      Origin = '"CONTAS"."COMISS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQPesq_contDATBAX: TIBStringField
      FieldName = 'DATBAX'
      Origin = '"CONTAS"."DATBAX"'
      Size = 10
    end
    object IBQPesq_contOPEROU: TIBStringField
      FieldName = 'OPEROU'
      Origin = '"CONTAS"."OPEROU"'
      Size = 15
    end
    object IBQPesq_contNUMCLI: TIBStringField
      FieldName = 'NUMCLI'
      Origin = '"CONTAS"."NUMCLI"'
      Size = 6
    end
  end
  object IBQVer_resi: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from RESIDOS')
    Left = 802
    Top = 520
    object IBQVer_resiDATMOV: TDateField
      FieldName = 'DATMOV'
      Origin = '"RESIDOS"."DATMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQVer_resiITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"RESIDOS"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_resiNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"RESIDOS"."NUMDOC"'
      Size = 6
    end
    object IBQVer_resiVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"RESIDOS"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DstResido: TDataSource
    DataSet = IBDtsResido
    Left = 614
    Top = 520
  end
  object DsContas: TDataSource
    DataSet = IBDtsContas
    Left = 669
    Top = 576
  end
  object DsPesq_etic: TDataSource
    DataSet = IBQPesq_etic
    Left = 284
    Top = 464
  end
  object DtsPesq_liv: TDataSource
    DataSet = IBQPesq_liv
    Left = 230
    Top = 520
  end
  object DsPesq_for: TDataSource
    DataSet = IBQPesq_for
    Left = 280
    Top = 576
  end
  object DsPesq_per: TDataSource
    DataSet = IBQPesq_per
    Left = 280
    Top = 632
  end
  object DsItemper: TDataSource
    DataSet = IBDtsItemper
    Left = 672
    Top = 632
  end
  object DsPesq_est: TDataSource
    DataSet = IBQPesq_est
    Left = 800
    Top = 464
  end
  object DsPesq_resi: TDataSource
    DataSet = IBQPesq_resi
    Left = 741
    Top = 520
  end
  object DsPesq_cont: TDataSource
    DataSet = IBQPesq_cont
    Left = 804
    Top = 576
  end
  object DsPesq_itper: TDataSource
    DataSet = IBQPesq_itper
    Left = 808
    Top = 632
  end
  object IBQVer_contg: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTAGEM')
    Left = 360
    Top = 688
    object IBQVer_contgDATCONT: TDateField
      FieldName = 'DATCONT'
      Origin = '"CONTAGEM"."DATCONT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQVer_contgTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CONTAGEM"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object IBQVer_contgCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"CONTAGEM"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBQVer_contgGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"CONTAGEM"."GRUPO"'
      Size = 2
    end
    object IBQVer_contgDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CONTAGEM"."DESCRICAO"'
      Size = 40
    end
    object IBQVer_contgINICIAL: TIntegerField
      FieldName = 'INICIAL'
      Origin = '"CONTAGEM"."INICIAL"'
      DisplayFormat = '###0'
    end
    object IBQVer_contgSACOL: TIntegerField
      FieldName = 'SACOL'
      Origin = '"CONTAGEM"."SACOL"'
      DisplayFormat = '###0'
    end
    object IBQVer_contgPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"CONTAGEM"."PRECO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object IBQVer_cont: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTAS')
    Left = 872
    Top = 576
    object IBQVer_contDATEMIS: TDateField
      FieldName = 'DATEMIS'
      Origin = '"CONTAS"."DATEMIS"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQVer_contTIPDOC: TIBStringField
      FieldName = 'TIPDOC'
      Origin = '"CONTAS"."TIPDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQVer_contNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"CONTAS"."NUMDOC"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 8
    end
    object IBQVer_contPARCEL: TIBStringField
      FieldName = 'PARCEL'
      Origin = '"CONTAS"."PARCEL"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 2
    end
    object IBQVer_contHISTOR: TIBStringField
      FieldName = 'HISTOR'
      Origin = '"CONTAS"."HISTOR"'
      Size = 40
    end
    object IBQVer_contOBSERV: TIBStringField
      FieldName = 'OBSERV'
      Origin = '"CONTAS"."OBSERV"'
      Size = 40
    end
    object IBQVer_contVALOR: TIBBCDField
      FieldName = 'VALOR'
      Origin = '"CONTAS"."VALOR"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQVer_contTIPCOB: TIBStringField
      FieldName = 'TIPCOB'
      Origin = '"CONTAS"."TIPCOB"'
      Size = 3
    end
    object IBQVer_contNUMCOB: TIBStringField
      FieldName = 'NUMCOB'
      Origin = '"CONTAS"."NUMCOB"'
      Size = 8
    end
    object IBQVer_contORICOB: TIBStringField
      FieldName = 'ORICOB'
      Origin = '"CONTAS"."ORICOB"'
      Size = 15
    end
    object IBQVer_contDATVENC: TDateField
      FieldName = 'DATVENC'
      Origin = '"CONTAS"."DATVENC"'
    end
    object IBQVer_contSINAL: TIBStringField
      FieldName = 'SINAL'
      Origin = '"CONTAS"."SINAL"'
      Size = 1
    end
    object IBQVer_contSIGLA: TIBStringField
      FieldName = 'SIGLA'
      Origin = '"CONTAS"."SIGLA"'
      Size = 3
    end
    object IBQVer_contSITU: TIBStringField
      FieldName = 'SITU'
      Origin = '"CONTAS"."SITU"'
      Size = 1
    end
    object IBQVer_contDATPAG: TIBStringField
      FieldName = 'DATPAG'
      Origin = '"CONTAS"."DATPAG"'
      Size = 10
    end
    object IBQVer_contVENDE: TIBStringField
      FieldName = 'VENDE'
      Origin = '"CONTAS"."VENDE"'
      Size = 3
    end
    object IBQVer_contACOMIS: TIBBCDField
      FieldName = 'ACOMIS'
      Origin = '"CONTAS"."ACOMIS"'
      DisplayFormat = '##0'
      Precision = 9
      Size = 2
    end
    object IBQVer_contCOMISS: TIBBCDField
      FieldName = 'COMISS'
      Origin = '"CONTAS"."COMISS"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
    object IBQVer_contDATBAX: TIBStringField
      FieldName = 'DATBAX'
      Origin = '"CONTAS"."DATBAX"'
      Size = 10
    end
    object IBQVer_contOPEROU: TIBStringField
      FieldName = 'OPEROU'
      Origin = '"CONTAS"."OPEROU"'
      Size = 15
    end
    object IBQVer_contNUMCLI: TIBStringField
      FieldName = 'NUMCLI'
      Origin = '"CONTAS"."NUMCLI"'
      Size = 6
    end
  end
  object IBQLer_cont: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from CONTAS')
    Left = 936
    Top = 576
  end
  object IBTContag: TIBTable
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    TableName = 'CONTAGEM'
    UniDirectional = False
    Left = 24
    Top = 688
  end
  object IBDtsContag: TIBDataSet
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from CONTAGEM'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  DATCONT = :OLD_DATCONT and'
      '  TIPO = :OLD_TIPO')
    InsertSQL.Strings = (
      'insert into CONTAGEM'
      
        '  (CODIGO, DATCONT, DESCRICAO, GRUPO, INICIAL, PRECO, SACOL, TIP' +
        'O)'
      'values'
      
        '  (:CODIGO, :DATCONT, :DESCRICAO, :GRUPO, :INICIAL, :PRECO, :SAC' +
        'OL, :TIPO)')
    SelectSQL.Strings = (
      'select * from CONTAGEM')
    ModifySQL.Strings = (
      'update CONTAGEM'
      'set'
      '  CODIGO = :CODIGO,'
      '  DATCONT = :DATCONT,'
      '  DESCRICAO = :DESCRICAO,'
      '  GRUPO = :GRUPO,'
      '  INICIAL = :INICIAL,'
      '  PRECO = :PRECO,'
      '  SACOL = :SACOL,'
      '  TIPO = :TIPO'
      'where'
      '  CODIGO = :OLD_CODIGO and'
      '  DATCONT = :OLD_DATCONT and'
      '  TIPO = :OLD_TIPO')
    ParamCheck = True
    UniDirectional = False
    Left = 88
    Top = 688
    object IBDtsContagDATCONT: TDateField
      FieldName = 'DATCONT'
      Origin = '"CONTAGEM"."DATCONT"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBDtsContagTIPO: TIBStringField
      FieldName = 'TIPO'
      Origin = '"CONTAGEM"."TIPO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 1
    end
    object IBDtsContagCODIGO: TIBStringField
      FieldName = 'CODIGO'
      Origin = '"CONTAGEM"."CODIGO"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 4
    end
    object IBDtsContagGRUPO: TIBStringField
      FieldName = 'GRUPO'
      Origin = '"CONTAGEM"."GRUPO"'
      Size = 2
    end
    object IBDtsContagDESCRICAO: TIBStringField
      FieldName = 'DESCRICAO'
      Origin = '"CONTAGEM"."DESCRICAO"'
      Size = 40
    end
    object IBDtsContagINICIAL: TIntegerField
      FieldName = 'INICIAL'
      Origin = '"CONTAGEM"."INICIAL"'
      DisplayFormat = '###0'
    end
    object IBDtsContagSACOL: TIntegerField
      FieldName = 'SACOL'
      Origin = '"CONTAGEM"."SACOL"'
      DisplayFormat = '###0'
    end
    object IBDtsContagPRECO: TIBBCDField
      FieldName = 'PRECO'
      Origin = '"CONTAGEM"."PRECO"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DsContag: TDataSource
    DataSet = IBDtsContag
    Left = 149
    Top = 688
  end
  object DsPesq_contg: TDataSource
    DataSet = IBQPesq_contg
    Left = 288
    Top = 688
  end
  object IBQLer_resi: TIBQuery
    Database = IBDatabase1
    Transaction = IBTransaction1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    SQL.Strings = (
      'select * from RESIDOS')
    Left = 864
    Top = 520
    object IBQLer_resiDATMOV: TDateField
      FieldName = 'DATMOV'
      Origin = '"RESIDOS"."DATMOV"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object IBQLer_resiITEM: TIBStringField
      FieldName = 'ITEM'
      Origin = '"RESIDOS"."ITEM"'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
      Size = 3
    end
    object IBQLer_resiNUMDOC: TIBStringField
      FieldName = 'NUMDOC'
      Origin = '"RESIDOS"."NUMDOC"'
      Size = 6
    end
    object IBQLer_resiVALPAG: TIBBCDField
      FieldName = 'VALPAG'
      Origin = '"RESIDOS"."VALPAG"'
      DisplayFormat = '##,##0.00'
      Precision = 18
      Size = 2
    end
  end
  object DtsLer_contg: TDataSource
    DataSet = IBQLer_contg
    Left = 512
    Top = 688
  end
  object DtsLer_resi: TDataSource
    DataSet = IBQLer_resi
    Left = 928
    Top = 520
  end
  object DtsPedido: TDataSource
    DataSet = IBDtsPedido
    Left = 584
    Top = 688
  end
  object DataSource1: TDataSource
    DataSet = IBDtsPedido
    Left = 32
    Top = 736
  end
  object DataSource2: TDataSource
    DataSet = IBDtsPedido
    Left = 128
    Top = 736
  end
end
