object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 242
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
    Left = 16
    Top = 200
    Width = 57
    Height = 13
    Caption = 'Selecionado'
  end
  object Memo1: TMemo
    Left = 16
    Top = 8
    Width = 377
    Height = 185
    Lines.Strings = (
      'Memo1')
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object Edit1: TEdit
    Left = 96
    Top = 199
    Width = 297
    Height = 21
    TabOrder = 1
    Text = 'Edit1'
  end
  object Button1: TButton
    Left = 432
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Carregar lista'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 432
    Top = 55
    Width = 75
    Height = 25
    Caption = 'selecionar'
    TabOrder = 3
    OnClick = Button2Click
  end
end
