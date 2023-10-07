unit UDMFCI;

interface

uses
  SysUtils, Classes, FMTBcd, DB, SqlExpr, DBClient, Provider, LogTypes, dbXPress;

type
  TDMFCI = class(TDataModule)
    sdsFilial: TSQLDataSet;
    dspFilial: TDataSetProvider;
    cdsFilial: TClientDataSet;
    dsFilial: TDataSource;
    qParametros_FCI: TSQLQuery;
    qParametros_FCIID: TIntegerField;
    qParametros_FCIENDERECO_ARQ: TStringField;
    cdsFilialID: TIntegerField;
    cdsFilialNOME: TStringField;
    cdsFilialNOME_INTERNO: TStringField;
    cdsFilialPESSOA: TStringField;
    cdsFilialCNPJ_CPF: TStringField;
    cdsFilialINSCR_EST: TStringField;
    sdsProduto: TSQLDataSet;
    dspProduto: TDataSetProvider;
    cdsProduto: TClientDataSet;
    dsProduto: TDataSource;
    cdsProdutoID: TIntegerField;
    cdsProdutoREFERENCIA: TStringField;
    cdsProdutoNOME: TStringField;
    cdsProdutoPRECO_VENDA: TFloatField;
    cdsProdutoUNIDADE: TStringField;
    cdsProdutoID_NCM: TIntegerField;
    cdsProdutoNCM: TStringField;
    mAuxiliar: TClientDataSet;
    mAuxiliarID_Produto: TIntegerField;
    mAuxiliarReferencia: TStringField;
    mAuxiliarNome: TStringField;
    mAuxiliarOrigem: TIntegerField;
    mAuxiliarVlr_Insumos: TFloatField;
    mAuxiliarVlr_Vendas: TFloatField;
    mAuxiliarMes_Ref: TIntegerField;
    mAuxiliarAno_Ref: TIntegerField;
    mAuxiliarPerc_FCI: TFloatField;
    mAuxiliarGerar: TStringField;
    dsmAuxiliar: TDataSource;
    sdsSel_Produto: TSQLDataSet;
    dspSel_Produto: TDataSetProvider;
    cdsSel_Produto: TClientDataSet;
    dsSel_Produto: TDataSource;
    cdsSel_ProdutoID: TIntegerField;
    cdsSel_ProdutoREFERENCIA: TStringField;
    cdsSel_ProdutoNOME: TStringField;
    cdsSel_ProdutoORIGEM_PROD: TStringField;
    cdsSel_ProdutoUNIDADE: TStringField;
    cdsSel_ProdutoPRECO_VENDA: TFloatField;
    cdsSel_ProdutoPERC_USADO_FCI: TFloatField;
    mAuxiliarCalculado: TStringField;
    mMaterial: TClientDataSet;
    dsmMaterial: TDataSource;
    mMaterialReferencia: TStringField;
    mMaterialNome: TStringField;
    mMaterialOrigem: TStringField;
    mMaterialVlr_Custo: TFloatField;
    mMaterialPerc_Usado: TFloatField;
    mMaterialVlr_Usado: TFloatField;
    sdsProduto_Consumo: TSQLDataSet;
    dspProduto_Consumo: TDataSetProvider;
    cdsProduto_Consumo: TClientDataSet;
    cdsProduto_ConsumoID: TIntegerField;
    cdsProduto_ConsumoID_MATERIAL: TIntegerField;
    cdsProduto_ConsumoQTD_CONSUMO: TFloatField;
    cdsProduto_ConsumoUNIDADE: TStringField;
    cdsProduto_ConsumoORIGEM_PROD: TStringField;
    cdsProduto_ConsumoPRECO_CUSTO: TFloatField;
    mMaterialID_Produto: TIntegerField;
    mMaterialID_Material: TIntegerField;
    mMaterialQtd_Consumo: TFloatField;
    mMaterialVlr_Consumo: TFloatField;
    cdsProduto_ConsumoREFERENCIA_MAT: TStringField;
    cdsProduto_ConsumoNOME_MAT: TStringField;
    cdsProduto_ConsumoVLR_MEDIO_ANT: TFloatField;
    cdsProduto_ConsumoVLR_MEDIO_PEN: TFloatField;
    cdsProduto_ConsumoVLR_MEDIO_NOV: TFloatField;
    mMaterialVlr_Medio_Ant: TFloatField;
    mMaterialVlr_Medio_Pen: TFloatField;
    mMaterialVlr_Medio_Nov: TFloatField;
    sdsPreco_Venda: TSQLDataSet;
    dspPreco_Venda: TDataSetProvider;
    cdsPreco_Venda: TClientDataSet;
    cdsPreco_VendaID: TIntegerField;
    cdsPreco_VendaREFERENCIA: TStringField;
    cdsPreco_VendaPRECO_VENDA: TFloatField;
    cdsPreco_VendaVLR_VENDA_PEN: TFloatField;
    cdsPreco_VendaVLR_VENDA_NOV: TFloatField;
    cdsPreco_VendaVLR_VENDA_UF: TFloatField;
    mAuxiliarDtReferencia: TDateField;
    cdsSel_ProdutoDTREFERENCIA: TDateField;
    qParametros_FCIVERSAO_LEIAUTE: TStringField;
    cdsFilialENDERECO: TStringField;
    cdsFilialCOMPLEMENTO_END: TStringField;
    cdsFilialNUM_END: TStringField;
    cdsFilialBAIRRO: TStringField;
    cdsFilialCEP: TStringField;
    cdsFilialCIDADE: TStringField;
    cdsFilialUF: TStringField;
    mAuxiliarNCM: TStringField;
    mAuxiliarCod_Barra: TStringField;
    cdsSel_ProdutoCOD_BARRA: TStringField;
    cdsSel_ProdutoNCM: TStringField;
    mAuxiliarUnidade: TStringField;
    sdsFCI: TSQLDataSet;
    dspFCI: TDataSetProvider;
    cdsFCI: TClientDataSet;
    dsFCI: TDataSource;
    sdsFCIID: TIntegerField;
    sdsFCIDTGERADO: TDateField;
    sdsFCINUM_PROTOCOLO: TStringField;
    sdsFCIDTREFERENCIA: TDateField;
    sdsFCISTATUS: TStringField;
    cdsFCIID: TIntegerField;
    cdsFCIDTGERADO: TDateField;
    cdsFCINUM_PROTOCOLO: TStringField;
    cdsFCIDTREFERENCIA: TDateField;
    cdsFCISTATUS: TStringField;
    sdsProduto_FCI: TSQLDataSet;
    dspProduto_FCI: TDataSetProvider;
    cdsProduto_FCI: TClientDataSet;
    dsProduto_FCI: TDataSource;
    sdsProduto_FCIID: TIntegerField;
    sdsProduto_FCIITEM: TIntegerField;
    sdsProduto_FCIDTGERADO: TDateField;
    sdsProduto_FCINUM_FCI: TStringField;
    sdsProduto_FCIPERC_USADO_FCI: TFloatField;
    sdsProduto_FCIVLR_INSUMOS: TFloatField;
    sdsProduto_FCIVLR_VENDAS: TFloatField;
    sdsProduto_FCIID_FCI: TIntegerField;
    sdsProduto_FCIDTREFERENCIA: TDateField;
    cdsProduto_FCIID: TIntegerField;
    cdsProduto_FCIITEM: TIntegerField;
    cdsProduto_FCIDTGERADO: TDateField;
    cdsProduto_FCINUM_FCI: TStringField;
    cdsProduto_FCIPERC_USADO_FCI: TFloatField;
    cdsProduto_FCIVLR_INSUMOS: TFloatField;
    cdsProduto_FCIVLR_VENDAS: TFloatField;
    cdsProduto_FCIID_FCI: TIntegerField;
    cdsProduto_FCIDTREFERENCIA: TDateField;
    sdsConsulta_FCI: TSQLDataSet;
    dspConsulta_FCI: TDataSetProvider;
    cdsConsulta_FCI: TClientDataSet;
    dsConsulta_FCI: TDataSource;
    cdsConsulta_FCIID: TIntegerField;
    cdsConsulta_FCIDTGERADO: TDateField;
    cdsConsulta_FCINUM_PROTOCOLO: TStringField;
    cdsConsulta_FCIDTREFERENCIA: TDateField;
    cdsConsulta_FCISTATUS: TStringField;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
    procedure DoLogAdditionalValues(ATableName: string; var AValues: TArrayLogData; var UserName: string);
  public
    { Public declarations }
    ctCommand : String;
    ctSel_Produto : String;
    ctConsulta_FCI : String;

    procedure prc_Gravar_mMaterial(Filial,ID_Produto : Integer ; Data1, Data2 : TDateTime);

    procedure prc_Localizar(ID: Integer); //-1 = Inclusão
    procedure prc_Inserir;
    procedure prc_Gravar;
    procedure prc_Excluir;

  end;

