unit UFCI;

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
  Grids, DBGrids, SMDBGrid, DB, SqlExpr, dbXPress, RXDBCtrl;

type

  { TFrmSPEDFiscal }

  TfrmFCI = class(TForm)
    RZPageControlDados: TRzPageControl;
    TS_Gerar: TRzTabSheet;
    Panel3: TPanel;
    RxDBLookupCombo1: TRxDBLookupCombo;
    Label11: TLabel;
    btnSelProduto: TNxButton;
    Panel1: TPanel;
    SMDBGrid1: TSMDBGrid;
    Label13: TLabel;
    DirectoryEdit1: TDirectoryEdit;
    btnGerar: TNxButton;
    btnCalcularFCI: TNxButton;
    btnLimpar: TNxButton;
    Label1: TLabel;
    DateEdit1: TDateEdit;
    Label2: TLabel;
    Panel2: TPanel;
    Shape1: TShape;
    Label3: TLabel;
    Shape2: TShape;
    Label4: TLabel;
    TS_Consultar: TRzTabSheet;
    Panel4: TPanel;
    ComboBox1: TComboBox;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    SMDBGrid2: TSMDBGrid;
    btnConsultar_FCI: TNxButton;
    DateEdit2: TDateEdit;
    DateEdit3: TDateEdit;
    DateEdit4: TDateEdit;
    DateEdit5: TDateEdit;
    Shape3: TShape;
    Label10: TLabel;
    Shape4: TShape;
    Label12: TLabel;
    Shape5: TShape;
    Label14: TLabel;
    btnExcluir: TNxButton;
    procedure FormShow(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSelProdutoClick(Sender: TObject);
    procedure btnCalcularFCIClick(Sender: TObject);
    procedure RxDBLookupCombo1Enter(Sender: TObject);
    procedure DateEdit1Enter(Sender: TObject);
    procedure SMDBGrid1DblClick(Sender: TObject);
    procedure SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnGerarClick(Sender: TObject);
    procedure btnConsultar_FCIClick(Sender: TObject);
    procedure SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
      AFont: TFont; var Background: TColor; Highlight: Boolean);
    procedure btnExcluirClick(Sender: TObject);
  private
    fDMFCI: TDMFCI;
    vVlr_Insumos : Real;
    vVlr_Venda : Real;
    ano,mes,dia : word;
    F: TextFile;
    vQtd_Reg_5020 : Integer;
    vQtd_Reg_Lin : Integer;
    
    function fnc_Valida_Campos(Tipo_Bloco : String = '') : Boolean;

    procedure prc_Le_mMaterial;
    procedure prc_Le_Preco_Venda;
    procedure prc_Calcula_Periodo;

    procedure prc_Bloco_0_Reg_0000;
    procedure prc_Bloco_0_Reg_0001;
    procedure prc_Bloco_0_Reg_0010;
    procedure prc_Bloco_0_Reg_0990;

    procedure prc_Bloco_5_Reg_5001;
    procedure prc_Bloco_5_Reg_5020;
    procedure prc_Bloco_5_Reg_5990;
    procedure prc_Bloco_9_Reg_9001;
    procedure prc_Bloco_9_Reg_9990(Registro : String);
    procedure prc_Bloco_9_Reg_9999;

    procedure prc_Gravar_FCI;
    procedure prc_Gravar_Produto_FCI;
    procedure prc_Consultar_FCI;

    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFCI: TfrmFCI;

implementation

uses uUtilPadrao, rsDBUtils, DateUtils, USel_Produto_FCI,
  UFCI_Mat, VarUtils, DmdDatabase;

{$IFDEF FPC}
{$R *.lfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}


procedure TfrmFCI.FormShow(Sender: TObject);
begin
  fDMFCI := TDMFCI.Create(Self);
  oDBUtils.SetDataSourceProperties(Self, fDMFCI);
  if fDMFCI.cdsFilial.RecordCount = 1 then
    RxDBLookupCombo1.KeyValue := fDMFCI.cdsFilialID.AsInteger;
  fDMFCI.mAuxiliar.EmptyDataSet;
  fDMFCI.mMaterial.EmptyDataSet;
  DirectoryEdit1.Text := fDMFCI.qParametros_FCIENDERECO_ARQ.AsString;
