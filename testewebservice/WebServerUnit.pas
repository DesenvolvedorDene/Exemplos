unit WebServerUnit;

interface

uses
  System.SysUtils, System.Classes, IdHTTPServer, IdContext, IdCustomHTTPServer,
  IdGlobal, System.JSON;

type
  TWebServer = class
  private
    FServer: TIdHTTPServer;
    procedure HandleRequest(AContext: TIdContext;
      ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
    function GetLoginPage: string;
    function GetHomePage: string;

  public
    constructor Create;
    destructor Destroy; override;
    procedure Start;
    procedure Stop;
    class function criaServico: TWebServer; static;
  end;

  var
  WebServer : TWebServer;

implementation

constructor TWebServer.Create;
begin
  FServer := TIdHTTPServer.Create(nil);
  FServer.OnCommandGet := HandleRequest;
  FServer.DefaultPort := 8080;

end;

destructor TWebServer.Destroy;
begin
  FServer.Free;
  inherited;
end;

class function TWebServer.criaServico:TWebServer;
begin
  WebServer := TWebServer.Create;
  WebServer.Start;
  Result := WebServer;
end;

procedure TWebServer.Start;
begin
  FServer.Active := True;
end;

procedure TWebServer.Stop;
begin
  FServer.Active := False;
end;

function TWebServer.GetLoginPage: string;
begin
  Result :=
    '<!DOCTYPE html>' +
    '<html>' +
    '<head><title>Login</title></head>' +
    '<body>' +
    '<form method="POST" action="/auth">' +
    '  <input type="text" name="username" placeholder="Usu�rio"><br>' +
    '  <input type="password" name="password" placeholder="Senha"><br>' +
    '  <input type="submit" value="Login">' +
    '</form>' +
    '</body>' +
    '</html>';
end;

function TWebServer.GetHomePage: string;
begin
  Result :=
    '<!DOCTYPE html>' +
    '<html>' +
    '<head><title>P�gina Principal</title></head>' +
    '<body>' +
    '<h1>Bem-vindo!</h1>' +
    '<p>Voc� est� logado.</p>' +
    '</body>' +
    '</html>';
end;

procedure TWebServer.HandleRequest(AContext: TIdContext;
  ARequestInfo: TIdHTTPRequestInfo; AResponseInfo: TIdHTTPResponseInfo);
var
  Username, Password: string;
begin
  AResponseInfo.ContentType := 'text/html';

  // Rota para a p�gina de login
  if (ARequestInfo.Document = '/') or (ARequestInfo.Document = '/login') then
  begin
    AResponseInfo.ContentText := GetLoginPage;
    Exit;
  end;

  // Rota para autentica��o
  if (ARequestInfo.Document = '/auth') and (ARequestInfo.CommandType = hcPOST) then
  begin
    Username := ARequestInfo.Params.Values['username'];
    Password := ARequestInfo.Params.Values['password'];

    // Aqui voc� deve implementar sua pr�pria l�gica de autentica��o
    if (Username = 'admin') and (Password = '123456') then
    begin
      // Redireciona para a p�gina principal ap�s login bem-sucedido
      AResponseInfo.ResponseNo := 302; // Redirect
      AResponseInfo.Location := '/home';
      Exit;
    end;
  end;

  // Rota para a p�gina principal (protegida)
  if (ARequestInfo.Document = '/home') then
  begin
    // Aqui voc� deve adicionar verifica��o de sess�o
    AResponseInfo.ContentText := GetHomePage;
    Exit;
  end;

  // P�gina n�o encontrada
  AResponseInfo.ResponseNo := 404;
  AResponseInfo.ContentText := '<h1>P�gina n�o encontrada</h1>';
end;

end.
