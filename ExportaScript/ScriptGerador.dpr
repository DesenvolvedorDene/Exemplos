program ScriptGerador;

uses
  Vcl.Forms,
  midaslib,
  UntGeradorScript in 'UntGeradorScript.pas' {GeradorScript},
  untDatamodule in 'untDatamodule.pas' {DM: TDataModule},
  SqlEditor in 'SqlEditor.pas' {formEditorSql},
  Shadow in 'Sombra\Shadow.pas' {ShadowForm},
  frmEdit in 'frmEdit.pas' {Form2},
  untProjeto in 'untProjeto.pas' {frmProjeto},
  untteste in 'untteste.pas' {frmTeste},
  unEditorSql in 'unEditorSql.pas' {frmEditorSql};

{$R *.res}

begin
  Application.Initialize;
  //Application.
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TGeradorScript, GeradorScript);
  Application.Run;
end.
