program GetProdIDs;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Winapi.Windows,
  System.SysUtils,
  System.Win.Registry;

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

begin
 try
  Writeln('ProductId: ' + ReadProductIDString);
  Writeln('');
  Writeln('DigitalProductId:  ' + GetProductID('DigitalProductId'));
  Writeln('DigitalProductId1: ' + GetProductID('DigitalProductId1'));
  Writeln('DigitalProductId2: ' + GetProductID('DigitalProductId2'));
  Writeln('DigitalProductId3: ' + GetProductID('DigitalProductId3'));
  Writeln('DigitalProductId4: ' + GetProductID('DigitalProductId4'));
  Writeln('DigitalProductId5: ' + GetProductID('DigitalProductId5'));

  Writeln('');
  Writeln('Press enter/return');
  Readln;
  except
   on E: Exception do
    Writeln(E.ClassName, ': ', E.Message);
  end;

//if the OS was updated using the free version one of these might be the product ID code
//    Windows 10 Home - YTMG3-N6DKC-DKB77-7M9GH-8HVX7
//    Windows 10 Pro - VK7JG-NPHTM-C97JM-9MPGT-3V66T
//    Windows 10 Home SL- BT79Q-G7N6G-PGBYW-4YWX6-6F4BT
//    Windows 10 Pro VL-MAK - QJNXR-7D97Q-K7WH4-RYWQ8-6MT6Y

end.
