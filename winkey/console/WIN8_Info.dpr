program WIN8_Info;

{$APPTYPE CONSOLE}



uses

  SysUtils,
  Registry;


const KEY_WOW64_64KEY = 256; KEY_READ = 131097; HKEY_LOCAL_MACHINE = $80000002;


function BinToInt(Value: String): Integer;
var i, vSize: Integer;
begin
  Result := 0; vSize := Length(Value);
  for i := vSize downTo 1 do
    if Value[i] = '1' then begin Result := Result + (1 shl (vSize - i)); end;
end;

function DecodeProductKey8(Const HexSrc: Array Of Byte): String;
Const
  StarToffset: Integer = $34;
  EndOffset: Integer = $34 + 17;
  Digits: Array[0..23] of Char =
  ('B','C','D','F','G','H','J','K','M','P','Q','R','T','V','W','X','Y','2','3','4','6','7','8','9');
  dLen: Integer = 29;
  KeyOffset :Integer = 52 ;
var
  Key  : Array Of Cardinal;
  Cur, X, I, K, Last : Integer;
  T    : String;
begin
  I := 24;
  SetLength(Key, dLen);
    for K := StarToffset To EndOffset do begin Key[K - StarToffSet] := HexSrc[K]; end;
  Key[14] := BinToInt(IntToStr(Key[14]));
    repeat
      Cur := 0; X := 14;
        repeat
          Cur := Cur * 256 ;
          Cur := (Key[X]) + Cur;
          Key[X] := Cur div 24 ;
          Cur := Cur Mod 24;
          X := X - 1;
        until X < 0;
      I := I - 1;
      Last := Cur;
      T := Digits[Cur] + T ;
    until I < 0;
  T :=  Copy(T,2,25);
  Insert('N', T, Last + 1);
    For X := 1 To 4 do begin Insert('-', T, X*6); end;
  Result := T;
end;

function View_Win8_Key: string;
var Reg: TRegistry;  HexBuf: array of BYTE; binarySize: INTEGER; PN,PID,DN: string;
begin
  Reg := TRegistry.Create(KEY_READ OR KEY_WOW64_64KEY);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('\SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
    begin
      if Reg.GetDataType('DigitalProductId') = rdBinary then
      begin
        PN         := (Reg.ReadString('ProductName'));
        PID        := (Reg.ReadString('ProductID'));
        binarySize := Reg.GetDataSize('DigitalProductId');
        SetLength(HexBuf, binarySize);
        if binarySize > 0 then
        begin Reg.ReadBinaryData('DigitalProductId', HexBuf[0], binarySize); end;
      end;
    end;
  finally FreeAndNil(Reg); end;
  Result := '';
  Result := DecodeProductKey8(HexBuf);
end;

//[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion]
function GetWinProductID: String;
var Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ OR KEY_WOW64_64KEY);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion');
    Result := Reg.ReadString('ProductID');
  finally Reg.Free; end;
end;

begin
      WriteLn('ProductID: '+GetWinProductID);
      WriteLn('Key: '+View_Win8_Key);
      Writeln; Writeln('Press Enter to exit'); Readln;
end.
