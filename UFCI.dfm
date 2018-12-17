object frmFCI: TfrmFCI
  Left = 183
  Top = 70
  Width = 995
  Height = 567
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
  object RZPageControlDados: TRzPageControl
    Left = 0
    Top = 0
    Width = 979
    Height = 529
    ActivePage = TS_Gerar
    ActivePageDefault = TS_Gerar
    Align = alClient
    BackgroundColor = clSilver
    BoldCurrentTab = True
    FlatColor = clGray
    ParentBackgroundColor = False
    TabColors.Shadow = clSilver
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 19
    object TS_Gerar: TRzTabSheet
      Caption = 'Gerar FCI'
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 975
        Height = 58
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Label11: TLabel
          Left = 65
          Top = 19
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Filial:'
        end
        object Label1: TLabel
          Left = 18
          Top = 39
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt.Refer'#234'ncia:'
        end
        object RxDBLookupCombo1: TRxDBLookupCombo
          Left = 91
          Top = 11
          Width = 366
          Height = 21
          DropDownCount = 8
          LookupField = 'ID'
          LookupDisplay = 'NOME'
          LookupSource = DMFCI.dsFilial
          TabOrder = 0
          OnEnter = RxDBLookupCombo1Enter
        end
        object btnSelProduto: TNxButton
          Left = 459
          Top = 26
          Width = 151
          Height = 30
          Caption = 'Selecionar Produtos'
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
        object btnCalcularFCI: TNxButton
          Left = 763
          Top = 26
          Width = 151
          Height = 30
          Caption = 'Calcular % FCI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 2
          Transparent = True
          OnClick = btnCalcularFCIClick
        end
        object btnLimpar: TNxButton
          Left = 611
          Top = 26
          Width = 151
          Height = 30
          Caption = 'Limpar Produtos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 3
          Transparent = True
          OnClick = btnLimparClick
        end
        object DateEdit1: TDateEdit
          Left = 91
          Top = 33
          Width = 121
          Height = 21
          NumGlyphs = 2
          TabOrder = 4
          OnEnter = DateEdit1Enter
        end
      end
      object Panel1: TPanel
        Left = 0
        Top = 471
        Width = 975
        Height = 35
        Align = alBottom
        Color = clSilver
        TabOrder = 1
        object Label13: TLabel
          Left = 10
          Top = 19
          Width = 86
          Height = 13
          Alignment = taRightJustify
          Caption = 'Local para Salvar:'
        end
        object Label2: TLabel
          Left = 752
          Top = 5
          Width = 163
          Height = 26
          Caption = 'Duplo Clique no Produto para'#13#10'mostrar os insumos e Venda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clMaroon
          Font.Height = -11
          Font.Name = 'Tahoma'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DirectoryEdit1: TDirectoryEdit
          Left = 98
          Top = 11
          Width = 366
          Height = 21
          NumGlyphs = 1
          TabOrder = 0
          Text = 'C:\A'
        end
        object btnGerar: TNxButton
          Left = 464
          Top = 2
          Width = 249
          Height = 30
          Caption = 'Gerar FCI dos selecionados'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 1
          Transparent = True
          OnClick = btnGerarClick
        end
      end
      object SMDBGrid1: TSMDBGrid
        Left = 0
        Top = 58
        Width = 975
        Height = 372
        Align = alClient
        Ctl3D = False
        DataSource = DMFCI.dsmAuxiliar
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgMultiSelect]
        ParentCtl3D = False
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        OnDblClick = SMDBGrid1DblClick
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
        ExOptions = [eoCheckBoxSelect, eoDisableDelete, eoDisableInsert, eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        OnGetCellParams = SMDBGrid1GetCellParams
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
            FieldName = 'ID_Produto'
            ReadOnly = True
            Title.Alignment = taCenter
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Referencia'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Nome'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Origem'
            ReadOnly = True
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vlr_Insumos'
            Title.Alignment = taCenter
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Vlr_Vendas'
            Width = 80
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Perc_FCI'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DtReferencia'
            ReadOnly = True
            Title.Alignment = taCenter
            Title.Caption = 'Dt. '#218'ltimo FCI'
            Width = 78
            Visible = True
          end>
      end
      object Panel2: TPanel
        Left = 0
        Top = 430
        Width = 975
        Height = 41
        Align = alBottom
        TabOrder = 3
        object Shape1: TShape
          Left = 8
          Top = 8
          Width = 35
          Height = 19
          Brush.Color = 9549311
        end
        object Label3: TLabel
          Left = 48
          Top = 14
          Width = 91
          Height = 13
          Caption = 'de 40 % at'#233' 69,99'
        end
        object Shape2: TShape
          Left = 160
          Top = 8
          Width = 35
          Height = 19
          Brush.Color = 16777147
        end
        object Label4: TLabel
          Left = 200
          Top = 14
          Width = 81
          Height = 13
          Caption = 'de 70 % at'#233' 100'
        end
      end
    end
    object TS_Consultar: TRzTabSheet
      Caption = 'Consulta FCI'
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 975
        Height = 72
        Align = alTop
        Color = clSilver
        TabOrder = 0
        object Label5: TLabel
          Left = 73
          Top = 13
          Width = 35
          Height = 13
          Caption = 'Op'#231#227'o:'
        end
        object Label6: TLabel
          Left = 24
          Top = 34
          Width = 84
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt.Gerado Inicial:'
        end
        object Label7: TLabel
          Left = 226
          Top = 34
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Final:'
        end
        object Label8: TLabel
          Left = 7
          Top = 55
          Width = 101
          Height = 13
          Alignment = taRightJustify
          Caption = 'Dt.Refer'#234'ncia Inicial:'
        end
        object Label9: TLabel
          Left = 226
          Top = 55
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Final:'
        end
        object Shape3: TShape
          Left = 696
          Top = 13
          Width = 35
          Height = 19
          Brush.Color = 5505023
        end
        object Label10: TLabel
          Left = 736
          Top = 19
          Width = 60
          Height = 13
          Caption = 'N'#227'o enviado'
        end
        object Shape4: TShape
          Left = 696
          Top = 31
          Width = 35
          Height = 19
          Brush.Color = 11206570
        end
        object Label12: TLabel
          Left = 736
          Top = 37
          Width = 98
          Height = 13
          Caption = 'Aguardando retorno'
        end
        object Shape5: TShape
          Left = 696
          Top = 49
          Width = 35
          Height = 19
          Brush.Color = clWindow
        end
        object Label14: TLabel
          Left = 736
          Top = 55
          Width = 53
          Height = 13
          Caption = 'Retorno ok'
        end
        object ComboBox1: TComboBox
          Left = 110
          Top = 5
          Width = 249
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Todos'
            'N'#227'o Enviado'
            'Enviado'
            'Retorno ok')
        end
        object btnConsultar_FCI: TNxButton
          Left = 361
          Top = 38
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
          OnClick = btnConsultar_FCIClick
        end
        object DateEdit2: TDateEdit
          Left = 110
          Top = 26
          Width = 105
          Height = 21
          NumGlyphs = 2
          TabOrder = 2
        end
        object DateEdit3: TDateEdit
          Left = 254
          Top = 26
          Width = 105
          Height = 21
          NumGlyphs = 2
          TabOrder = 3
        end
        object DateEdit4: TDateEdit
          Left = 110
          Top = 47
          Width = 105
          Height = 21
          NumGlyphs = 2
          TabOrder = 4
        end
        object DateEdit5: TDateEdit
          Left = 254
          Top = 47
          Width = 105
          Height = 21
          NumGlyphs = 2
          TabOrder = 5
        end
        object btnExcluir: TNxButton
          Left = 512
          Top = 38
          Width = 151
          Height = 30
          Caption = 'Excluir FCI'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          GlyphSpacing = 5
          ParentFont = False
          TabOrder = 6
          Transparent = True
          OnClick = btnExcluirClick
        end
      end
      object SMDBGrid2: TSMDBGrid
        Left = 0
        Top = 72
        Width = 975
        Height = 434
        Align = alClient
        DataSource = DMFCI.dsConsulta_FCI
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
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
        ExOptions = [eoENTERlikeTAB, eoKeepSelection, eoStandardPopup, eoBLOBEditor, eoTitleWordWrap]
        OnGetCellParams = SMDBGrid2GetCellParams
        RegistryKey = 'Software\Scalabium'
        RegistrySection = 'SMDBGrid'
        WidthOfIndicator = 11
        DefaultRowHeight = 17
        ScrollBars = ssHorizontal
        ColCount = 6
        RowCount = 2
        Columns = <
          item
            Expanded = False
            FieldName = 'ID'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTGERADO'
            Width = 75
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_PROTOCOLO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DTREFERENCIA'
            Width = 87
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'STATUS'
            Width = 68
            Visible = True
          end>
      end
    end
  end
end
