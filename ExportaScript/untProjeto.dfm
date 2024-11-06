object frmProjeto: TfrmProjeto
  Left = 0
  Top = 0
  Caption = 'Configura'#231#245'es do Projeto'
  ClientHeight = 219
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel
    Left = 214
    Top = 0
    Width = 80
    Height = 13
    Caption = 'Nome do Projeto'
    FocusControl = cxDBTextEdit3
  end
  object Label15: TLabel
    Left = 14
    Top = 41
    Width = 95
    Height = 13
    Caption = 'Conex'#227'o de Origem'
    FocusControl = cxDBTextEdit4
  end
  object Label16: TLabel
    Left = 14
    Top = 82
    Width = 97
    Height = 13
    Caption = 'Conex'#227'o de Destino'
    FocusControl = cxDBTextEdit5
  end
  object Label17: TLabel
    Left = 460
    Top = 0
    Width = 23
    Height = 13
    Caption = 'Data'
    FocusControl = cxDBDateEdit1
  end
  object Label19: TLabel
    Left = 14
    Top = 123
    Width = 61
    Height = 13
    Caption = 'Responsavel'
    FocusControl = cxDBTextEdit6
  end
  object Label20: TLabel
    Left = 312
    Top = 123
    Width = 33
    Height = 13
    Caption = 'Cliente'
    FocusControl = cxDBTextEdit6
  end
  object Label21: TLabel
    Left = 14
    Top = 0
    Width = 71
    Height = 13
    Caption = 'Codigo Projeto'
    FocusControl = cxDBTextEdit8
  end
  object SpeedButton1: TSpeedButton
    Left = 504
    Top = 55
    Width = 23
    Height = 21
    Hint = 'Atualiza Conex'#227'o Origem'
    Caption = 'q'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Webdings'
    Font.Style = []
    ParentFont = False
  end
  object SpeedButton2: TSpeedButton
    Left = 504
    Top = 96
    Width = 23
    Height = 21
    Hint = 'Atualiza Conex'#227'o Destino'
    Caption = 'q'
    Font.Charset = SYMBOL_CHARSET
    Font.Color = clBlue
    Font.Height = -16
    Font.Name = 'Webdings'
    Font.Style = []
    ParentFont = False
  end
  object cxDBTextEdit3: TcxDBTextEdit
    Left = 214
    Top = 14
    DataBinding.DataField = 'PROJETO_NOME'
    DataBinding.DataSource = DM.DSProjeto
    TabOrder = 0
    Width = 233
  end
  object cxDBTextEdit4: TcxDBTextEdit
    Left = 14
    Top = 55
    DataBinding.DataField = 'CONEXAO_ORIGEM'
    DataBinding.DataSource = DM.DSProjeto
    TabOrder = 1
    Width = 567
  end
  object cxDBTextEdit5: TcxDBTextEdit
    Left = 14
    Top = 96
    DataBinding.DataField = 'CONEXAO_DESTINO'
    DataBinding.DataSource = DM.DSProjeto
    TabOrder = 2
    Width = 567
  end
  object cxDBDateEdit1: TcxDBDateEdit
    Left = 460
    Top = 14
    DataBinding.DataField = 'DATA_PROJETO'
    DataBinding.DataSource = DM.DSProjeto
    TabOrder = 3
    Width = 121
  end
  object cxDBTextEdit6: TcxDBTextEdit
    Left = 14
    Top = 137
    DataBinding.DataField = 'RESPONSAVEL_NOME'
    DataBinding.DataSource = DM.DSProjeto
    TabOrder = 4
    Width = 272
  end
  object cxDBTextEdit7: TcxDBTextEdit
    Left = 312
    Top = 137
    DataBinding.DataField = 'CLIENTE_NOME'
    DataBinding.DataSource = DM.DSProjeto
    TabOrder = 5
    Width = 269
  end
  object cxDBTextEdit8: TcxDBTextEdit
    Left = 14
    Top = 14
    DataBinding.DataField = 'ID'
    DataBinding.DataSource = DM.DSProjeto
    TabOrder = 6
    Width = 179
  end
  object btnCancelar: TBitBtn
    Left = 497
    Top = 173
    Width = 84
    Height = 25
    Caption = 'Cancelar'
    Kind = bkCancel
    NumGlyphs = 2
    TabOrder = 7
    OnClick = btnCancelarClick
  end
  object btnConfirmar: TBitBtn
    Left = 400
    Top = 173
    Width = 84
    Height = 25
    Caption = 'Confirmar'
    Kind = bkOK
    NumGlyphs = 2
    TabOrder = 8
    OnClick = btnConfirmarClick
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 200
    Width = 592
    Height = 19
    Panels = <
      item
        Width = 400
      end
      item
        Width = 50
      end>
    ExplicitLeft = 144
    ExplicitWidth = 0
  end
end
