object frmFCI_Mat: TfrmFCI_Mat
  Left = 239
  Top = 178
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Materiais'
  ClientHeight = 442
  ClientWidth = 973
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 0
    Width = 973
    Height = 348
    Align = alClient
    DataSource = DMFCI.dsmMaterial
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Flat = False
    BandsFont.Charset = DEFAULT_CHARSET
    BandsFont.Color = clWindowText
    BandsFont.Height = -11
    BandsFont.Name = 'MS Sans Serif'
    BandsFont.Style = []
    Groupings = <>
    GridStyle.Style = gsCustom
    GridStyle.OddColor = clWindow
    GridStyle.EvenColor = clWindow
    TitleHeight.PixelCount = 24
    FooterColor = clBtnFace
    ExOptions = [eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 11
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 13
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ID_Material'
        ReadOnly = True
        Title.Color = 16777147
        Width = 59
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Referencia'
        ReadOnly = True
        Title.Color = 16777147
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        ReadOnly = True
        Title.Color = 16777147
        Width = 367
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Origem'
        ReadOnly = True
        Title.Color = 16777147
        Width = 41
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Qtd_Consumo'
        ReadOnly = True
        Title.Color = 16777147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Consumo'
        ReadOnly = True
        Title.Color = 16777147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Custo'
        ReadOnly = True
        Title.Color = 16777147
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Perc_Usado'
        ReadOnly = True
        Title.Color = 16777147
        Width = 66
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Usado'
        Title.Color = 16777147
        Width = 78
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Medio_Ant'
        Title.Color = 16777147
        Width = 84
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Medio_Pen'
        Title.Color = 16777147
        Width = 86
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Vlr_Medio_Nov'
        Title.Color = 16777147
        Width = 90
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 348
    Width = 973
    Height = 94
    Align = alBottom
    TabOrder = 1
    object Label1: TLabel
      Left = 416
      Top = 11
      Width = 133
      Height = 13
      Alignment = taRightJustify
      Caption = 'Pre'#231'o Venda (Cad.Produto):'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 395
      Top = 33
      Width = 154
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. M'#233'dio Interestadual (Venda):'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 395
      Top = 55
      Width = 154
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. M'#233'dio Interestadual (Venda):'
      FocusControl = DBEdit3
    end
    object Label4: TLabel
      Left = 427
      Top = 77
      Width = 122
      Height = 13
      Alignment = taRightJustify
      Caption = 'Vlr. M'#233'dio na UF (Venda):'
      FocusControl = DBEdit4
    end
    object DBEdit1: TDBEdit
      Left = 552
      Top = 3
      Width = 134
      Height = 21
      DataField = 'PRECO_VENDA'
      DataSource = DataSource1
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 552
      Top = 25
      Width = 134
      Height = 21
      DataField = 'VLR_VENDA_PEN'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 552
      Top = 47
      Width = 134
      Height = 21
      DataField = 'VLR_VENDA_NOV'
      DataSource = DataSource1
      TabOrder = 2
    end
    object DBEdit4: TDBEdit
      Left = 552
      Top = 69
      Width = 134
      Height = 21
      DataField = 'VLR_VENDA_UF'
      DataSource = DataSource1
      TabOrder = 3
    end
  end
  object DataSource1: TDataSource
    DataSet = DMFCI.cdsPreco_Venda
    Left = 488
    Top = 192
  end
end
