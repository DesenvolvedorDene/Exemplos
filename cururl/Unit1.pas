unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,system.IOUtils,NetEncoding, Vcl.StdCtrls,strutils;

type
  TFormPontoRemoto = class(TForm)
    Button1: TButton;
    procedure FormShow(Sender: TObject);
  private
    FAparametros: array of string;
    FURL: string;
    FRecurso: string;
    FMetodo: string;
    FErro: string;
    function ExecutaCurl: boolean;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPontoRemoto: TFormPontoRemoto;

implementation

{$R *.dfm}

function RunProcess(FileName: string; ShowCmd: DWORD; wait: Boolean; ProcID:PDWORD;Diretorio:string): Longword;
var
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  StartupInfo.cb := SizeOf(StartupInfo);
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_FORCEONFEEDBACK;
  StartupInfo.wShowWindow := ShowCmd;
  if not CreateProcess(nil,
    @Filename[1],
    nil,
    nil,
    False,
    CREATE_NEW_CONSOLE or
    NORMAL_PRIORITY_CLASS,
    nil,
    PChar(Diretorio),
    StartupInfo,
    ProcessInfo)
    then
    Result := WAIT_FAILED
  else
  begin
    if wait = FALSE then
    begin
      if ProcID <> nil then
        ProcID^ := ProcessInfo.dwProcessId;
      result := WAIT_FAILED;
      exit;
    end;
    WaitForSingleObject(ProcessInfo.hProcess, INFINITE);
    GetExitCodeProcess(ProcessInfo.hProcess, Result);
  end;
  if ProcessInfo.hProcess <> 0 then
    CloseHandle(ProcessInfo.hProcess);
  if ProcessInfo.hThread <> 0 then
    CloseHandle(ProcessInfo.hThread);
end;

function  TFormPontoRemoto.ExecutaCurl:boolean;
var
  parametros,
  vdirtemp,
  vpathbat,
  vsenhas :string;
  bat :Tstringlist;
  I: Integer;
  T: Integer;
  ProcID: Cardinal;
  vStatus: string;

procedure deletalixo(lixoarq:string);
begin
  if Tfile.Exists(vdirtemp+lixoarq) then
     Tfile.Delete(vdirtemp+lixoarq);
end;

 procedure criaparametro(param:string);
 begin
   if parametros = '' then
        parametros:='-F '+trim(param)
       else
        parametros:=parametros+' -F '+trim(param);
 end;


 function GetShortPathString(sLongPathName : string) : string;
 begin
    Result:='';
    SetLength(Result,MAX_PATH+1);
    GetShortPathName(PChar(sLongPathName),PChar(Result),MAX_PATH);
    SetLength(Result,StrLen(PChar(Result)));
 end;

 procedure executabat(patharg:string);
  var
    K: Integer;
    caminho : PAnsiChar;
 begin
    K := 0;
  // for K := Low to High do

 end;


begin
  vStatus := '';
  T := 0;
  parametros := '';
  vsenhas := '';
 // vsenhas := TBase64Encoding.Base64.Encode(FUsuario+':'+FSenha);
  bat := Tstringlist.create;
  deletalixo('sinter.bat');
  deletalixo('sinter.bat');
  deletalixo('sinter.json');
  ProcID := 0;
  Result := false;
  vdirtemp := (TPath.GetTempPath);
  try
    bat.clear;
    I := 0;
    for I := Low(FAparametros) to High(FAparametros) do
    begin
      if splitstring(trim(FAparametros[I]),'=')[0] = 'arquivo' then
      begin
        bat.text := splitstring(trim(FAparametros[I]),'=')[1];
        bat.savetofile(TPath.GetTempPath+'sinter.json');
      end else
        criaparametro(trim(FAparametros[I]));
    end;
    bat.clear;
    bat.add('@echo off');
    bat.add('Set url_recurso="'+FURL+FRecurso+'"');
    bat.add('set Headers=-H "authorization: Basic '+vsenhas+'" -H "cache-control: no-cache" -H "content-type: multipart/form-data;"');
    bat.add('set parametros='+parametros);
    bat.add('set arquivosave=-o resplog.log');
    bat.add('');
    bat.add('curl -X '+FMetodo+' %url_recurso% %Headers% %parametros% %arquivosave% -#');
   // bat.add('curl -X POST %url_recurso% %Headers% %parametros% >sinter.log');
    bat.add('echo Finalizando Aguarde... ');
    bat.add('exit ');
    bat.SaveToFile(vdirtemp+'whspp.bat');
    bat.clear;
    RunProcess(vdirtemp+'whspp.bat', SW_HIDE, true, @ProcID,vdirtemp);
    repeat
      application.ProcessMessages;
      sleep(1000);
      inc(T);
    until (FileExists(vdirtemp+'resplog.log') or (T = 5));
    FErro  := '';
    if FileExists(vdirtemp+'resplog.log') then
    begin
    {
      Result := true;
      FRetJSON.loadfromfile(vdirtemp+'sinter.log');
      if FRetJSON.Text <> '' then
      begin
        //carregaclassesinter(Recurso);
        if FResultados.FSiterRetorno = nil then
        begin
          vStatus := copy(FRetJSON.Text,1,pos(',',FRetJSON.Text)-1);
          FErro  := FRetJSON.Text;
          FStatusCode := strtointdef(copy(vStatus,16,4),0);
        end;
        FStatusText := FRetJSON.Text;

      end else
      begin
        Result := false;
        FErro  := 'Erro na execução do processo verifique paramentros requisição';
      end;  }
    end else
      FErro  := 'Não foi possivel executar o prcesso';
  finally
    Result := FErro = '';
    freeandnil(bat);
  end;

end;

procedure TFormPontoRemoto.FormShow(Sender: TObject);
begin
  FURL:='http://api.whatsmate.net/v3/whatsapp/group/text/message/';
end;

end.
