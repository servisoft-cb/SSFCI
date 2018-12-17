object frmSel_Produto_FCI: TfrmSel_Produto_FCI
  Left = 183
  Top = 129
  Width = 996
  Height = 508
  Caption = 'Gerar FCI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = True
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 980
    Height = 50
    Align = alTop
    Color = clSilver
    TabOrder = 0
    object Label11: TLabel
      Left = 33
      Top = 11
      Width = 56
      Height = 13
      Alignment = taRightJustify
      Caption = 'Refer'#234'ncia:'
    end
    object Label1: TLabel
      Left = 17
      Top = 33
      Width = 72
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome Produto:'
    end
    object RxDBLookupCombo1: TRxDBLookupCombo
      Left = 91
      Top = 3
      Width = 182
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'REFERENCIA'
      LookupSource = DMFCI.dsProduto
      TabOrder = 0
      OnExit = RxDBLookupCombo1Exit
      OnKeyDown = RxDBLookupCombo1KeyDown
    end
    object btnSelProduto: TNxButton
      Left = 443
      Top = 16
      Width = 151
      Height = 30
      Caption = 'Efetuar Pesquisa'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 1
      Transparent = True
      OnClick = btnSelProdutoClick
    end
    object RxDBLookupCombo2: TRxDBLookupCombo
      Left = 91
      Top = 25
      Width = 350
      Height = 21
      DropDownCount = 8
      LookupField = 'ID'
      LookupDisplay = 'NOME'
      LookupSource = DMFCI.dsProduto
      TabOrder = 2
      OnExit = RxDBLookupCombo2Exit
      OnKeyDown = RxDBLookupCombo1KeyDown
    end
  end
  object SMDBGrid1: TSMDBGrid
    Left = 0
    Top = 50
    Width = 980
    Height = 374
    Align = alClient
    Ctl3D = False
    DataSource = DMFCI.dsSel_Produto
    Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
    ParentCtl3D = False
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Flat = True
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
    ExOptions = [eoCheckBoxSelect, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap, eoShowFilterBar]
    RegistryKey = 'Software\Scalabium'
    RegistrySection = 'SMDBGrid'
    WidthOfIndicator = 27
    DefaultRowHeight = 17
    ScrollBars = ssHorizontal
    ColCount = 9
    RowCount = 2
    Columns = <
      item
        Expanded = False
        FieldName = 'ID'
        Title.Alignment = taCenter
        Title.Color = 16777147
        Width = 51
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'REFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Refer'#234'ncia'
        Title.Color = 16777147
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Caption = 'Nome'
        Title.Color = 16777147
        Width = 417
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'ORIGEM_PROD'
        Title.Caption = 'Origem (CST)'
        Title.Color = 16777147
        Width = 37
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'UNIDADE'
        Title.Alignment = taCenter
        Title.Caption = 'Unidade'
        Title.Color = 16777147
        Width = 48
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DTREFERENCIA'
        Title.Alignment = taCenter
        Title.Caption = 'Dt. '#218'ltimo FCI'
        Title.Color = 16777147
        Width = 79
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'PRECO_VENDA'
        Title.Alignment = taCenter
        Title.Caption = 'Pre'#231'o Venda Atual'
        Title.Color = 16777147
        Width = 76
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'PERC_USADO_FCI'
        Title.Alignment = taCenter
        Title.Caption = '% FCI Usado'
        Title.Color = 16777147
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 424
    Width = 980
    Height = 46
    Align = alBottom
    Color = clSilver
    TabOrder = 2
    object btnTransferir: TNxButton
      Left = 8
      Top = 10
      Width = 273
      Height = 30
      Caption = 'Transferir os Produtos selecionados'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      GlyphSpacing = 5
      ParentFont = False
      TabOrder = 0
      Transparent = True
      OnClick = btnTransferirClick
    end
  end
end
