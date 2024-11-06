unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  const lista :array [0..26] of string = ('Acre (AC)','Alagoas (AL)','Amap� (AP)','Amazonas (AM)','Bahia (BA)','Cear� (CE)','Distrito Federal (DF)',
'Esp�rito Santo (ES)','Goi�s (GO)','Maranh�o (MA)','Mato Grosso (MT)','Mato Grosso do Sul (MS)','Minas Gerais (MG)','Par� (PA)','Para�ba (PB)',
'Paran� (PR)','Pernambuco (PE)','Piau� (PI)','Rio de Janeiro (RJ)','Rio Grande do Norte (RN)','Rio Grande do Sul (RS)','Rond�nia (RO)','Roraima (RR)',
'Santa Catarina (SC)','S�o Paulo (SP)','Sergipe (SE)','Tocantins (TO)');

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  I := 0;
  memo1.Lines.Clear;
  for I := 0 to High(lista) do
    memo1.Lines.Add(lista[I]);
end;

procedure TForm1.Button2Click(Sender: TObject);

var
  I: Integer;
begin
  Randomize;
  Edit1.Text := memo1.Lines.Strings[(Random(memo1.Lines.Count))];

end;

end.
