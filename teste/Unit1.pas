unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,Wininet, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
   const
   urls : array [0..6] of string = ('http://www.uol.com.br/arquivos/text.txt',
            'http://www.terra.com.br/arquivos/arquivo.txt',
            'https://docs.google.com/document/u/4/export?format=txt&id=1v9bGMd4R8S234PHp0bh5NRBhgrRvJXLO7ZixFBVq0sw',
            'https://docs.google.com/document/u/0/export?format=txt&id=1NlWraUh3scSXngajuzmhxyLpC3xdLu0ShVCmgsvYi30',
            'https://docs.google.com/document/d/1kTO1be5EoKa0TqmkWmPVcDt91aVaNxUDpmES8HNmjgU/edit',
            'https://docs.google.com/document/export?format=txt&id=1kTO1be5EoKa0TqmkWmPVcDt91aVaNxUDpmES8HNmjgU',
            'http://www.e-maxsistemas.com.br/arquivos/arquivo.txt');

implementation

{$R *.dfm}

function DownloadURL(AUrl, TargetFileName, ProxyName, ProxyBypass: PChar):
  Boolean;
const
  BUFFERSIZE = 4096;
var
  hSession: HINTERNET;
  hService: HINTERNET;
  lpBuffer: array[0..BufferSize + 1] of Byte;
  BufferLength: DWORD;
  dwBytesRead: DWORD;
  dwSizeOfRq, Reserved, dwByteToRead: DWORD;
  localFile: file;
  fsize: DWORD;
begin
  Result := False;

{ Initialize the Win32 Internet functions. }

  hSession := InternetOpen('MyApp', // Agent
    INTERNET_OPEN_TYPE_PRECONFIG, // dwAccessType
    nil, // lpszProxyName (optional)
    nil, // lpszProxyBypass (optional)
    0); // dwFlags

{
dwAccessType indicates the client machine's type of access to the
Internet,
with one of the following values:

INTERNET_OPEN_TYPE_DIRECT indicates client does not have to go through a
proxy server to access the Internet
INTERNET_OPEN_TYPE_PROXY indicates client must first pass through a proxy
server
to access the Internet.
INTERNET_OPEN_TYPE_PRECONFIG indicates client program should use whatever
value
is in the Registry to determine the type of
access.

dwFlags allows you to specify two options when the handle is created:

INTERNET_FLAG_OFFLINE indicates that all requests should be satisfied from
the cache.
INTERNET_FLAG_ASYNC indicates that requests should be satisfied using
asynchronous behavior.
}

// hSession := InternetOpen( 'MyApp', INTERNET_OPEN_TYPE_DIRECT, nil, nil,  0);

{ See if the session handle is valid }

if hSession = nil then
begin
  ShowMessage('Internet session initialization failed!');
  Exit;
end;

// Set options for the internet handle
// InternetSetOption(hSession, INTERNET_OPTION_CONNECT_TIMEOUT,@timeOutMS, sizeOf(timeOutMS));

{
InternetOpenUrl opens a handle to the Internet file using a URL.
The flags indicate that the file will always be read from the Internet
rather
than the cache.
}

hService := InternetOpenUrl(hSession,
  PChar(AUrl),
  nil,
  0,
  INTERNET_FLAG_DONT_CACHE or
  INTERNET_FLAG_PRAGMA_NOCACHE or
  INTERNET_FLAG_RELOAD,
  0);

{
INTERNET_FLAG_RELOAD: causes the program to reload the URL even if a copy
exists in the cache.
INTERNET_FLAG_DONT_CACHE: indicates not to cache the file retrieved.
INTERNET_FLAG_RAW_DATA: returns raw data if specified.
For FTP and Gopher, this data will be placed in the appropriate
_FIND_DATA structure.
INTERNET_FLAG_SECURE: is for conducting secure HTTP transactions via
either SSL or PCT.
INTERNET_FLAG_EXISTING_CONNECT: instructs WinInet to attempt to use an
existing connection to the remote server.
}


{ See if the session handle is valid }
if hSession = nil then
begin
  ShowMessage('Internet session initialization failed!');
  InternetCloseHandle(hService);
  Exit;
end;

HttpQueryInfo(hService, HTTP_QUERY_STATUS_CODE or HTTP_QUERY_FLAG_NUMBER,
  @dwByteToRead,
  dwSizeOfRq, Reserved);

 if dwByteToRead >= HTTP_STATUS_AMBIGUOUS then
begin
InternetCloseHandle(hService);
//ShowMessage('STATUS CODE : ' + IntToStr(filesize));
Exit;
end;

(*
AssignFile(localFile, TargetFileName);
{$I-}
Rewrite(localFile, 1);
{$I+}
if IOResult <> 0 then
begin
  ShowMessage('Cannot create local file');
  InternetCloseHandle(hService);
  Exit;
end;
BufferLength := BUFFERSIZE;
*)
{
These three variables will store the size of the file,
the size of the HttpQueryInfo content, and the number of bytes read in
total,
}

// determine the length of a file in bytes.

dwByteToRead := 0;
dwSizeOfRq := 4; // BufferLength
Reserved := 0;

{
With this call, an attempt is made to get the file's size.
If the attempt fails, the dwByteToRead variable is set to 0,
and no percentage or total size is displayed when the file is
downloaded.
}

if not HttpQueryInfo(hService,
  HTTP_QUERY_CONTENT_LENGTH or HTTP_QUERY_FLAG_NUMBER,
  @dwByteToRead,
  dwSizeOfRq,
  Reserved) then dwByteToRead := 0;
FSize := 0;
BufferLength := BUFFERSIZE;

while (BufferLength > 0) do
begin
// Read data from the hService handle
  if not InternetReadFile(hService, @lpBuffer, BUFFERSIZE, BufferLength)
    then Break;
  if (BufferLength > 0) and (BufferLength <= BUFFERSIZE) then
    BlockWrite(localFile, lpBuffer, BufferLength);

  fsize := fsize + BufferLength;
// Application.ProcessMessages;
// Check the size of the remaining data. If it is zero, break.
  if BufferLength > 0 then Result := True;
end; {while}

CloseFile(localFile);
Result := True;
// Close the Internet handle that the application has opened.
InternetCloseHandle(hService);
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  I: Integer;
begin
  I := 0;
  for I := Low(urls) to High(urls) do
    DownloadURL(PChar(urls[I]), 'c:\test.html', PChar('Proxyname'), PChar('Proxy Bypass'));
end;

end.
