program WCripterx;

uses
  Vcl.Forms,
  untMain in 'untMain.pas' {Mainform};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainform, Mainform);
  Application.Run;
end.
