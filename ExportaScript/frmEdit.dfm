object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Editor de registro'
  ClientHeight = 417
  ClientWidth = 719
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  DesignSize = (
    719
    417)
  PixelsPerInch = 96
  TextHeight = 13
  object BitBtn1: TBitBtn
    Left = 544
    Top = 386
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 0
    OnClick = BitBtn1Click
  end
  object BitBtn2: TBitBtn
    Left = 640
    Top = 386
    Width = 75
    Height = 25
    Anchors = [akRight, akBottom]
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 1
    OnClick = BitBtn2Click
  end
  object cxDBVerticalGrid1: TcxDBVerticalGrid
    Left = 0
    Top = 0
    Width = 719
    Height = 361
    Align = alTop
    OptionsView.ShowEditButtons = ecsbFocused
    OptionsView.CategoryExplorerStyle = True
    OptionsView.RowHeaderWidth = 142
    OptionsView.MultiRecordEvenOddContentStyle = mrcsByRecord
    OptionsBehavior.RowSizing = True
    OptionsBehavior.NavigatorHints = True
    OptionsData.Appending = False
    OptionsData.Deleting = False
    OptionsData.DeletingConfirmation = False
    OptionsData.Inserting = False
    Navigator.Buttons.CustomButtons = <>
    Styles.Content = cxStyle2
    Styles.Category = cxStyle1
    Styles.ContentEven = cxStyle2
    Styles.Header = cxStyle1
    TabOrder = 2
    DataController.DataSource = DM.DSParametroEdit
    DataController.GridMode = True
    Version = 1
    object cxDBVerticalGrid1PERSONAL_SELECT: TcxDBEditorRow
      Properties.Caption = 'Pers. Slelect'
      Properties.DataBinding.FieldName = 'PERSONAL_SELECT'
      ID = 0
      ParentID = -1
      Index = 0
      Version = 1
    end
    object cxDBVerticalGrid1ACEITA_NULL: TcxDBEditorRow
      Properties.Caption = 'Aceita Null ?'
      Properties.DataBinding.FieldName = 'ACEITA_NULL'
      Properties.Options.Editing = False
      ID = 1
      ParentID = -1
      Index = 1
      Version = 1
    end
    object cxDBVerticalGrid1RETIRAR_ACENTOS: TcxDBEditorRow
      Properties.Caption = 'Ret. Acentos ?'
      Properties.DataBinding.FieldName = 'RETIRAR_ACENTOS'
      ID = 2
      ParentID = -1
      Index = 2
      Version = 1
    end
    object cxDBVerticalGrid1FILTRAR_CARACTERES: TcxDBEditorRow
      Properties.Caption = 'Filtra Caracteres'
      Properties.DataBinding.FieldName = 'FILTRAR_CARACTERES'
      ID = 3
      ParentID = -1
      Index = 3
      Version = 1
    end
    object cxDBVerticalGrid1USAR_COMO_WHERE: TcxDBEditorRow
      Properties.Caption = 'Usar como Where'
      Properties.DataBinding.FieldName = 'USAR_COMO_WHERE'
      ID = 4
      ParentID = -1
      Index = 4
      Version = 1
    end
    object cxDBVerticalGrid1CONVETER_MAIUSCULO: TcxDBEditorRow
      Properties.Caption = 'Maiusculo ?'
      Properties.DataBinding.FieldName = 'CONVETER_MAIUSCULO'
      ID = 5
      ParentID = -1
      Index = 5
      Version = 1
    end
    object cxDBVerticalGrid1AJUSTAR_TAMANHO: TcxDBEditorRow
      Properties.Caption = 'Ajustar Tamanho'
      Properties.DataBinding.FieldName = 'AJUSTAR_TAMANHO'
      ID = 6
      ParentID = -1
      Index = 6
      Version = 1
    end
    object cxDBVerticalGrid1COMPORCHAVEDEFAULT: TcxDBEditorRow
      Properties.Caption = 'Usar Chave Default'
      Properties.DataBinding.FieldName = 'COMPORCHAVEDEFAULT'
      ID = 7
      ParentID = -1
      Index = 7
      Version = 1
    end
    object cxDBVerticalGrid1GERAR_VALOR: TcxDBEditorRow
      Properties.Caption = 'Gerar Val.'
      Properties.DataBinding.FieldName = 'GERAR_VALOR'
      ID = 8
      ParentID = -1
      Index = 8
      Version = 1
    end
    object cxDBVerticalGrid1RTFTOTEXT: TcxDBEditorRow
      Properties.Caption = 'Rtf para Texto'
      Properties.DataBinding.FieldName = 'RTFTOTEXT'
      ID = 24
      ParentID = -1
      Index = 9
      Version = 1
    end
    object cxDBVerticalGrid1_SQL: TcxDBEditorRow
      Properties.Caption = 'Sql'
      Properties.DataBinding.FieldName = '_SQL'
      ID = 9
      ParentID = -1
      Index = 10
      Version = 1
    end
    object cxDBVerticalGrid1SEQUENCIA: TcxDBEditorRow
      Properties.Caption = 'Sequencia'
      Properties.DataBinding.FieldName = 'SEQUENCIA'
      Properties.Options.Editing = False
      ID = 10
      ParentID = -1
      Index = 11
      Version = 1
    end
    object cxDBVerticalGrid1TCAMPO: TcxDBEditorRow
      Properties.Caption = 'Tipo de Campo'
      Properties.EditPropertiesClassName = 'TcxComboBoxProperties'
      Properties.EditProperties.Items.Strings = (
        'DEF'
        'CRA'
        'NOR')
      Properties.DataBinding.FieldName = 'TCAMPO'
      ID = 11
      ParentID = -1
      Index = 12
      Version = 1
    end
    object cxDBVerticalGrid1ORDEM_EXEC: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'ORDEM_EXEC'
      Properties.Options.Editing = False
      Visible = False
      ID = 12
      ParentID = -1
      Index = 13
      Version = 1
    end
    object cxDBVerticalGrid1PERS_SELECT_WHERE: TcxDBEditorRow
      Properties.DataBinding.FieldName = 'PERS_SELECT_WHERE'
      Visible = False
      ID = 13
      ParentID = -1
      Index = 14
      Version = 1
    end
    object cxDBVerticalGrid1CARACTERES_REMOVER: TcxDBEditorRow
      Properties.Caption = 'Remover Caracteres'
      Properties.DataBinding.FieldName = 'CARACTERES_REMOVER'
      ID = 14
      ParentID = -1
      Index = 15
      Version = 1
    end
    object cxDBVerticalGrid1VALOR_ORIGEM: TcxDBEditorRow
      Properties.Caption = 'Val. Origem'
      Properties.DataBinding.FieldName = 'VALOR_ORIGEM'
      Properties.Options.Editing = False
      ID = 15
      ParentID = -1
      Index = 16
      Version = 1
    end
    object cxDBVerticalGrid1VALOR_A_CONSIDERAR: TcxDBEditorRow
      Properties.Caption = 'Val. Seq. a Considerar'
      Properties.DataBinding.FieldName = 'VALOR_A_CONSIDERAR'
      ID = 16
      ParentID = -1
      Index = 17
      Version = 1
    end
    object cxDBVerticalGrid1TIPOVALOR_GERAR: TcxDBEditorRow
      Properties.Caption = 'Tipo Valor'
      Properties.DataBinding.FieldName = 'TIPOVALOR_GERAR'
      ID = 17
      ParentID = -1
      Index = 18
      Version = 1
    end
    object cxDBVerticalGrid1CHAVE_PRIMARIA_ORIGEM: TcxDBEditorRow
      Properties.Caption = 'Chave Origem'
      Properties.DataBinding.FieldName = 'CHAVE_PRIMARIA_ORIGEM'
      Properties.Options.Editing = False
      ID = 18
      ParentID = -1
      Index = 19
      Version = 1
    end
    object cxDBVerticalGrid1CHAVE_PRIMARIA_DESTINO: TcxDBEditorRow
      Properties.Caption = 'Chave Destino'
      Properties.DataBinding.FieldName = 'CHAVE_PRIMARIA_DESTINO'
      Properties.Options.Editing = False
      ID = 19
      ParentID = -1
      Index = 20
      Version = 1
    end
    object cxDBVerticalGrid1VALOR_DESTINO: TcxDBEditorRow
      Properties.Caption = 'Val. Destino'
      Properties.DataBinding.FieldName = 'VALOR_DESTINO'
      Properties.Options.Editing = False
      Visible = False
      ID = 20
      ParentID = -1
      Index = 21
      Version = 1
    end
    object cxDBVerticalGrid1DEFAULT_VALOR: TcxDBEditorRow
      Properties.Caption = 'Valor Default'
      Properties.DataBinding.FieldName = 'DEFAULT_VALOR'
      ID = 21
      ParentID = -1
      Index = 22
      Version = 1
    end
    object cxDBVerticalGrid1CAMPO_ORIGEM: TcxDBEditorRow
      Properties.Caption = 'Campo Origem'
      Properties.DataBinding.FieldName = 'CAMPO_ORIGEM'
      ID = 22
      ParentID = -1
      Index = 23
      Version = 1
    end
    object cxDBVerticalGrid1CAMPO_DESTINO: TcxDBEditorRow
      Properties.Caption = 'Campo Destino'
      Properties.DataBinding.FieldName = 'CAMPO_DESTINO'
      ID = 23
      ParentID = -1
      Index = 24
      Version = 1
    end
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 352
    Top = 184
    PixelsPerInch = 96
    object cxStyle1: TcxStyle
      AssignedValues = [svColor, svFont]
      Color = clSilver
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
    end
    object cxGridCardViewStyleSheet1: TcxGridCardViewStyleSheet
      BuiltIn = True
    end
  end
  object cxStyleRepository2: TcxStyleRepository
    PixelsPerInch = 96
    object cxStyle2: TcxStyle
      AssignedValues = [svColor]
      Color = clWindow
    end
  end
end
