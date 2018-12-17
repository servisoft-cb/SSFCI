unit USel_Produto_FCI;

{$IFDEF FPC}
{$mode objfpc}{$H+}
{$ENDIF}

interface

uses
{$IFNDEF FPC}
  Windows, Messages,
{$ENDIF}
  SysUtils, Variants, Classes, Graphics, Controls, Forms, 
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ACBrUtil, ACBrTXTClass,
  Mask, ToolEdit, RzTabs, NxCollection, RxLookup, RzPanel, UDMFCI, CurrEdit,
  Grids, DBGrids, SMDBGrid, rsDBUtils;

type

  { TFrmSPEDFiscal }

  TfrmSel_Produto_FCI = class(TForm)
    Panel3: TPanel;
    Label11: TLabel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    btnSelProduto: TNxButton;
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    btnTransferir: TNxButton;
    RxDBLookupCombo2: TRxDBLookupCombo;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnTransferirClick(Sender: TObject);
    procedure btnSelProdutoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RxDBLookupCombo1Exit(Sender: TObject);
    procedure RxDBLookupCombo2Exit(Sender: TObject);
    procedure RxDBLookupCombo1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    procedure prc_Consultar;

    { Private declarations }
  public
    fDMFCI: TDMFCI;
    vDtReferencia : TDateTime;
    vData1, vData2 : TDateTime;
    { Public declarations }
  end;

var
  frmSel_Produto_FCI: TfrmSel_Produto_FCI;

implementation

uses uUtilPadrao, DB, SqlExpr, DateUtils, USel_Produto;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}


procedure TfrmSel_Produto_FCI.FormShow(Sender: TObject);
begin
  oDBUtils.SetDataSourceProperties(Self, fDMFCI);
end;

procedure TfrmSel_Produto_FCI.btnTransferirClick(Sender: TObject);
begin
  if MessageDlg('Deseja Transferir os produtos selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMFCI.cdsSel_Produto.First;
  while not fDMFCI.cdsSel_Produto.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      if not fDMFCI.mAuxiliar.Locate('ID_Produto',fDMFCI.cdsSel_ProdutoID.AsInteger,[loCaseInsensitive]) then
      begin
        fDMFCI.mAuxiliar.Insert;
        fDMFCI.mAuxiliarID_Produto.AsInteger := fDMFCI.cdsSel_ProdutoID.AsInteger;
        fDMFCI.mAuxiliarReferencia.AsString  := fDMFCI.cdsSel_ProdutoREFERENCIA.AsString;
        fDMFCI.mAuxiliarNome.AsString        := fDMFCI.cdsSel_ProdutoNOME.AsString;
        fDMFCI.mAuxiliarOrigem.AsString      := fDMFCI.cdsSel_ProdutoORIGEM_PROD.AsString;
        fDMFCI.mAuxiliarNCM.AsString         := fDMFCI.cdsSel_ProdutoNCM.AsString;
        fDMFCI.mAuxiliarCod_Barra.AsString   := fDMFCI.cdsSel_ProdutoCOD_BARRA.AsString;
        fDMFCI.mAuxiliarUnidade.AsString     := fDMFCI.cdsSel_ProdutoUNIDADE.AsString;
        fDMFCI.mAuxiliarVlr_Insumos.AsFloat  := StrToFloat(FormatFloat('0.00',0));
        fDMFCI.mAuxiliarVlr_Vendas.AsFloat   := StrToFloat(FormatFloat('0.00',0));
        //fDMFCI.mAuxiliarMes_Ref.AsInteger    := fDMFCI.cdsSel_ProdutoMES_REF.AsInteger;
        //fDMFCI.mAuxiliarAno_Ref.AsInteger    := fDMFCI.cdsSel_ProdutoANO_REF.AsInteger;
        fDMFCI.mAuxiliarPerc_FCI.AsFloat     := StrToFloat(FormatFloat('0.000',fDMFCI.cdsSel_ProdutoPERC_USADO_FCI.AsFloat));
        if fDMFCI.cdsSel_ProdutoDTREFERENCIA.AsDateTime > 10 then
          fDMFCI.mAuxiliarDtReferencia.AsDateTime := fDMFCI.cdsSel_ProdutoDTREFERENCIA.AsDateTime;
        fDMFCI.mAuxiliarGerar.AsString          := 'N';
        fDMFCI.mAuxiliarCalculado.AsString      := 'N';
        fDMFCI.mAuxiliar.Post;
        
        fDMFCI.prc_Gravar_mMaterial(vFilial,fDMFCI.cdsSel_ProdutoID.AsInteger,vData1,vData2);
      end;
    end;
    fDMFCI.cdsSel_Produto.Next;
  end;

  Close;
end;

procedure TfrmSel_Produto_FCI.btnSelProdutoClick(Sender: TObject);
begin
  prc_Consultar;
end;

procedure TfrmSel_Produto_FCI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  fDMFCI.cdsSel_Produto.Close;
  Action := Cafree;
end;

procedure TfrmSel_Produto_FCI.prc_Consultar;
begin
  fDMFCI.cdsSel_Produto.Close;
  fDMFCI.sdsSel_Produto.CommandText := fDMFCI.ctSel_Produto;
  if RxDBLookupCombo1.Text <> '' then
    fDMFCI.sdsSel_Produto.CommandText := fDMFCI.sdsSel_Produto.CommandText + ' AND P.ID = ' + IntToStr(RxDBLookupCombo1.KeyValue);
  if RxDBLookupCombo2.Text <> '' then
    fDMFCI.sdsSel_Produto.CommandText := fDMFCI.sdsSel_Produto.CommandText + ' AND P.ID = ' + IntToStr(RxDBLookupCombo2.KeyValue);
  fDMFCI.cdsSel_Produto.Open;
end;

procedure TfrmSel_Produto_FCI.RxDBLookupCombo1Exit(Sender: TObject);
begin
  if RxDBLookupCombo1.Text <> '' then
    RxDBLookupCombo2.KeyValue := RxDBLookupCombo1.KeyValue;
end;

procedure TfrmSel_Produto_FCI.RxDBLookupCombo2Exit(Sender: TObject);
begin
  if RxDBLookupCombo2.Text <> '' then
    RxDBLookupCombo1.KeyValue := RxDBLookupCombo2.KeyValue;
end;

procedure TfrmSel_Produto_FCI.RxDBLookupCombo1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (Key = Vk_F2) then
  begin
    if RxDBLookupCombo1.Text <> '' then
      vCodProduto_Pos := RxDBLookupCombo1.KeyValue
    else
    if RxDBLookupCombo2.Text <> '' then
      vCodProduto_Pos := RxDBLookupCombo2.KeyValue;
    frmSel_Produto  := TfrmSel_Produto.Create(Self);
    frmSel_Produto.vTipo_Prod := '';
    frmSel_Produto.ShowModal;
    if vCodProduto_Pos > 0 then
    begin
      RxDBLookupCombo1.KeyValue := vCodProduto_Pos;
      RxDBLookupCombo2.KeyValue := vCodProduto_Pos;
    end;
  end;
end;

end.
