object frmTeste: TfrmTeste
  Left = 0
  Top = 0
  Caption = 'frmTeste'
  ClientHeight = 444
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
  object Edit2: TEdit
    Left = 16
    Top = 203
    Width = 289
    Height = 21
    TabOrder = 0
    Text = 'Edit2'
  end
  object Edit3: TEdit
    Left = 16
    Top = 230
    Width = 289
    Height = 21
    TabOrder = 1
    Text = 'Edit3'
  end
  object Edit4: TEdit
    Left = 16
    Top = 257
    Width = 289
    Height = 21
    TabOrder = 2
    Text = 'Edit3'
  end
  object Edit5: TEdit
    Left = 16
    Top = 284
    Width = 289
    Height = 21
    TabOrder = 3
    Text = 'Edit3'
  end
  object Button1: TButton
    Left = 328
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Edit6: TEdit
    Left = 16
    Top = 311
    Width = 289
    Height = 21
    TabOrder = 5
    Text = 'Edit3'
  end
  object Button2: TButton
    Left = 336
    Top = 64
    Width = 75
    Height = 25
    Caption = 'Button2'
    TabOrder = 6
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 8
    Width = 297
    Height = 89
    Lines.Strings = (
      'AND DESCRICAO = STCIVIL#N#N#-1'
      'AND status = '#39'S'#39'#N#N#-1'
      'AND NUMERO = :NUMERO#S#N#-1')
    TabOrder = 7
  end
  object UniQuery1: TUniQuery
    Connection = DM.CcnDestino
    Left = 72
    Top = 112
  end
end
