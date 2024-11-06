unit untteste;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,System.StrUtils, untDatamodule, Data.DB, MemDS, DBAccess, Uni;

type
  TfrmTeste = class(TForm)
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Button1: TButton;
    Edit6: TEdit;
    Button2: TButton;
    UniQuery1: TUniQuery;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTeste: TfrmTeste;

implementation

{$R *.dfm}

procedure TfrmTeste.Button1Click(Sender: TObject);
var
  I: Integer;
  linha: string;
  teste : array of string;


begin
  linha := '';
  I := 0;

  //teste := vararrayof(SplitString(Memo1.lines.text,';'));
  for I := 0 to pred(Memo1.lines.count) do
  begin
    linha := Memo1.lines[I];
    Edit2.Text := trim(copy(UPPERCASE(trim(linha)),pos(' ',UPPERCASE(trim(linha))),pos('=',UPPERCASE(trim(linha)))-4));
    Edit3.Text := SplitString(linha,'#')[0];
    Edit4.Text := SplitString(linha,'#')[1];
    Edit5.Text := SplitString(linha,'#')[2];
    Edit6.Text := SplitString(linha,'#')[3];

  end;
end;

procedure TfrmTeste.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  I := 0;
  UniQuery1.Close;
  UniQuery1.SQL.Text := trim(memo1.Lines.Text);
  for I := 0 to pred(UniQuery1.Params.Count) do
  begin

  end;

end;



end.
