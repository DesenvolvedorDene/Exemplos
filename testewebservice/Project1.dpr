program Project1;
{$APPTYPE GUI}

uses
  Vcl.Forms,
  Web.WebReq,
  IdHTTPWebBrokerBridge,
  FormUnit1 in 'FormUnit1.pas' {Form1},
  WebServerUnit in 'WebServerUnit.pas';

{$R *.res}

begin

  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