end;

function TfrmFCI.fnc_Valida_Campos(Tipo_Bloco : String = '') : Boolean;
var
  vMsg : String;
begin
  Result := False;
  vMsg   := '';
  if DateEdit1.Date <= 10 then
    vMsg := vMsg + #13 + '*** Data de referência não informada!';
  if RxDBLookupCombo1.Text = '' then
    vMsg := vMsg + #13 + '*** Filial não informada!';
  if trim(vMsg) <> '' then
  begin
    MessageDlg(vMsg, mtError, [mbOk], 0);
    exit;
  end;
  Result := True;
end;

procedure TfrmFCI.btnLimparClick(Sender: TObject);
begin
  if MessageDlg('Deseja limpar os produtos selecionados?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMFCI.mAuxiliar.EmptyDataSet;
  fDMFCI.mMaterial.EmptyDataSet;
end;

procedure TfrmFCI.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := Cafree;
end;

procedure TfrmFCI.btnSelProdutoClick(Sender: TObject);
var
  ffrmSel_Produto_FCI: TfrmSel_Produto_FCI;
begin
  if trim(RxDBLookupCombo1.Text) = '' then
  begin
    MessageDlg('*** Filial não informada!', mtInformation, [mbOk], 0);
    RxDBLookupCombo1.SetFocus;
    exit;
  end;
  if DateEdit1.Date <= 10 then
  begin
    MessageDlg('*** Data de Referência não informada!', mtInformation, [mbOk], 0);
    DateEdit1.SetFocus;
    exit;
  end;
  prc_Calcula_Periodo;

  vFilial := RxDBLookupCombo1.KeyValue;
  ffrmSel_Produto_FCI := TfrmSel_Produto_FCI.Create(self);
  ffrmSel_Produto_FCI.fDMFCI := fDMFCI;
  ffrmSel_Produto_FCI.vDtReferencia := DateEdit1.Date;
  ffrmSel_Produto_FCI.vData1 := EncodeDate(ano,mes,01);
  ffrmSel_Produto_FCI.vData2 := EncodeDate(ano,mes,dia);
  ffrmSel_Produto_FCI.ShowModal;
  FreeAndNil(ffrmSel_Produto_FCI);
end;

procedure TfrmFCI.btnCalcularFCIClick(Sender: TObject);
begin
  if fDMFCI.mAuxiliar.IsEmpty then
  begin
    MessageDlg('*** Não existe Produto selecionado para o cálculo do FCI!', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMFCI.mAuxiliar.First;
  while not fDMFCI.mAuxiliar.Eof do
  begin
    if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
    begin
      prc_Le_mMaterial;
      prc_Le_Preco_Venda;
      fDMFCI.mAuxiliar.Edit;
      fDMFCI.mAuxiliarVlr_Insumos.AsFloat := StrToCurr(FormatCurr('0.00',vVlr_Insumos));
      fDMFCI.mAuxiliarVlr_Vendas.AsFloat  := StrToCurr(FormatCurr('0.00',vVlr_Venda));
      if (StrToFloat(FormatFloat('0.00',vVlr_Venda)) > 0) and (StrToFloat(FormatFloat('0.00',vVlr_Insumos)) > 0) then
        fDMFCI.mAuxiliarPerc_FCI.AsFloat    := StrToCurr(FormatCurr('0.00',(vVlr_Insumos / vVlr_Venda) * 100))
      else
        fDMFCI.mAuxiliarPerc_FCI.AsFloat    := StrToCurr(FormatCurr('0.00',0));
      fDMFCI.mAuxiliar.Post;
    end;
    fDMFCI.mAuxiliar.Next;
  end;
end;

procedure TfrmFCI.RxDBLookupCombo1Enter(Sender: TObject);
begin
  RxDBLookupCombo1.ReadOnly := (fDMFCI.mAuxiliar.RecordCount > 0);
end;

procedure TfrmFCI.DateEdit1Enter(Sender: TObject);
begin
  DateEdit1.ReadOnly := (fDMFCI.mAuxiliar.RecordCount > 0);
end;

procedure TfrmFCI.SMDBGrid1DblClick(Sender: TObject);
var
  ffrmFCI_Mat: TfrmFCI_Mat;
begin
  if (fDMFCI.mAuxiliar.IsEmpty) or (fDMFCI.mAuxiliarID_Produto.AsInteger <= 0) then
  begin
    MessageDlg('*** Não existe produto selecionado para mostrar os insumos!', mtInformation, [mbOk], 0);
    exit;
  end;
  prc_Calcula_Periodo;

  ffrmFCI_Mat := TfrmFCI_Mat.Create(self);
  try
    ffrmFCI_Mat.fDMFCI := fDMFCI;
    ffrmFCI_Mat.vData1 := EncodeDate(ano,mes,01);
    ffrmFCI_Mat.vData2 := EncodeDate(ano,mes,dia);
    ffrmFCI_Mat.vID_Produto_Mat := fDMFCI.mAuxiliarID_Produto.AsInteger;
    ffrmFCI_Mat.ShowModal;
  finally
    begin
      fDMFCI.mMaterial.Filtered := False;
      FreeAndNil(ffrmFCI_Mat);
    end;
  end;
end;

procedure TfrmFCI.prc_Le_mMaterial;
begin
  vVlr_Insumos := 0;
  fDMFCI.mMaterial.Filtered := False;
  fDMFCI.mMaterial.Filter   := 'ID_Produto = ' + IntToStr(fDMFCI.mAuxiliarID_Produto.AsInteger);
  fDMFCI.mMaterial.Filtered := True;
  fDMFCI.mMaterial.First;
  while not fDMFCI.mMaterial.Eof do
  begin
    vVlr_Insumos := StrToCurr(FormatCurr('0.00',vVlr_Insumos + fDMFCI.mMaterialVlr_Usado.AsFloat));
    fDMFCI.mMaterial.Next;
  end;
  fDMFCI.mMaterial.Filtered := False;
end;

procedure TfrmFCI.prc_Le_Preco_Venda;
var
  vData1, vData2 : TDateTime;
begin
  vVlr_Venda := 0;
  prc_Calcula_Periodo;

  vData1 := EncodeDate(ano,mes,01);
  vData2 := EncodeDate(ano,mes,dia);

  fDMFCI.cdsPreco_Venda.Close;
  fDMFCI.sdsPreco_Venda.ParamByName('FILIAL').AsInteger     := RxDBLookupCombo1.KeyValue;
  fDMFCI.sdsPreco_Venda.ParamByName('DATA1').AsDate         := vData1;
  fDMFCI.sdsPreco_Venda.ParamByName('DATA2').AsDate         := vData2;
  fDMFCI.sdsPreco_Venda.ParamByName('ID_PRODUTO').AsInteger := fDMFCI.mAuxiliarID_Produto.AsInteger;
  fDMFCI.cdsPreco_Venda.Open;

  if StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaVLR_VENDA_PEN.AsFloat)) > 0 then
    vVlr_Venda := StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaVLR_VENDA_PEN.AsFloat))
  else
  if StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaVLR_VENDA_NOV.AsFloat)) > 0 then
    vVlr_Venda := StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaVLR_VENDA_NOV.AsFloat))
  else
  if StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaVLR_VENDA_UF.AsFloat)) > 0 then
    vVlr_Venda := StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaVLR_VENDA_UF.AsFloat))
  else
  if StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaPRECO_VENDA.AsFloat)) > 0 then
    vVlr_Venda := StrToCurr(FormatCurr('0.00',fDMFCI.cdsPreco_VendaPRECO_VENDA.AsFloat));
