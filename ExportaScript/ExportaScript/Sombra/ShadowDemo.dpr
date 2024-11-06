program ShadowDemo;

uses
  Forms,
  ShadowTestForm in 'MainForm.pas' {ShadowTestForm},
  Shadow in 'Shadow.pas' {ShadowForm};

{$R *.res}

begin
     Application.Initialize;
     Application.MainFormOnTaskbar := True;

     Application.CreateForm(TShadowTestForm, ShadowTestForm);
  Application.Run;
end.