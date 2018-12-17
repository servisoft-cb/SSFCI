unit UFCI_Mat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UDMFCI, Grids, DBGrids, SMDBGrid, ExtCtrls, DB, StdCtrls, Mask,
  DBCtrls;

type
  TfrmFCI_Mat = class(TForm)
    SMDBGrid1: TSMDBGrid;
    Panel1: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
    fDMFCI: TDMFCI;

    vID_Produto_Mat : Integer;
    vData1, vData2 : TDateTime;
    
  end;

var
  frmFCI_Mat: TfrmFCI_Mat;

implementation

uses rsDBUtils;


{$R *.dfm}

procedure TfrmFCI_Mat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  fDMFCI.mMaterial.Filtered := False;
  Action := Cafree;
end;

procedure TfrmFCI_Mat.FormShow(Sender: TObject);
var
  i : Integer;
begin
  oDBUtils.SetDataSourceProperties(Self, fDMFCI);

  for i := 0 to SMDBGrid1.ColCount - 2 do
  begin
    if (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Ant') or (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Pen') or (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Nov') then
    begin
      SMDBGrid1.Columns[i].Visible := False;
      if (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Ant') then
        SMDBGrid1.Columns[i].Title.Caption := 'Vlr. Médio menor que ' + DateToStr(vData1);
      if (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Pen') then
        SMDBGrid1.Columns[i].Title.Caption := 'Vlr. Médio de ' + DateToStr(vData1) + ' até ' + DateToStr(vData2)
      else
      if (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Nov') then
        SMDBGrid1.Columns[i].Title.Caption := 'Vlr. Médio maior que ' + DateToStr(vData2);
    end;
  end;
  Label2.Caption := 'Vlr. Médio Interestadual (Venda) de ' + DateToStr(vData1) + ' até ' + DateToStr(vData2);
  Label3.Caption := 'Vlr. Médio Interestadual (Venda) maior que ' + DateToStr(vData2);
  Label4.Caption := 'Vlr. Médio interno (Venda) maior que ' + DateToStr(vData2);

  fDMFCI.mMaterial.Filtered := False;
  fDMFCI.mMaterial.Filter   := 'ID_Produto = ' + IntToStr(vID_Produto_Mat);
  fDMFCI.mMaterial.Filtered := True;
end;

procedure TfrmFCI_Mat.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  i : Integer;
begin
  if (Shift = [ssCtrl]) and (Key = 87) then //W
  begin
    for i := 0 to SMDBGrid1.ColCount - 2 do
    begin
      if (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Ant') or (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Pen') or (SMDBGrid1.Columns[i].FieldName = 'Vlr_Medio_Nov') then
        SMDBGrid1.Columns[i].Visible := not(SMDBGrid1.Columns[i].Visible);
    end;
  end;
end;

end.
