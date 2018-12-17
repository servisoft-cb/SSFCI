object DMFCI: TDMFCI
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 288
  Top = 131
  Height = 551
  Width = 990
  object sdsFilial: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FILIAL'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 720
    Top = 16
  end
  object dspFilial: TDataSetProvider
    DataSet = sdsFilial
    Left = 768
    Top = 16
  end
  object cdsFilial: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFilial'
    Left = 808
    Top = 16
    object cdsFilialID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFilialNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsFilialNOME_INTERNO: TStringField
      FieldName = 'NOME_INTERNO'
      Size = 30
    end
    object cdsFilialPESSOA: TStringField
      FieldName = 'PESSOA'
      FixedChar = True
      Size = 1
    end
    object cdsFilialCNPJ_CPF: TStringField
      FieldName = 'CNPJ_CPF'
      Size = 18
    end
    object cdsFilialINSCR_EST: TStringField
      FieldName = 'INSCR_EST'
      Size = 18
    end
    object cdsFilialENDERECO: TStringField
      FieldName = 'ENDERECO'
      Size = 60
    end
    object cdsFilialCOMPLEMENTO_END: TStringField
      FieldName = 'COMPLEMENTO_END'
      Size = 60
    end
    object cdsFilialNUM_END: TStringField
      FieldName = 'NUM_END'
      Size = 15
    end
    object cdsFilialBAIRRO: TStringField
      FieldName = 'BAIRRO'
      Size = 30
    end
    object cdsFilialCEP: TStringField
      FieldName = 'CEP'
      Size = 9
    end
    object cdsFilialCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 40
    end
    object cdsFilialUF: TStringField
      FieldName = 'UF'
      Size = 2
    end
  end
  object dsFilial: TDataSource
    DataSet = cdsFilial
    Left = 844
    Top = 16
  end
  object qParametros_FCI: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQL.Strings = (
      'SELECT *'
      'FROM PARAMETROS_FCI')
    SQLConnection = dmDatabase.scoDados
    Left = 568
    Top = 136
    object qParametros_FCIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object qParametros_FCIENDERECO_ARQ: TStringField
      FieldName = 'ENDERECO_ARQ'
      Size = 200
    end
    object qParametros_FCIVERSAO_LEIAUTE: TStringField
      FieldName = 'VERSAO_LEIAUTE'
      Size = 4
    end
  end
  object sdsProduto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.id, P.referencia, P.nome, P.preco_venda, P.unidade, P.i' +
      'd_ncm,'#13#10'NCM.ncm'#13#10'FROM PRODUTO P'#13#10'LEFT JOIN TAB_NCM NCM'#13#10'ON P.id_' +
      'ncm = NCM.id'#13#10'WHERE P.inativo = '#39'N'#39#13#10'  AND ((P.tipo_reg = '#39'P'#39') o' +
      'r (P.tipo_reg = '#39'S'#39'))'#13#10'  AND P.gerar_fci = '#39'S'#39
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 720
    Top = 72
  end
  object dspProduto: TDataSetProvider
    DataSet = sdsProduto
    Left = 768
    Top = 72
  end
  object cdsProduto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto'
    Left = 808
    Top = 72
    object cdsProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsProdutoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object cdsProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProdutoID_NCM: TIntegerField
      FieldName = 'ID_NCM'
    end
    object cdsProdutoNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
  end
  object dsProduto: TDataSource
    DataSet = cdsProduto
    Left = 844
    Top = 72
  end
  object mAuxiliar: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Origem'
        DataType = ftInteger
      end
      item
        Name = 'Vlr_Insumos'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_Vendas'
        DataType = ftFloat
      end
      item
        Name = 'Mes_Ref'
        DataType = ftInteger
      end
      item
        Name = 'Ano_Ref'
        DataType = ftInteger
      end
      item
        Name = 'Perc_FCI'
        DataType = ftFloat
      end
      item
        Name = 'Gerar'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Calculado'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DtReferencia'
        DataType = ftDate
      end
      item
        Name = 'NCM'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'Cod_Barra'
        DataType = ftString
        Size = 14
      end
      item
        Name = 'Unidade'
        DataType = ftString
        Size = 6
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 336
    Data = {
      6B0100009619E0BD01000000180000000F0000000000030000006B010A49445F
      50726F6475746F04000100000000000A5265666572656E636961010049000000
      0100055749445448020002001400044E6F6D6501004900000001000557494454
      48020002003C00064F726967656D04000100000000000B566C725F496E73756D
      6F7308000400000000000A566C725F56656E6461730800040000000000074D65
      735F526566040001000000000007416E6F5F5265660400010000000000085065
      72635F4643490800040000000000054765726172010049000000010005574944
      54480200020001000943616C63756C61646F0100490000000100055749445448
      0200020001000C44745265666572656E6369610400060000000000034E434D01
      00490000000100055749445448020002000C0009436F645F4261727261010049
      0000000100055749445448020002000E0007556E696461646501004900000001
      000557494454480200020006000000}
    object mAuxiliarID_Produto: TIntegerField
      DisplayLabel = 'ID Prod.'
      FieldName = 'ID_Produto'
    end
    object mAuxiliarReferencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'Referencia'
    end
    object mAuxiliarNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object mAuxiliarOrigem: TIntegerField
      DisplayLabel = 'Origem (CST)'
      FieldName = 'Origem'
    end
    object mAuxiliarVlr_Insumos: TFloatField
      DisplayLabel = 'Vlr. Insumos'
      FieldName = 'Vlr_Insumos'
      DisplayFormat = '0.000'
    end
    object mAuxiliarVlr_Vendas: TFloatField
      DisplayLabel = 'Vlr. Vendas'
      FieldName = 'Vlr_Vendas'
      DisplayFormat = '0.000'
    end
    object mAuxiliarMes_Ref: TIntegerField
      DisplayLabel = 'M'#234's Ref'
      FieldName = 'Mes_Ref'
    end
    object mAuxiliarAno_Ref: TIntegerField
      DisplayLabel = 'Ano Ref'
      FieldName = 'Ano_Ref'
    end
    object mAuxiliarPerc_FCI: TFloatField
      DisplayLabel = '% FCI'
      FieldName = 'Perc_FCI'
      DisplayFormat = '0.00'
    end
    object mAuxiliarGerar: TStringField
      FieldName = 'Gerar'
      Size = 1
    end
    object mAuxiliarCalculado: TStringField
      FieldName = 'Calculado'
      Size = 1
    end
    object mAuxiliarDtReferencia: TDateField
      FieldName = 'DtReferencia'
    end
    object mAuxiliarNCM: TStringField
      FieldName = 'NCM'
      Size = 12
    end
    object mAuxiliarCod_Barra: TStringField
      FieldName = 'Cod_Barra'
      Size = 14
    end
    object mAuxiliarUnidade: TStringField
      FieldName = 'Unidade'
      Size = 6
    end
  end
  object dsmAuxiliar: TDataSource
    DataSet = mAuxiliar
    Left = 584
    Top = 336
  end
  object sdsSel_Produto: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID, P.referencia, P.nome, P.origem_prod, P.UNIDADE, P.p' +
      'reco_venda,'#13#10'PF.perc_usado_fci, PF.dtreferencia,'#13#10'p.cod_barra, n' +
      'cm.ncm'#13#10'FROM PRODUTO P'#13#10'left join produto_fci pf'#13#10'on p.id = pf.i' +
      'd'#13#10'left join tab_ncm ncm'#13#10'on p.id_ncm = ncm.id'#13#10'and pf.item = (s' +
      'elect max(item) from produto_fci pf2 where pf2.id = p.id)'#13#10'WHERE' +
      ' P.inativo = '#39'N'#39#13#10'  AND ((P.tipo_reg = '#39'P'#39') or (P.tipo_reg = '#39'S'#39 +
      '))'#13#10'  AND P.gerar_fci = '#39'S'#39#13#10#13#10#13#10#13#10#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 712
    Top = 152
  end
  object dspSel_Produto: TDataSetProvider
    DataSet = sdsSel_Produto
    Left = 760
    Top = 152
  end
  object cdsSel_Produto: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspSel_Produto'
    Left = 800
    Top = 152
    object cdsSel_ProdutoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsSel_ProdutoREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsSel_ProdutoNOME: TStringField
      FieldName = 'NOME'
      Size = 100
    end
    object cdsSel_ProdutoORIGEM_PROD: TStringField
      FieldName = 'ORIGEM_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsSel_ProdutoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsSel_ProdutoPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object cdsSel_ProdutoPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object cdsSel_ProdutoDTREFERENCIA: TDateField
      FieldName = 'DTREFERENCIA'
    end
    object cdsSel_ProdutoCOD_BARRA: TStringField
      FieldName = 'COD_BARRA'
      Size = 14
    end
    object cdsSel_ProdutoNCM: TStringField
      FieldName = 'NCM'
      Size = 10
    end
  end
  object dsSel_Produto: TDataSource
    DataSet = cdsSel_Produto
    Left = 836
    Top = 152
  end
  object mMaterial: TClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'ID_Produto'
        DataType = ftInteger
      end
      item
        Name = 'ID_Material'
        DataType = ftInteger
      end
      item
        Name = 'Referencia'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Nome'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Origem'
        DataType = ftString
        Size = 1
      end
      item
        Name = 'Qtd_Consumo'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_Consumo'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_Custo'
        DataType = ftFloat
      end
      item
        Name = 'Perc_Usado'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_Usado'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_Medio_Ant'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_Medio_Pen'
        DataType = ftFloat
      end
      item
        Name = 'Vlr_Medio_Nov'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 560
    Top = 392
    Data = {
      350100009619E0BD01000000180000000D00000000000300000035010A49445F
      50726F6475746F04000100000000000B49445F4D6174657269616C0400010000
      0000000A5265666572656E636961010049000000010005574944544802000200
      1400044E6F6D650100490000000100055749445448020002003C00064F726967
      656D01004900000001000557494454480200020001000B5174645F436F6E7375
      6D6F08000400000000000B566C725F436F6E73756D6F08000400000000000956
      6C725F437573746F08000400000000000A506572635F557361646F0800040000
      00000009566C725F557361646F08000400000000000D566C725F4D6564696F5F
      416E7408000400000000000D566C725F4D6564696F5F50656E08000400000000
      000D566C725F4D6564696F5F4E6F7608000400000000000000}
    object mMaterialID_Produto: TIntegerField
      DisplayLabel = 'ID Produto'
      FieldName = 'ID_Produto'
    end
    object mMaterialID_Material: TIntegerField
      DisplayLabel = 'ID Material'
      FieldName = 'ID_Material'
    end
    object mMaterialReferencia: TStringField
      DisplayLabel = 'Refer'#234'ncia'
      FieldName = 'Referencia'
    end
    object mMaterialNome: TStringField
      FieldName = 'Nome'
      Size = 60
    end
    object mMaterialOrigem: TStringField
      DisplayLabel = 'Origem (CST)'
      FieldName = 'Origem'
      Size = 1
    end
    object mMaterialQtd_Consumo: TFloatField
      DisplayLabel = 'Qtd. Consumo'
      FieldName = 'Qtd_Consumo'
    end
    object mMaterialVlr_Consumo: TFloatField
      DisplayLabel = 'Vlr. Consumo'
      FieldName = 'Vlr_Consumo'
    end
    object mMaterialVlr_Custo: TFloatField
      DisplayLabel = 'Vlr. M'#233'dio'
      FieldName = 'Vlr_Custo'
    end
    object mMaterialPerc_Usado: TFloatField
      DisplayLabel = '% Usado na Forma'#231#227'o'
      FieldName = 'Perc_Usado'
    end
    object mMaterialVlr_Usado: TFloatField
      DisplayLabel = 'Vlr. Usado na Forma'#231#227'o'
      FieldName = 'Vlr_Usado'
    end
    object mMaterialVlr_Medio_Ant: TFloatField
      FieldName = 'Vlr_Medio_Ant'
    end
    object mMaterialVlr_Medio_Pen: TFloatField
      FieldName = 'Vlr_Medio_Pen'
    end
    object mMaterialVlr_Medio_Nov: TFloatField
      FieldName = 'Vlr_Medio_Nov'
    end
  end
  object dsmMaterial: TDataSource
    DataSet = mMaterial
    Left = 592
    Top = 392
  end
  object sdsProduto_Consumo: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT pc.id, PC.id_material, PC.qtd_consumo, MAT.unidade, MAT.o' +
      'rigem_prod, '#13#10'MAT.preco_custo, MAT.referencia REFERENCIA_MAT, MA' +
      'T.NOME NOME_MAT,'#13#10'    (select COALESCE(SUM(ENT.QTD * ENT.VLR_UNI' +
      'TARIO) / SUM(ENT.QTD),0)'#13#10'      FROM estoque_mov ENT'#13#10'      WHER' +
      'E ENT.tipo_es = '#39'E'#39#13#10'        AND ENT.gerar_custo = '#39'S'#39#13#10'        ' +
      'AND ENT.ID_PRODUTO = PC.id_material'#13#10'        AND ENT.FILIAL = :F' +
      'ILIAL'#13#10'        AND ENT.DTMOVIMENTO < :DATA1) VLR_MEDIO_ANT,'#13#10'   ' +
      ' (select COALESCE(SUM(ENT.QTD * ENT.VLR_UNITARIO) / SUM(ENT.QTD)' +
      ',0)'#13#10'      FROM estoque_mov ENT'#13#10'      WHERE ENT.tipo_es = '#39'E'#39#13#10 +
      '        AND ENT.gerar_custo = '#39'S'#39#13#10'        AND ENT.ID_PRODUTO = ' +
      'PC.id_material'#13#10'        AND ENT.FILIAL = :FILIAL'#13#10'        AND EN' +
      'T.DTMOVIMENTO BETWEEN :DATA1 AND :DATA2) VLR_MEDIO_PEN,'#13#10'    (se' +
      'lect COALESCE(SUM(ENT.QTD * ENT.VLR_UNITARIO) / SUM(ENT.QTD),0)'#13 +
      #10'      FROM estoque_mov ENT'#13#10'      WHERE ENT.tipo_es = '#39'E'#39#13#10'    ' +
      '    AND ENT.gerar_custo = '#39'S'#39#13#10'        AND ENT.ID_PRODUTO = PC.i' +
      'd_material'#13#10'        AND ENT.FILIAL = :FILIAL'#13#10'        AND ENT.DT' +
      'MOVIMENTO > :DATA2) VLR_MEDIO_NOV'#13#10'FROM PRODUTO_CONSUMO PC'#13#10'INNE' +
      'R JOIN PRODUTO MAT'#13#10'ON PC.id_material = MAT.id'#13#10'WHERE PC.id = :I' +
      'D_PRODUTO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 712
    Top = 208
  end
  object dspProduto_Consumo: TDataSetProvider
    DataSet = sdsProduto_Consumo
    Left = 760
    Top = 208
  end
  object cdsProduto_Consumo: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto_Consumo'
    Left = 800
    Top = 208
    object cdsProduto_ConsumoID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProduto_ConsumoID_MATERIAL: TIntegerField
      FieldName = 'ID_MATERIAL'
    end
    object cdsProduto_ConsumoQTD_CONSUMO: TFloatField
      FieldName = 'QTD_CONSUMO'
    end
    object cdsProduto_ConsumoUNIDADE: TStringField
      FieldName = 'UNIDADE'
      Size = 6
    end
    object cdsProduto_ConsumoORIGEM_PROD: TStringField
      FieldName = 'ORIGEM_PROD'
      FixedChar = True
      Size = 1
    end
    object cdsProduto_ConsumoPRECO_CUSTO: TFloatField
      FieldName = 'PRECO_CUSTO'
    end
    object cdsProduto_ConsumoREFERENCIA_MAT: TStringField
      FieldName = 'REFERENCIA_MAT'
    end
    object cdsProduto_ConsumoNOME_MAT: TStringField
      FieldName = 'NOME_MAT'
      Size = 100
    end
    object cdsProduto_ConsumoVLR_MEDIO_ANT: TFloatField
      FieldName = 'VLR_MEDIO_ANT'
    end
    object cdsProduto_ConsumoVLR_MEDIO_PEN: TFloatField
      FieldName = 'VLR_MEDIO_PEN'
    end
    object cdsProduto_ConsumoVLR_MEDIO_NOV: TFloatField
      FieldName = 'VLR_MEDIO_NOV'
    end
  end
  object sdsPreco_Venda: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT P.ID, P.REFERENCIA, P.preco_venda,'#13#10'(select COALESCE(SUM(' +
      'NI.QTD * NI.VLR_UNITARIO) / SUM(NI.QTD),0)'#13#10'      FROM NOTAFISCA' +
      'L_ITENS NI'#13#10'      INNER JOIN notafiscal N'#13#10'      ON NI.ID = N.ID' +
      #13#10'      INNER JOIN TAB_CFOP CFOP'#13#10'      ON NI.ID_CFOP = CFOP.ID'#13 +
      #10'      INNER JOIN PESSOA CLI'#13#10'      ON N.id_cliente = CLI.codigo' +
      #13#10'      INNER JOIN FILIAL FIL'#13#10'      ON N.FILIAL = FIL.ID'#13#10'     ' +
      ' WHERE (N.tipo_reg = '#39'NTS'#39')'#13#10'        AND (N.TIPO_NOTA = '#39'S'#39')'#13#10'  ' +
      '      AND (N.cancelada = '#39'N'#39')'#13#10'        AND (N.nfedenegada = '#39'N'#39')' +
      #13#10'        AND ((CFOP.gerar_duplicata = '#39'S'#39') or (cfop.faturamento' +
      ' = '#39'S'#39'))'#13#10'        AND ((CLI.uf <> FIL.uf) AND (CLI.uf <> '#39'EX'#39'))'#13 +
      #10'        AND (NI.id_produto = P.ID)'#13#10'        AND (N.FILIAL = :FI' +
      'LIAL)'#13#10'        AND (N.dtemissao between :DATA1 AND :DATA2)) VLR_' +
      'VENDA_PEN,'#13#10'(select COALESCE(SUM(NI.QTD * NI.VLR_UNITARIO) / SUM' +
      '(NI.QTD),0)'#13#10'      FROM NOTAFISCAL_ITENS NI'#13#10'      INNER JOIN no' +
      'tafiscal N'#13#10'      ON NI.ID = N.ID'#13#10'      INNER JOIN TAB_CFOP CFO' +
      'P'#13#10'      ON NI.ID_CFOP = CFOP.ID'#13#10'      INNER JOIN PESSOA CLI'#13#10' ' +
      '     ON N.id_cliente = CLI.codigo'#13#10'      INNER JOIN FILIAL FIL'#13#10 +
      '      ON N.FILIAL = FIL.ID'#13#10'      WHERE (N.tipo_reg = '#39'NTS'#39')'#13#10'  ' +
      '      AND (N.TIPO_NOTA = '#39'S'#39')'#13#10'        AND (N.cancelada = '#39'N'#39')'#13#10 +
      '        AND (N.nfedenegada = '#39'N'#39')'#13#10'        AND ((CFOP.gerar_dupl' +
      'icata = '#39'S'#39') or (cfop.faturamento = '#39'S'#39'))'#13#10'        AND ((CLI.uf ' +
      '<> FIL.uf) AND (CLI.uf <> '#39'EX'#39'))'#13#10'        AND (NI.id_produto = P' +
      '.ID)'#13#10'        AND (N.FILIAL = :FILIAL)'#13#10'        AND (N.dtemissao' +
      ' > :DATA2)) VLR_VENDA_NOV,'#13#10'(select COALESCE(SUM(NI.QTD * NI.VLR' +
      '_UNITARIO) / SUM(NI.QTD),0)'#13#10'      FROM NOTAFISCAL_ITENS NI'#13#10'   ' +
      '   INNER JOIN notafiscal N'#13#10'      ON NI.ID = N.ID'#13#10'      INNER J' +
      'OIN TAB_CFOP CFOP'#13#10'      ON NI.ID_CFOP = CFOP.ID'#13#10'      INNER JO' +
      'IN PESSOA CLI'#13#10'      ON N.id_cliente = CLI.codigo'#13#10'      INNER J' +
      'OIN FILIAL FIL'#13#10'      ON N.FILIAL = FIL.ID'#13#10'      WHERE (N.tipo_' +
      'reg = '#39'NTS'#39')'#13#10'        AND (N.TIPO_NOTA = '#39'S'#39')'#13#10'        AND (N.ca' +
      'ncelada = '#39'N'#39')'#13#10'        AND (N.nfedenegada = '#39'N'#39')'#13#10'        AND (' +
      '(CFOP.gerar_duplicata = '#39'S'#39') or (cfop.faturamento = '#39'S'#39'))'#13#10'     ' +
      '   AND (CLI.uf = FIL.uf)'#13#10'        AND (NI.id_produto = P.ID)'#13#10'  ' +
      '      AND (N.FILIAL = :FILIAL)'#13#10'        AND (N.dtemissao > :DATA' +
      '2)) VLR_VENDA_UF'#13#10'FROM PRODUTO P'#13#10'WHERE P.id = :ID_PRODUTO'#13#10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA1'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FILIAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATA2'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'ID_PRODUTO'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 712
    Top = 264
  end
  object dspPreco_Venda: TDataSetProvider
    DataSet = sdsPreco_Venda
    Left = 760
    Top = 264
  end
  object cdsPreco_Venda: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspPreco_Venda'
    Left = 800
    Top = 264
    object cdsPreco_VendaID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsPreco_VendaREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
    end
    object cdsPreco_VendaPRECO_VENDA: TFloatField
      FieldName = 'PRECO_VENDA'
    end
    object cdsPreco_VendaVLR_VENDA_PEN: TFloatField
      FieldName = 'VLR_VENDA_PEN'
    end
    object cdsPreco_VendaVLR_VENDA_NOV: TFloatField
      FieldName = 'VLR_VENDA_NOV'
    end
    object cdsPreco_VendaVLR_VENDA_UF: TFloatField
      FieldName = 'VLR_VENDA_UF'
    end
  end
  object sdsFCI: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FCI'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 16
    object sdsFCIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsFCIDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object sdsFCINUM_PROTOCOLO: TStringField
      FieldName = 'NUM_PROTOCOLO'
      Size = 50
    end
    object sdsFCIDTREFERENCIA: TDateField
      FieldName = 'DTREFERENCIA'
    end
    object sdsFCISTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dspFCI: TDataSetProvider
    DataSet = sdsFCI
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 16
  end
  object cdsFCI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspFCI'
    Left = 152
    Top = 16
    object cdsFCIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsFCIDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object cdsFCINUM_PROTOCOLO: TStringField
      FieldName = 'NUM_PROTOCOLO'
      Size = 50
    end
    object cdsFCIDTREFERENCIA: TDateField
      FieldName = 'DTREFERENCIA'
    end
    object cdsFCISTATUS: TStringField
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsFCI: TDataSource
    DataSet = cdsFCI
    Left = 200
    Top = 16
  end
  object sdsProduto_FCI: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 
      'SELECT PF.*'#13#10'FROM PRODUTO_FCI PF'#13#10'WHERE PF.id_fci = :ID_FCI'#13#10#13#10#13 +
      #10
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'ID_FCI'
        ParamType = ptInput
      end>
    SQLConnection = dmDatabase.scoDados
    Left = 56
    Top = 72
    object sdsProduto_FCIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object sdsProduto_FCIITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object sdsProduto_FCIDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object sdsProduto_FCINUM_FCI: TStringField
      FieldName = 'NUM_FCI'
      Size = 40
    end
    object sdsProduto_FCIPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object sdsProduto_FCIVLR_INSUMOS: TFloatField
      FieldName = 'VLR_INSUMOS'
    end
    object sdsProduto_FCIVLR_VENDAS: TFloatField
      FieldName = 'VLR_VENDAS'
    end
    object sdsProduto_FCIID_FCI: TIntegerField
      FieldName = 'ID_FCI'
    end
    object sdsProduto_FCIDTREFERENCIA: TDateField
      FieldName = 'DTREFERENCIA'
    end
  end
  object dspProduto_FCI: TDataSetProvider
    DataSet = sdsProduto_FCI
    UpdateMode = upWhereKeyOnly
    Left = 104
    Top = 72
  end
  object cdsProduto_FCI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspProduto_FCI'
    Left = 152
    Top = 72
    object cdsProduto_FCIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsProduto_FCIITEM: TIntegerField
      FieldName = 'ITEM'
      Required = True
    end
    object cdsProduto_FCIDTGERADO: TDateField
      FieldName = 'DTGERADO'
    end
    object cdsProduto_FCINUM_FCI: TStringField
      FieldName = 'NUM_FCI'
      Size = 40
    end
    object cdsProduto_FCIPERC_USADO_FCI: TFloatField
      FieldName = 'PERC_USADO_FCI'
    end
    object cdsProduto_FCIVLR_INSUMOS: TFloatField
      FieldName = 'VLR_INSUMOS'
    end
    object cdsProduto_FCIVLR_VENDAS: TFloatField
      FieldName = 'VLR_VENDAS'
    end
    object cdsProduto_FCIID_FCI: TIntegerField
      FieldName = 'ID_FCI'
    end
    object cdsProduto_FCIDTREFERENCIA: TDateField
      FieldName = 'DTREFERENCIA'
    end
  end
  object dsProduto_FCI: TDataSource
    DataSet = cdsProduto_FCI
    Left = 200
    Top = 72
  end
  object sdsConsulta_FCI: TSQLDataSet
    NoMetadata = True
    GetMetadata = False
    CommandText = 'SELECT *'#13#10'FROM FCI'#13#10
    MaxBlobSize = -1
    Params = <>
    SQLConnection = dmDatabase.scoDados
    Left = 336
    Top = 24
  end
  object dspConsulta_FCI: TDataSetProvider
    DataSet = sdsConsulta_FCI
    UpdateMode = upWhereKeyOnly
    Left = 384
    Top = 24
  end
  object cdsConsulta_FCI: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspConsulta_FCI'
    Left = 432
    Top = 24
    object cdsConsulta_FCIID: TIntegerField
      FieldName = 'ID'
      Required = True
    end
    object cdsConsulta_FCIDTGERADO: TDateField
      DisplayLabel = 'Dt. Gerado'
      FieldName = 'DTGERADO'
    end
    object cdsConsulta_FCINUM_PROTOCOLO: TStringField
      DisplayLabel = 'N'#186' Protocolo'
      FieldName = 'NUM_PROTOCOLO'
      Size = 50
    end
    object cdsConsulta_FCIDTREFERENCIA: TDateField
      DisplayLabel = 'Dt. Refer'#234'ncia'
      FieldName = 'DTREFERENCIA'
    end
    object cdsConsulta_FCISTATUS: TStringField
      DisplayLabel = 'Status'
      FieldName = 'STATUS'
      FixedChar = True
      Size = 1
    end
  end
  object dsConsulta_FCI: TDataSource
    DataSet = cdsConsulta_FCI
    Left = 480
    Top = 24
  end
end
