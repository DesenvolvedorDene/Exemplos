unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,math;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Memo1: TMemo;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  const
    palavreas : array [0..39] of string= ('Bailarina',
                                          'Futebol',
                                          'Estátua',
                                          'Pintor',
                                          'Frio',
                                          'Bebê',
                                          'Mímico',
                                          'Escova de dentes',
                                          'Lápis',
                                          'Livro',
                                          'Astronauta',
                                          'Amor',
                                          'Ódio',
                                          'Cego',
                                          'Cadeira',
                                          'Sacola',
                                          'Professor',
                                          'Médico',
                                          'Calculadora',
                                          'Artista',
                                          'Vitória',
                                          'Pescador',
                                          'Internet',
                                          'Basquete',
                                          'Semente',
                                          'Policial',
                                          'Amargo',
                                          'Bilhete',
                                          'Xadrez',
                                          'Banana',
                                          'Micróbio',
                                          'Romance',
                                          'Carteira',
                                          'Máquina de lavar',
                                          'Prancha de surfe',
                                          'Debate',
                                          'Lixo',
                                          'Sombra',
                                          'Cadeado',
                                          'Massagem');

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  i: Integer;
begin
  i := 0;
  i := RandomRange(0,39);
  Edit1.Text := palavreas[i];
end;

end.
