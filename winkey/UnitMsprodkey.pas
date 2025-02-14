unit unitMSProdKey;

{
**************************************************************************************
* Unit MSProdKey v2.2                                                                *
*                                                                                    *
*  Description: Decode and View the Product Key, Product ID and Product Name used to *
*               install: Windows 2000, XP, Server 2003, Office XP, 2003.             *
*               *Updated* Now works for users with Non-Administrative Rights.        *
*               Code cleanup and changes, Commented.                                 *
*                                                                                    *
*  Usage: Add MSProdKey to your Application's uses clause.                           *
*                                                                                    *
*  Example 1:                                                                        *
*                                                                                    *
* procedure TForm1.Button1Click(Sender: TObject);                                    *
* begin                                                                              *
*   if not IS_WinVerMin2K then // If the Windows version isn't at least Windows 2000 *
*   Edit1.Text := 'Windows 2000 or Higher Required!' // Display this message         *
*   else // If the Windows version is at least Windows 2000                          *
*   Edit1.Text := View_Win_Key; // View the Windows Product Key                      *
*   Label1.Caption := PN; // View the Windows Product Name                           *
*   Label2.Caption := PID; // View the Windows Product ID                            *
* end;                                                                               *
*                                                                                    *
*  Example 2:                                                                        *
* procedure TForm1.Button2Click(Sender: TObject);                                    *
* begin                                                                              *
*   if not IS_OXP_Installed then // If Office XP isn't installed                     *
*   Edit1.Text := 'Office XP Required!' // Display this message                      *
*   else // If Office XP is installed                                                *
*   Edit1.Text := View_OXP_Key; // View the Office XP Product Key                    *
*   Label1.Caption := DN; // View the Office XP Product Name                         *
*   Label2.Caption := PID; // View the Office XP Product ID                          *
* end;                                                                               *
*                                                                                    *
*  Example 3:                                                                        *
* procedure TForm1.Button3Click(Sender: TObject);                                    *
* begin                                                                              *
*   if not IS_O2K3_Installed then // If Office 2003 isn't installed                  *
*   Edit1.Text := 'Office 2003 Required!' // Display this message                    *
*   else // If Office 2003 is installed                                              *
*   Edit1.Text := View_O2K3_Key; // View the Office 2003 Product Key                 *
*   Label1.Caption := DN; // View the Office 2003 Product Name                       *
*   Label2.Caption := PID; // View the Office 2003 Product ID                        *
* end;                                                                               *
*                                                                                    *
**************************************************************************************
}

interface

uses Registry, Windows, SysUtils, Classes;

function IS_WinVerMin2K: Boolean; // Check OS for Win 2000 or higher
function View_Win_Key: string; // View the Windows Product Key
function IS_OXP_Installed: Boolean;  // Check if Office XP is installed
function View_OXP_Key: string;  // View the Office XP Product Key
function IS_O2K3_Installed: Boolean; // Check if Office 2003 is installed
function View_O2K3_Key: string; // View the Office 2003 Product Key
function DecodeProductKey(const HexSrc: array of Byte): string;
  // Decodes the Product Key(s) from the Registry

var
  Reg: TRegistry;
  binarySize: INTEGER;
  HexBuf: array of BYTE;
  temp: TStringList;
  KeyName, KeyName2, SubKeyName, PN, PID, DN: string;

implementation

function IS_WinVerMin2K: Boolean;
var
  OS: TOSVersionInfo;
begin
  ZeroMemory(@OS, SizeOf(OS));
  OS.dwOSVersionInfoSize := SizeOf(OS);
  GetVersionEx(OS);
  Result := (OS.dwMajorVersion >= 5) and
    (OS.dwPlatformId = VER_PLATFORM_WIN32_NT);
  PN     := ''; // Holds the Windows Product Name
  PID    := ''; // Holds the Windows Product ID
end;


function View_Win_Key: string;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKeyReadOnly('SOFTWARE\Microsoft\Windows NT\CurrentVersion') then
    begin
      if Reg.GetDataType('DigitalProductId') = rdBinary then
      begin
        PN         := (Reg.ReadString('ProductName'));
        PID        := (Reg.ReadString('ProductID'));
        binarySize := Reg.GetDataSize('DigitalProductId');
        SetLength(HexBuf, binarySize);
        if binarySize > 0 then
        begin
          Reg.ReadBinaryData('DigitalProductId', HexBuf[0], binarySize);
        end;
      end;
    end;
  finally
    FreeAndNil(Reg);
  end;

  Result := '';
  Result := DecodeProductKey(HexBuf);
end;

function IS_OXP_Installed: Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Result      := Reg.KeyExists('SOFTWARE\MICROSOFT\Office\10.0\Registration');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  DN  := ''; // Holds the Office XP Product Display Name
  PID := ''; // Holds the Office XP Product ID
end;