var
  DMFCI: TDMFCI;

implementation

uses DmdDatabase, LogProvider, uUtilPadrao;

{$R *.dfm}

procedure TDMFCI.DataModuleCreate(Sender: TObject);
var
  i, x: Integer;
  vIndices: string;
  aIndices: array of string;
begin
  ctCommand      := sdsFCI.CommandText;
  ctSel_Produto  := sdsSel_Produto.CommandText;
  ctConsulta_FCI := sdsConsulta_FCI.CommandText;

  qParametros_FCI.Open;
  cdsFilial.Open;
  cdsProduto.Open;

  LogProviderList.OnAdditionalValues := DoLogAdditionalValues;
  for i := 0 to (Self.ComponentCount - 1) do
  begin
    if (Self.Components[i] is TClientDataSet) then
    begin
      SetLength(aIndices, 0);
      vIndices := TClientDataSet(Components[i]).IndexFieldNames;
      while (vIndices <> EmptyStr) do
      begin
        SetLength(aIndices, Length(aIndices) + 1);
        x := Pos(';', vIndices);
        if (x = 0) then
        begin
          aIndices[Length(aIndices) - 1] := vIndices;
          vIndices := EmptyStr;
        end
        else
        begin
          aIndices[Length(aIndices) - 1] := Copy(vIndices, 1, x - 1);
          vIndices := Copy(vIndices, x + 1, MaxInt);
        end;
      end;
      LogProviderList.AddProvider(TClientDataSet(Self.Components[i]), TClientDataSet(Self.Components[i]).Name, aIndices);
    end;
  end;
