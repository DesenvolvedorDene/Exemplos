object Mainform: TMainform
  Left = 238
  Top = 144
  Caption = 'Gerador sfx wrar'
  ClientHeight = 199
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object SourceLBL: TLabel
    Left = 16
    Top = 9
    Width = 145
    Height = 18
    Caption = 'Execut'#225'vel de origem:'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object RARLBL: TLabel
    Left = 39
    Top = 42
    Width = 122
    Height = 18
    Caption = 'Executavel Winrar:'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object StubLBL: TLabel
    Left = 59
    Top = 75
    Width = 102
    Height = 18
    Caption = 'Stub (opcional):'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object SaveLBL: TLabel
    Left = 34
    Top = 107
    Width = 127
    Height = 18
    Caption = 'Executavel Gerado:'
    Color = clBtnFace
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlack
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentColor = False
    ParentFont = False
  end
  object SourceEDT: TEdit
    Left = 184
    Top = 9
    Width = 344
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 0
  end
  object LoadBTN1: TButton
    Left = 544
    Top = 9
    Width = 35
    Height = 28
    Caption = '...'
    TabOrder = 1
    OnClick = LoadBTN1Click
  end
  object RAREDT: TEdit
    Left = 184
    Top = 42
    Width = 344
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 2
  end
  object LoadBTN2: TButton
    Left = 544
    Top = 42
    Width = 35
    Height = 28
    Caption = '...'
    TabOrder = 3
    OnClick = LoadBTN2Click
  end
  object StubEDT: TEdit
    Left = 184
    Top = 75
    Width = 344
    Height = 26
    Enabled = False
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 4
  end
  object LoadBTN3: TButton
    Left = 544
    Top = 75
    Width = 35
    Height = 28
    Caption = '...'
    TabOrder = 5
    OnClick = LoadBTN3Click
  end
  object SaveEDT: TEdit
    Left = 184
    Top = 107
    Width = 344
    Height = 26
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -15
    Font.Name = 'Tahoma'
    Font.Pitch = fpVariable
    Font.Style = []
    Font.Quality = fqDraft
    ParentFont = False
    TabOrder = 6
  end
  object SaveBTN: TButton
    Left = 544
    Top = 107
    Width = 35
    Height = 28
    Caption = '...'
    TabOrder = 7
    OnClick = SaveBTNClick
  end
  object BTNGerar: TButton
    Left = 456
    Top = 157
    Width = 123
    Height = 33
    Caption = 'Gerar'
    TabOrder = 8
    OnClick = BTNGerarClick
  end
  object ProgressBar: TProgressBar
    Left = 3
    Top = 141
    Width = 576
    Height = 10
    TabOrder = 9
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '.exe'
    Filter = 'Executable Files|*.exe|M00N Stub Files|*.dll'
    Left = 598
    Top = 51
  end
  object SaveDialog1: TSaveDialog
    Left = 600
    Top = 96
  end
  object WinDialog1: TOpenDialog
    DefaultExt = '.exe'
    Filter = 'WinRAR Modules|Rar.exe'
    Left = 593
    Top = 7
  end
  object PopupMenu1: TPopupMenu
    Left = 600
    Top = 152
  end
end