function View_OXP_Key: string;
begin
  try
    Reg         := TRegistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    KeyName     := 'SOFTWARE\MICROSOFT\Office\10.0\Registration\';
    Reg.OpenKeyReadOnly(KeyName);
    temp := TStringList.Create;
    Reg.GetKeyNames(temp); // Enumerate and hold the Office XP Product(s) Key Name(s)
    Reg.CloseKey;
    SubKeyName  := temp.Strings[0]; // Hold the first Office XP Product Key Name
    Reg         := TRegistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    KeyName2    := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\';
    Reg.OpenKeyReadOnly(KeyName2 + SubKeyName);
    DN := (Reg.ReadString('DisplayName'));
    Reg.CloseKey;
  except
    on E: EStringListError do
      Exit
  end;
  try
    if Reg.OpenKeyReadOnly(KeyName + SubKeyName) then
    begin
      if Reg.GetDataType('DigitalProductId') = rdBinary then
      begin
        PID        := (Reg.ReadString('ProductID'));
        binarySize := Reg.GetDataSize('DigitalProductId');
        SetLength(HexBuf, binarySize);
        if binarySize > 0 then
        begin
          Reg.ReadBinaryData('DigitalProductId', HexBuf[0], binarySize);
        end;
      end;
    end;
  finally
    FreeAndNil(Reg);
  end;

  Result := '';
  Result := DecodeProductKey(HexBuf);
end;

function IS_O2K3_Installed: Boolean;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    Result      := Reg.KeyExists('SOFTWARE\MICROSOFT\Office\11.0\Registration');
  finally
    Reg.CloseKey;
    Reg.Free;
  end;
  DN  := ''; // Holds the Office 2003 Product Display Name
  PID := ''; // Holds the Office 2003 Product ID
end;

function View_O2K3_Key: string;
begin
  try
    Reg         := TRegistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    KeyName     := 'SOFTWARE\MICROSOFT\Office\11.0\Registration\';
    Reg.OpenKeyReadOnly(KeyName);
    temp := TStringList.Create;
    Reg.GetKeyNames(temp);
    // Enumerate and hold the Office 2003 Product(s) Key Name(s)
    Reg.CloseKey;
    SubKeyName  := temp.Strings[0]; // Hold the first Office 2003 Product Key Name
    Reg         := TRegistry.Create;
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    KeyName2    := 'SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\';
    Reg.OpenKeyReadOnly(KeyName2 + SubKeyName);
    DN := (Reg.ReadString('DisplayName'));
    Reg.CloseKey;
  except
    on E: EStringListError do
      Exit
  end;
  try
    if Reg.OpenKeyReadOnly(KeyName + SubKeyName) then
    begin
      if Reg.GetDataType('DigitalProductId') = rdBinary then
      begin
        PID        := (Reg.ReadString('ProductID'));
        binarySize := Reg.GetDataSize('DigitalProductId');
        SetLength(HexBuf, binarySize);
        if binarySize > 0 then
        begin
          Reg.ReadBinaryData('DigitalProductId', HexBuf[0], binarySize);
        end;
      end;
    end;
  finally
    FreeAndNil(Reg);
  end;

  Result := '';
  Result := DecodeProductKey(HexBuf);
end;

function DecodeProductKey(const HexSrc: array of Byte): string;
const
  StartOffset: Integer = $34; { //Offset 34 = Array[52] }
  EndOffset: Integer   = $34 + 15; { //Offset 34 + 15(Bytes) = Array[64] }
  Digits: array[0..23] of CHAR = ('B', 'C', 'D', 'F', 'G', 'H', 'J',
    'K', 'M', 'P', 'Q', 'R', 'T', 'V', 'W', 'X', 'Y', '2', '3', '4', '6', '7', '8', '9');
  dLen: Integer = 29; { //Length of Decoded Product Key }
  sLen: Integer = 15;
  { //Length of Encoded Product Key in Bytes (An total of 30 in chars) }
var
  HexDigitalPID: array of CARDINAL;
  Des: array of CHAR;
  I, N: INTEGER;
  HN, Value: CARDINAL;
begin
  SetLength(HexDigitalPID, dLen);
  for I := StartOffset to EndOffset do
  begin
    HexDigitalPID[I - StartOffSet] := HexSrc[I];
  end;

  SetLength(Des, dLen + 1);

  for I := dLen - 1 downto 0 do
  begin
    if (((I + 1) mod 6) = 0) then
    begin
      Des[I] := '-';
    end
    else
    begin
      HN := 0;
      for N := sLen - 1 downto 0 do
      begin
        Value := (HN shl 8) or HexDigitalPID[N];
        HexDigitalPID[N] := Value div 24;
        HN    := Value mod 24;
      end;
      Des[I] := Digits[HN];
    end;
  end;
  Des[dLen] := Chr(0);

  for I := 0 to Length(Des) do
  begin
    Result := Result + Des[I];
  end;
end;

end.