end;

procedure TDMFCI.prc_Gravar_mMaterial(Filial,ID_Produto : Integer ; Data1, Data2 : TDateTime);
var
  vAux : Real;
begin
  cdsProduto_Consumo.Close;
  sdsProduto_Consumo.ParamByName('FILIAL').AsInteger     := Filial;
  sdsProduto_Consumo.ParamByName('ID_PRODUTO').AsInteger := ID_Produto;
  sdsProduto_Consumo.ParamByName('DATA1').AsDate         := Data1;
  sdsProduto_Consumo.ParamByName('DATA2').AsDate         := Data2;
  cdsProduto_Consumo.Open;
  cdsProduto_Consumo.First;
  while not cdsProduto_Consumo.Eof do
  begin
    mMaterial.Insert;
    mMaterialID_Produto.AsInteger  := cdsProduto_ConsumoID.AsInteger;
    mMaterialID_Material.AsInteger := cdsProduto_ConsumoID_MATERIAL.AsInteger;
    mMaterialReferencia.AsString   := cdsProduto_ConsumoREFERENCIA_MAT.AsString;
    mMaterialNome.AsString         := cdsProduto_ConsumoNOME_MAT.AsString;
    mMaterialOrigem.AsString       := cdsProduto_ConsumoORIGEM_PROD.AsString;
    if StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_PEN.AsFloat)) > 0 then
      mMaterialVlr_Custo.AsFloat     := StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_PEN.AsFloat))
    else
    if StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_ANT.AsFloat)) > 0 then
      mMaterialVlr_Custo.AsFloat     := StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_ANT.AsFloat))
    else
    if StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_NOV.AsFloat)) > 0 then
      mMaterialVlr_Custo.AsFloat     := StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_NOV.AsFloat))
    else
      mMaterialVlr_Custo.AsFloat     := StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoPRECO_CUSTO.AsFloat));
    if (mMaterialOrigem.AsString = '8') or (mMaterialOrigem.AsString = '1') or (mMaterialOrigem.AsString = '2') then
      mMaterialPerc_Usado.AsFloat := StrToCurr(FormatCurr('0.00',100))
    else
    if (mMaterialOrigem.AsString = '3') then
      mMaterialPerc_Usado.AsFloat := StrToCurr(FormatCurr('0.00',50))
    else
      mMaterialPerc_Usado.AsFloat := StrToCurr(FormatCurr('0.00',0));
    mMaterialQtd_Consumo.AsFloat := StrToCurr(FormatCurr('0.0000',cdsProduto_ConsumoQTD_CONSUMO.AsFloat));
    mMaterialVlr_Consumo.AsFloat := StrToCurr(FormatCurr('0.000',mMaterialVlr_Custo.AsFloat * mMaterialQtd_Consumo.AsFloat));
    if mMaterialPerc_Usado.AsFloat = StrToCurr(FormatCurr('0.00',100)) then
      mMaterialVlr_Usado.AsFloat   := StrToCurr(FormatCurr('0.00',mMaterialVlr_Consumo.AsFloat))
    else
    if mMaterialPerc_Usado.AsFloat = StrToCurr(FormatCurr('0.00',50)) then
      mMaterialVlr_Usado.AsFloat   := StrToCurr(FormatCurr('0.00',mMaterialVlr_Consumo.AsFloat / 2))
    else
      mMaterialVlr_Usado.AsFloat   := StrToCurr(FormatCurr('0.00',0));
    mMaterialVlr_Medio_Ant.AsFloat := StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_ANT.AsFloat));
    mMaterialVlr_Medio_Pen.AsFloat := StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_PEN.AsFloat));
    mMaterialVlr_Medio_Nov.AsFloat := StrToCurr(FormatCurr('0.000',cdsProduto_ConsumoVLR_MEDIO_NOV.AsFloat));
    mMaterial.Post;
    cdsProduto_Consumo.Next;
  end;
