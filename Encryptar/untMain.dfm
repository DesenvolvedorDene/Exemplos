object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Cript Delphi'
  ClientHeight = 125
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 16
    Width = 93
    Height = 13
    Caption = 'Arquivo Executavel'
  end
  object Edit1: TEdit
    Left = 8
    Top = 32
    Width = 433
    Height = 21
    TabOrder = 0
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 106
    Width = 527
    Height = 19
    Panels = <>
    ExplicitLeft = 400
    ExplicitTop = 80
    ExplicitWidth = 0
  end
  object Button1: TButton
    Left = 446
    Top = 31
    Width = 75
    Height = 25
    Caption = 'Carregar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 360
    Top = 68
    Width = 161
    Height = 25
    Caption = 'Encryptar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object OpenDialog1: TOpenDialog
    DefaultExt = '*.exe'
    Filter = 'Arquivo Executavel(*.exe)|*.exe'
    Title = 'Selecione um arquivo exe'
    Left = 264
    Top = 8
  end
  object sfd: TSaveDialog
    Left = 288
    Top = 72
  end
end
