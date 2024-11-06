object ShadowTestForm: TShadowTestForm
  Left = 0
  Top = 0
  Caption = 'Shadow Test Form'
  ClientHeight = 243
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PopupMode = pmExplicit
  Position = poScreenCenter
  OnClose = FormClose
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Tag = 1
    Left = 320
    Top = 192
    Width = 97
    Height = 25
    Caption = 'Show Shadow'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 64
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Test Click'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Panel1: TPanel
    Left = 192
    Top = 40
    Width = 289
    Height = 105
    Caption = 'Panel1'
    TabOrder = 2
    object Button3: TButton
      Left = 24
      Top = 16
      Width = 75
      Height = 25
      Caption = 'Test Click'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button4: TButton
      Tag = 1
      Left = 72
      Top = 72
      Width = 129
      Height = 25
      Caption = 'Test Click'
      TabOrder = 1
      OnClick = Button4Click
    end
  end
  object Panel2: TPanel
    Tag = 1
    Left = 24
    Top = 151
    Width = 233
    Height = 84
    Caption = 'Panel2'
    TabOrder = 3
    object Button5: TButton
      Tag = 1
      Left = 22
      Top = 48
      Width = 155
      Height = 25
      Caption = 'Show NonModal Form'
      TabOrder = 0
      OnClick = Button5Click
    end
  end
end