end;

procedure TDMFCI.DoLogAdditionalValues(ATableName: string;
  var AValues: TArrayLogData; var UserName: string);
begin
  UserName := vUsuario;
end;

procedure TDMFCI.prc_Excluir;
var
  ID: TTransactionDesc;
begin
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    cdsProduto_FCI.Close;
    sdsProduto_FCI.ParamByName('ID_FCI').AsInteger := cdsFCIID.AsInteger;
    cdsProduto_FCI.Open;
    cdsProduto_FCI.First;
    while not cdsProduto_FCI.Eof do
      cdsProduto_FCI.Delete;
    cdsProduto_FCI.ApplyUpdates(0);
    cdsFCI.Delete;
    cdsFCI.ApplyUpdates(0);
    dmDatabase.scoDados.Commit(ID);
  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao excluir a FCI: ' + #13 + e.Message);
    end;
  end;
end;

procedure TDMFCI.prc_Gravar;
begin
  cdsFCI.Post;
  cdsFCI.ApplyUpdates(0);
end;

procedure TDMFCI.prc_Inserir;
var
  vAux: Integer;
begin
  if not cdsFCI.Active then
    prc_Localizar(-1);
  vAux := dmDatabase.ProximaSequencia('FCI',0);

  cdsFCI.Insert;
  cdsFCIID.AsInteger        := vAux;
  cdsFCISTATUS.AsString     := 'N';
  cdsFCIDTGERADO.AsDateTime := Date;
end;

procedure TDMFCI.prc_Localizar(ID: Integer);
begin
  cdsFCI.Close;
  sdsFCI.CommandText := ctCommand;
  if ID <> 0 then
    sdsFCI.CommandText := sdsFCI.CommandText + ' WHERE ID = ' + IntToStr(ID);
  cdsFCI.Open;
end;

end.