end;

procedure TfrmFCI.SMDBGrid1GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if (StrToCurr(FormatCurr('0.00',fDMFCI.mAuxiliarPerc_FCI.AsFloat)) >= StrToCurr(FormatCurr('0.00',40))) and
     (StrToCurr(FormatCurr('0.00',fDMFCI.mAuxiliarPerc_FCI.AsFloat)) < StrToCurr(FormatCurr('0.00',70))) then
    Background := $0091B5FF
  else
  if (StrToCurr(FormatCurr('0.00',fDMFCI.mAuxiliarPerc_FCI.AsFloat)) >= StrToCurr(FormatCurr('0.00',70))) then
  begin
    Background  := $00FFFFBB;
    aFont.Color := clBlack;
  end;
end;

procedure TfrmFCI.prc_Calcula_Periodo;
begin
  DecodeDate(DateEdit1.Date,ano,mes,dia);
  if (mes = 1) or (mes = 2) then
  begin
    if mes = 1 then
      mes := 11
    else
      mes := 12;
    ano := ano  - 1;
  end
  else
    mes := mes - 2;
  dia := DaysInAMonth(ano,mes);
end;

procedure TfrmFCI.btnGerarClick(Sender: TObject);
const
  vReg9990 : array[1..4] of string = ('0000','0010','5020','G');
