object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 260
  ClientWidth = 314
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
    Top = 201
    Width = 83
    Height = 13
    Caption = 'Palavra Escolhida'
  end
  object Label2: TLabel
    Left = 8
    Top = 23
    Width = 81
    Height = 13
    Caption = 'Lista de Palavras'
  end
  object Edit1: TEdit
    Left = 8
    Top = 220
    Width = 169
    Height = 21
    TabOrder = 0
  end
  object Button1: TButton
    Left = 199
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 42
    Width = 266
    Height = 153
    Lines.Strings = (
      'Bailarina'
      'Futebol'
      'Est'#225'tua'
      'Pintor'
      'Frio'
      'Beb'#234
      'M'#237'mico'
      'Escova de dentes'
      'L'#225'pis'
      'Livro'
      'Astronauta'
      'Amor'
      #211'dio'
      'Cego'
      'Cadeira'
      'Sacola'
      'Professor'
      'M'#233'dico'
      'Calculadora'
      'Artista'
      'Vit'#243'ria'
      'Pescador'
      'Internet'
      'Basquete'
      'Semente'
      'Policial'
      'Amargo'
      'Bilhete'
      'Xadrez'
      'Banana'
      'Micr'#243'bio'
      'Romance'
      'Carteira'
      'M'#225'quina de lavar'
      'Prancha de surfe'
      'Debate'
      'Lixo'
      'Sombra'
      'Cadeado'
      'Massagem')
    ScrollBars = ssVertical
    TabOrder = 2
  end
end
