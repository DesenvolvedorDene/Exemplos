unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,registry, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
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
  KEY_WOW64_64KEY = 256;
  KEY_READ = 131097;
  HKEY_LOCAL_MACHINE = $80000002;

implementation

{$R *.dfm}

procedure ReadRegisteryBinary(rKey:nativeUInt; const path,keyName:string; var buf; var bufSize:integer);
var
 r:TRegistry;
begin
 r:=nil;
 try
  r:=TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  r.RootKey:=rKey;
  if not r.OpenKey(path,false) then
   Exit;
  if (r.GetDataSize(keyName) > bufSize) then
   begin
    bufSize:=0;
    Exit;
   end;
  try
   bufSize:=r.ReadBinaryData(keyName,buf,bufSize);
  except
   on ERegistryException do
    bufSize:=0;
  end;
 finally
  r.Free;
 end;
end;

function DecodeDigitalProductId(var data:array of byte; dataSize:integer):string;
const
 keyOffset = 52;
 digits = ANSIString('BCDFGHJKMPQRTVWXY2346789');
var
// isWin8:byte;
 last,i,current,j:integer;
 key,keypart1,keypart2:string;
begin
 result:='';
// isWin8:=((data[66] div 6) and 1);                    //not sure about this
 data[66]:=(data[66] and $F7) {or ((isWin8 and $02) * 4)};

 for i:=24 downto 0 do
  begin
   current:=0;
   for j:=14 downto 0 do
    begin
     current:=current * 256;
     current:=data[j + keyOffset] + current;
     data[j + keyOffset]:=(current div 24);
     current:=current mod 24;
     last:=current;
    end;

   if (((current + 1) > 0) and ((current + 1) <= length(digits))) then
    key:=digits[current + 1] + key;
  end;

 keypart1:=key.Substring(1, last);
 keypart2:=key.Substring(last + 1, key.Length - (last + 1));
 key:=keypart1 + 'N' + keypart2;                //not sure if this is correct, any keys without 'N'

 i:=5;
 while (i < key.Length) do
  begin
   key:=key.Insert(i, '-');
   Inc(i,6);
  end;

 result:=key;
end;

function GetProductID(const idStr:string):string;
var
 dataSize:integer;
 data:array[0..$FFF] of byte;
begin
 dataSize:=length(data);
 ReadRegisteryBinary(HKEY_LOCAL_MACHINE,'SOFTWARE\Microsoft\Windows NT\CurrentVersion',idStr,data,dataSize);
 if (dataSize > 0) then
  result:=DecodeDigitalProductId(data,dataSize)
 else
  result:='';
end;

function ReadProductIDString:string;
var
 r:TRegistry;
begin
 result:='';
 r:=nil;
 try
  r:=TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  r.RootKey:=HKEY_LOCAL_MACHINE;
  if not r.OpenKey('SOFTWARE\Microsoft\Windows NT\CurrentVersion',false) then
   Exit;
  try
   result:=r.ReadString('ProductId');
  except
   on ERegistryException do
    result:='error';
  end;
 finally
  r.Free;
 end;
end;
procedure TForm1.Button1Click(Sender: TObject);
begin
  memo1.Lines.Add('ProductId: ' + ReadProductIDString);
  memo1.Lines.Add('');
  memo1.Lines.Add('DigitalProductId:  ' + GetProductID('DigitalProductId'));
  memo1.Lines.Add('DigitalProductId1: ' + GetProductID('DigitalProductId1'));
  memo1.Lines.Add('DigitalProductId2: ' + GetProductID('DigitalProductId2'));
  memo1.Lines.Add('DigitalProductId3: ' + GetProductID('DigitalProductId3'));
  memo1.Lines.Add('DigitalProductId4: ' + GetProductID('DigitalProductId4'));
  memo1.Lines.Add('DigitalProductId5: ' + GetProductID('DigitalProductId5'));

  memo1.Lines.Add('');



  memo1.Lines.Add('----------------------------------------');
end;

end.