var
  vMSGAux : WideString;
  vArquivo : String;
  i : Integer;
begin
  if fDMFCI.mAuxiliar.IsEmpty then
  begin
    MessageDlg('*** Não existe Produto selecionado para o gerar o FCI!', mtInformation, [mbOk], 0);
    exit;
  end;
  if trim(DirectoryEdit1.Text) = '' then
  begin
    MessageDlg('*** Não foi informada a pasta para salvar o arquivo gerado FCI!', mtInformation, [mbOk], 0);
    DirectoryEdit1.SetFocus;
    exit;
  end;
  vArquivo := DirectoryEdit1.Text;
  if copy(vArquivo,Length(vArquivo),1) <> '\' then
    vArquivo := vArquivo + '\';
  vArquivo := vArquivo + 'FCI_' + IntToStr(YearOf(Date)) + '_' + IntToStr(MonthOf(Date)) + '_' + IntToStr(DayOf(Date)) + '.txt';

  vQtd_Reg_5020 := 0;
  vQtd_Reg_Lin  := 0;
  AssignFile(F, vArquivo);
  Rewrite(F);

  try
    prc_Bloco_0_Reg_0000;
    prc_Bloco_0_Reg_0001;
    prc_Bloco_0_Reg_0010;
    prc_Bloco_0_Reg_0990;

    prc_Bloco_5_Reg_5001;

    vMSGAux := '';
    fDMFCI.mAuxiliar.First;
    while not fDMFCI.mAuxiliar.Eof do
    begin
      if (SMDBGrid1.SelectedRows.CurrentRowSelected) then
      begin
        //if StrToCurr(FormatCurr('0.000',fDMFCI.mAuxiliarPerc_FCI.AsFloat)) < 40 then
        //  vMSGAux := vMSGAux + #13 + ' Produto ' + fDMFCI.mAuxiliarReferencia.AsString + ', possui % menor que 40%'
        //else
          prc_Bloco_5_Reg_5020;
      end;
      fDMFCI.mAuxiliar.Next;
    end;
    prc_Bloco_5_Reg_5990;

    prc_Bloco_9_Reg_9001;
    for i := 1 to 4 do
      prc_Bloco_9_Reg_9990(vReg9990[i]);
    prc_Bloco_9_Reg_9999;

    if trim(vMSGAux) <> '' then
      MessageDlg('*** Produto não gerado FCI:  ' + #13 + #13 + vMSGAux, mtInformation, [mbOk], 0);

    if vQtd_Reg_5020 > 0 then
    begin
      prc_Gravar_FCI;
    end;

  finally
    MessageDlg('*** Arquivo ' + vArquivo + ' gerado!', mtConfirmation, [mbOk], 0);
    CloseFile(F);
  end;
end;

procedure TfrmFCI.prc_Bloco_0_Reg_0000;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  0000  - Tam 4
  vTexto1 := '0000';

  //Cnpj do contribuinte  - Tam 14
  vTexto1 := vTexto1 + '|' +  Monta_Numero(fDMFCI.cdsFilialCNPJ_CPF.AsString,0);

  //Nome do contribuinte  - Tam 255
  vTexto1 := vTexto1 + '|' +  fDMFCI.cdsFilialNOME.AsString;

  //Versão do leiaute  - Tam 4
  vTexto1 := vTexto1 + '|' +  fDMFCI.qParametros_FCIVERSAO_LEIAUTE.AsString;
  
  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_0_Reg_0001;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  0001  - Tam 4
  vTexto1 := '0001';

  //Texto padrão em caracteres UTF 8  - Tam 150
  vTexto1 := vTexto1 + '|' + 'Texto em caracteres UTF-8: (dígrafo BR)' + QuotedStr('ção') + ',(dígrafo espanhol-enhe)' +QuotedStr('ñ')+',(trema)'+QuotedStr('Ü')+',(ordinais)'+QuotedStr('ªº')+',(ligamento s+z alemão)'+QuotedStr('ß')+'.';

  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_0_Reg_0010;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  0010  - Tam 4
  vTexto1 := '0010';

  //Cnpj do contribuinte  - Tam 14
  vTexto1 := vTexto1 + '|' +  Monta_Numero(fDMFCI.cdsFilialCNPJ_CPF.AsString,0);

  //Nome do contribuinte  - Tam 255
  vTexto1 := vTexto1 + '|' +  fDMFCI.cdsFilialNOME.AsString;

  //Inscrição Estadual  - Tam 20
  vTexto1 := vTexto1 + '|' +  fDMFCI.cdsFilialINSCR_EST.AsString;
  
  //Endereço  - Tam 20
  vTexto1 := vTexto1 + '|' +  fDMFCI.cdsFilialENDERECO.AsString + ', ' + fDMFCI.cdsFilialNUM_END.AsString;
  if trim(fDMFCI.cdsFilialCOMPLEMENTO_END.AsString) <> '' then
    vTexto1 := vTexto1 + ' - ' + fDMFCI.cdsFilialCOMPLEMENTO_END.AsString;
  if trim(fDMFCI.cdsFilialBAIRRO.AsString) <> '' then
    vTexto1 := vTexto1 + ' - ' + fDMFCI.cdsFilialBAIRRO.AsString;

  //Cep  - Tam 20
  vTexto1 := vTexto1 + '|' + Monta_Numero(fDMFCI.cdsFilialCEP.AsString,0);

  //Cidade  - Tam 255
  vTexto1 := vTexto1 + '|' + fDMFCI.cdsFilialCIDADE.AsString;
  
  //UF  - Tam 2
  vTexto1 := vTexto1 + '|' + fDMFCI.cdsFilialUF.AsString;

  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_0_Reg_0990;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  0990  - Tam 4
  vTexto1 := '0990';

  //Quantidade de registros do Bloco 0  - Tam 2
  vTexto1 := vTexto1 + '|4';
  
  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_5_Reg_5001;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  5001  - Tam 4
  vTexto1 := '5001';

  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_5_Reg_5020;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  5020 - Tam 4
  vTexto1 := '5020';

  //Nome da mercadoria - Tam 255
  vTexto1 := vTexto1 + '|' + fDMFCI.mAuxiliarNome.AsString;

  //NCM  - Tam 8
  vTexto1 := vTexto1 + '|' + Monta_Numero(fDMFCI.mAuxiliarNCM.AsString,0);
  
  //NCM  - Tam 8
  vTexto1 := vTexto1 + '|' + Monta_Numero(fDMFCI.mAuxiliarNCM.AsString,0);

  //Código da Mercadoria  - Tam 50
  vTexto1 := vTexto1 + '|' + fDMFCI.mAuxiliarReferencia.AsString;
  
  //Código GTIN  - Tam 14
  vTexto1 := vTexto1 + '|' + fDMFCI.mAuxiliarCod_Barra.AsString;
  
  //Unidade  - Tam 6
  vTexto1 := vTexto1 + '|' + fDMFCI.mAuxiliarUnidade.AsString;

  //Valor da Saída - Tam 15
  vTexto1 := vTexto1 + '|' + FormatFloat('0.00',fDMFCI.mAuxiliarVlr_Vendas.AsFloat);
  
  //Valor da parcela (insumos) - Tam 15
  vTexto1 := vTexto1 + '|' + FormatFloat('0.00',fDMFCI.mAuxiliarVlr_Insumos.AsFloat);

  //Conteúdo da importação  % FCI - Tam 6
  vTexto1 := vTexto1 + '|' + FormatCurr('0.00',fDMFCI.mAuxiliarPerc_FCI.AsFloat);

  Writeln(F,vTexto1);
  vQtd_Reg_5020 := vQtd_Reg_5020 + 1;
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_5_Reg_5990;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  5990  - Tam 4
  vTexto1 := '5990';

  //Quantidade de linhas  - Tam 6
  vTexto1 := vTexto1 + '|' + IntToStr(vQtd_Reg_5020 + 2);

  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_9_Reg_9001;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  9001  - Tam 4
  vTexto1 := '9001';

  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_9_Reg_9990(Registro : String);
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  9990  - Tam 4
  vTexto1 := '9990';

  //Tipo do registro  fixo  9990  - Tam 4
  if Registro = 'G' then
    vTexto1 := vTexto1 + '|' + IntToStr(vQtd_Reg_5020 + 4)
  else
  begin
    vTexto1 := vTexto1 + '|' + Registro;
    if Registro = '0000' then
      vTexto1 := vTexto1 + '|1'
    else
    if Registro = '0010' then
      vTexto1 := vTexto1 + '|1'
    else
    if Registro = '5020' then
      vTexto1 := vTexto1 + '|' + IntToStr(vQtd_Reg_5020);
  end;
  Writeln(F,vTexto1);
  vQtd_Reg_Lin := vQtd_Reg_Lin + 1;
end;

procedure TfrmFCI.prc_Bloco_9_Reg_9999;
var
  vTexto1 : String;
begin
  //Tipo do registro  fixo  9999  - Tam 4
  vTexto1 := '9999';

  //Quantidade total de linhas  - Tam 8
  vTexto1 := vTexto1 + '|' + IntToStr(vQtd_Reg_Lin + 1);

  Writeln(F,vTexto1);
end;

procedure TfrmFCI.prc_Gravar_FCI;
var
  ID: TTransactionDesc;
begin
  ID.TransactionID  := 1;
  ID.IsolationLevel := xilREADCOMMITTED;
  dmDatabase.scoDados.StartTransaction(ID);
  try
    fDMFCI.prc_Inserir;
    fDMFCI.cdsFCIDTREFERENCIA.AsDateTime := DateEdit1.Date;
    fDMFCI.cdsFCINUM_PROTOCOLO.Clear;

    fDMFCI.cdsProduto_FCI.Close;
    fDMFCI.sdsProduto_FCI.ParamByName('ID_FCI').AsInteger := fDMFCI.cdsFCIID.AsInteger;
    fDMFCI.cdsProduto_FCI.Open;

    fDMFCI.mAuxiliar.First;
    while not fDMFCI.mAuxiliar.Eof do
    begin
      if StrToCurr(FormatCurr('0.000',fDMFCI.mAuxiliarPerc_FCI.AsFloat)) >= 40 then
        prc_Gravar_Produto_FCI;
      fDMFCI.mAuxiliar.Next;
    end;
    fDMFCI.prc_Gravar;
    fDMFCI.cdsProduto_FCI.ApplyUpdates(0);

    dmDatabase.scoDados.Commit(ID);
  except
    on e: Exception do
    begin
      dmDatabase.scoDados.Rollback(ID);
      raise Exception.Create('Erro ao gravar a FCI: ' + #13 + e.Message);
    end;
  end;

end;

procedure TfrmFCI.prc_Gravar_Produto_FCI;
var
  vItemAux : Integer;
begin
  fDMFCI.cdsProduto_FCI.Last;
  vItemAux := fDMFCI.cdsProduto_FCIITEM.AsInteger;

  fDMFCI.cdsProduto_FCI.Insert;
  fDMFCI.cdsProduto_FCIID.AsInteger   := fDMFCI.mAuxiliarID_Produto.AsInteger;
  fDMFCI.cdsProduto_FCIITEM.AsInteger := vItemAux + 1;
  fDMFCI.cdsProduto_FCIDTGERADO.AsDateTime := Date;
  fDMFCI.cdsProduto_FCINUM_FCI.Clear;
  fDMFCI.cdsProduto_FCIPERC_USADO_FCI.AsFloat  := StrToCurr(FormatCurr('0.00',fDMFCI.mAuxiliarPerc_FCI.AsCurrency));
  fDMFCI.cdsProduto_FCIVLR_INSUMOS.AsFloat     := StrToCurr(FormatCurr('0.00',fDMFCI.mAuxiliarVlr_Insumos.AsCurrency));
  fDMFCI.cdsProduto_FCIVLR_VENDAS.AsFloat      := StrToCurr(FormatCurr('0.00',fDMFCI.mAuxiliarVlr_Vendas.AsCurrency));
  fDMFCI.cdsProduto_FCIID_FCI.AsInteger        := fDMFCI.cdsFCIID.AsInteger;
  fDMFCI.cdsProduto_FCIDTREFERENCIA.AsDateTime := DateEdit1.Date;
  fDMFCI.cdsProduto_FCI.Post;
end;

procedure TfrmFCI.btnConsultar_FCIClick(Sender: TObject);
begin
  prc_Consultar_FCI;
end;

procedure TfrmFCI.prc_Consultar_FCI;
var
  vComando : String;
begin
  fDMFCI.cdsConsulta_FCI.Close;
  fDMFCI.sdsConsulta_FCI.CommandText := fDMFCI.ctConsulta_FCI + ' WHERE 0 = 0 ';
  vComando := '';
  case ComboBox1.ItemIndex of
    1 : vComando := ' AND STATUS = ' + QuotedStr('N');
    2 : vComando := ' AND STATUS = ' + QuotedStr('E');
    3 : vComando := ' AND STATUS = ' + QuotedStr('R');
  end;

  if DateEdit2.Date > 10 then
    vComando := vComando + ' AND DTGERADO >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit2.date));
  if DateEdit3.Date > 10 then
    vComando := vComando + ' AND DTGERADO <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit3.date));
  if DateEdit4.Date > 10 then
    vComando := vComando + ' AND DTREFERENCIA >= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit4.date));
  if DateEdit5.Date > 10 then
    vComando := vComando + ' AND DTREFERENCIA <= ' + QuotedStr(FormatDateTime('MM/DD/YYYY',DateEdit5.date));
  fDMFCI.sdsConsulta_FCI.CommandText := fDMFCI.sdsConsulta_FCI.CommandText + vComando;
  fDMFCI.cdsConsulta_FCI.Open;
end;

procedure TfrmFCI.SMDBGrid2GetCellParams(Sender: TObject; Field: TField;
  AFont: TFont; var Background: TColor; Highlight: Boolean);
begin
  if fDMFCI.cdsConsulta_FCI.Active then
  begin
    if fDMFCI.cdsConsulta_FCISTATUS.AsString = 'N' then
    begin
      Background  := $0053FFFF;
      AFont.Color := clBlack;
    end
    else
    if fDMFCI.cdsConsulta_FCISTATUS.AsString = 'E' then
    begin
      Background  := $00AAFFAA;
      AFont.Color := clBlack;
    end;
  end;
end;

procedure TfrmFCI.btnExcluirClick(Sender: TObject);
begin
  if not(fDMFCI.cdsConsulta_FCI.Active) or (fDMFCI.cdsConsulta_FCI.IsEmpty) then
    exit;

  if (not(fDMFCI.cdsConsulta_FCINUM_PROTOCOLO.IsNull)) or (fDMFCI.cdsConsulta_FCISTATUS.AsString = 'E') or (fDMFCI.cdsConsulta_FCISTATUS.AsString = 'R') then
  begin
    MessageDlg('*** FCI já contém um protocolo, não pode ser excluída!', mtInformation, [mbOk], 0);
    exit;
  end;

  if MessageDlg('Deseja excluir a FCI selecionada?',mtConfirmation,[mbYes,mbNo],0) = mrNo then
    exit;

  fDMFCI.prc_Localizar(fDMFCI.cdsConsulta_FCIID.AsInteger);

  if fDMFCI.cdsFCI.IsEmpty then
  begin
    MessageDlg('*** FCI não encontrada para excluir!', mtInformation, [mbOk], 0);
    exit;
  end;

  fDMFCI.prc_Excluir;
end;

end.
