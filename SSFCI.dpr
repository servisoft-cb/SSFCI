program SSFCI;

uses
  Forms,
  DmdDatabase in '..\ssfacil\DmdDatabase.pas' {dmDatabase: TDataModule},
  uUtilPadrao in '..\ssfacil\uUtilPadrao.pas',
  UDMFCI in 'UDMFCI.pas' {DMFCI: TDataModule},
  UFCI in 'UFCI.pas' {frmFCI},
  UEscolhe_Filial in '..\ssfacil\UEscolhe_Filial.pas' {frmEscolhe_Filial},
  USel_Produto_FCI in 'USel_Produto_FCI.pas' {frmSel_Produto_FCI},
  USel_Produto in '..\ssfacil\USel_Produto.pas' {frmSel_Produto},
  UFCI_Mat in 'UFCI_Mat.pas' {frmFCI_Mat},
  LogProvider in '..\Logs\src\LogProvider.pas',
  LogTypes in '..\Logs\src\LogTypes.pas',
  rsDBUtils in '..\rslib\nova\rsDBUtils.pas',
  UDMSel_Produto in '..\ssfacil\UDMSel_Produto.pas' {DMSel_Produto: TDataModule},
  USel_Produto_Preco in '..\ssfacil\USel_Produto_Preco.pas' {frmSel_Produto_Preco},
  DmdDatabase_NFeBD in '..\ssfacil\DmdDatabase_NFeBD.pas' {dmDatabase_NFeBD: TDataModule},
  USel_Produto_Lote in '..\ssfacil\PedidoLoja\USel_Produto_Lote.pas' {frmSel_Produto_Lote},
  Classe.Retorno in '..\ssfacil\Classes\Classe.Retorno.pas',
  UInformeEndereco in '..\ssfacil\UInformeEndereco.pas' {frmInformeEndereco};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'SSFCI';
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfrmFCI, frmFCI);
  Application.Run;
end.
