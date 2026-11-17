; Mideast for Falcon BMS 4.38 - installer (Inno Setup 6)
;
; Build: run build-installer.bat (it calls ISCC with the theater folder of your BMS installation),
; or by hand:
;   ISCC.exe /DSrcDir="C:\Falcon BMS 4.38\Data\Add-On Mideast128" Mideast.iss
;
; Output: Output\Mideast-4.38-Setup.exe + Mideast-4.38-Setup-*.bin, each part under 2 GB (GitHub release limit).

#define AppName      "Mideast for Falcon BMS 4.38"
#define AppVersion   "1.0.0"
#define AppPublisher "Danguard63"
#define AppURL       "https://github.com/Danguard63/Mideast-Theater-BMS"
#define TheaterDir   "Add-On Mideast128"
#define TdfLine      "Add-On Mideast128\Terrdata\theaterdefinition\Mideast128_NT.tdf"
#ifndef SrcDir
  #define SrcDir     "C:\Falcon BMS 4.38\Data\Add-On Mideast128"
#endif

[Setup]
AppId={{6C1E2B4A-8F3D-4B5E-9A7C-4D2F1E8B3A61}
AppName={#AppName}
AppVersion={#AppVersion}
AppVerName={#AppName} {#AppVersion}
AppPublisher={#AppPublisher}
AppPublisherURL={#AppURL}
AppSupportURL={#AppURL}/issues
AppUpdatesURL={#AppURL}/releases
; {app} = the Falcon BMS 4.38 folder; the theater goes to {app}\Data\Add-On Mideast128
DefaultDirName={code:DefaultBmsDir}
DirExistsWarning=no
AppendDefaultDirName=no
DisableProgramGroupPage=yes
UsePreviousAppDir=yes
Uninstallable=yes
UninstallFilesDir={app}\Data\{#TheaterDir}\Uninstall
UninstallDisplayName={#AppName}
OutputDir=Output
OutputBaseFilename=Mideast-4.38-Setup
Compression=lzma2/normal
SolidCompression=no
LZMANumBlockThreads=4
DiskSpanning=yes
; 1.95 GB per part: GitHub accepts files up to 2 GB
DiskSliceSize=1950000000
SlicesPerDisk=1
ArchitecturesAllowed=x64compatible
ArchitecturesInstallIn64BitMode=x64compatible
PrivilegesRequired=admin
WizardStyle=modern
LicenseFile=..\LICENSE.md
InfoBeforeFile=before-install.txt
SetupLogging=yes

[Messages]
SelectDirLabel3=Choose your Falcon BMS 4.38 folder (the one with Bin, Data, Docs, Launcher.exe). The theater is installed into Data\{#TheaterDir}.
SelectDirBrowseLabel=Make a backup of your Falcon BMS installation before going on.

[Files]
; Everything in the theater folder, except test scenarios, backups and reports of the tools.
Source: "{#SrcDir}\*"; DestDir: "{app}\Data\{#TheaterDir}"; Flags: ignoreversion recursesubdirs createallsubdirs; \
  Excludes: "\Campaign\Chunma test1.*,\Campaign\Hawk test1.*,\Campaign\Patriot test*,\Campaign\SA* test*,\Campaign\Skyguard test*,\Campaign\Tor HARM test1.*,\Campaign\TASMO *,\Campaign\Auto Save.*,\Campaign\tmp.*,\Campaign\relocated.txt,\Campaign\dharan.*,\Campaign\The Day of the Jackal new.*,\Terrdata\Mideast\NewTerrain\Photoreal\backup tiles,\Terrdata\ObjectsNT\FE_Backup,\Terrdata\ObjectsNT\Airbases_leveling.csv,\Terrdata\ObjectsNT\Airbases_relocation.csv,\Uninstall,*.bak,*.orig,*.old"
; Release notes, credits and terms, next to the theater docs.
Source: "..\README.md";    DestDir: "{app}\Data\{#TheaterDir}\Docs\Mideast 4.38"; Flags: ignoreversion
Source: "..\CHANGELOG.md"; DestDir: "{app}\Data\{#TheaterDir}\Docs\Mideast 4.38"; Flags: ignoreversion
Source: "..\CREDITS.md";   DestDir: "{app}\Data\{#TheaterDir}\Docs\Mideast 4.38"; Flags: ignoreversion
Source: "..\LICENSE.md";   DestDir: "{app}\Data\{#TheaterDir}\Docs\Mideast 4.38"; Flags: ignoreversion

[UninstallDelete]
; files BMS writes while flying the theater (new saves are left alone)
Type: files; Name: "{app}\Data\{#TheaterDir}\Campaign\*.frc"
Type: files; Name: "{app}\Data\{#TheaterDir}\Campaign\*.his"

[Code]
const
  BmsKey = 'SOFTWARE\WOW6432Node\Benchmark Sims\Falcon BMS 4.38';

var
  DeleteOldTheater: Boolean;

function TheaterLst(Dir: String): String;
begin
  Result := AddBackslash(Dir) + 'Data\TerrData\TheaterDefinition\theater.lst';
end;

function IsBmsDir(Dir: String): Boolean;
begin
  Result := FileExists(TheaterLst(Dir)) and DirExists(AddBackslash(Dir) + 'Bin');
end;

{ BMS folder: from the BMS registry key, else the usual place }
function DefaultBmsDir(Param: String): String;
var
  S: String;
begin
  Result := 'C:\Falcon BMS 4.38';
  if RegQueryStringValue(HKLM, BmsKey, 'baseDir', S) and IsBmsDir(S) then
    Result := S
  else if RegQueryStringValue(HKLM64, BmsKey, 'baseDir', S) and IsBmsDir(S) then
    Result := S;
end;

function NextButtonClick(CurPageID: Integer): Boolean;
var
  Theater: String;
begin
  Result := True;
  if CurPageID = wpSelectDir then
  begin
    if not IsBmsDir(WizardDirValue) then
    begin
      SuppressibleMsgBox('This is not a Falcon BMS 4.38 folder:' + #13#10 + WizardDirValue + #13#10#13#10 +
             'Choose the folder that contains Bin, Data and Launcher.exe.', mbError, MB_OK, IDOK);
      Result := False;
      exit;
    end;
    Theater := AddBackslash(WizardDirValue) + 'Data\{#TheaterDir}';
    { an older Mideast128 (4.36/4.37) in the same folder: it does not work with 4.38, so it is deleted, never mixed with the new one }
    DeleteOldTheater := False;
    if DirExists(Theater) and not FileExists(Theater + '\Uninstall\unins000.exe') then
    begin
      if SuppressibleMsgBox('An older Mideast128 theater is already in' + #13#10 + Theater + #13#10#13#10 +
                'It does not work with BMS 4.38 and will be DELETED, with all its files, before the new theater is installed.' + #13#10 +
                'If you want to keep anything from it (saved campaigns, your own TEs), choose No and copy it elsewhere first.' + #13#10#13#10 +
                'Delete the older theater and continue?', mbConfirmation, MB_YESNO, IDYES) = IDYES then
        DeleteOldTheater := True
      else
        Result := False;
    end;
  end;
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  Lines: TArrayOfString;
  I: Integer;
  Found: Boolean;
  Lst: String;
begin
  if CurStep = ssInstall then
  begin
    if DeleteOldTheater then
    begin
      WizardForm.StatusLabel.Caption := 'Deleting the older Mideast128 theater...';
      if not DelTree(AddBackslash(WizardDirValue) + 'Data\{#TheaterDir}', True, True, True) then
        RaiseException('Could not delete the older theater folder. Close BMS and any program using it, then run the installer again.');
    end;
  end;
  if CurStep = ssPostInstall then
  begin
    { add the theater to theater.lst once }
    Lst := TheaterLst(WizardDirValue);
    Found := False;
    if LoadStringsFromFile(Lst, Lines) then
      for I := 0 to GetArrayLength(Lines) - 1 do
        if CompareText(Trim(Lines[I]), '{#TdfLine}') = 0 then
          Found := True;
    if not Found then
    begin
      CopyFile(Lst, Lst + '.before-mideast', False);
      SaveStringToFile(Lst, #13#10 + '{#TdfLine}' + #13#10, True);
    end;
  end;
end;

procedure CurUninstallStepChanged(CurUninstallStep: TUninstallStep);
var
  Lines, Kept: TArrayOfString;
  I, N: Integer;
  Lst: String;
begin
  if CurUninstallStep = usPostUninstall then
  begin
    { remove the theater line from theater.lst }
    Lst := ExpandConstant('{app}\Data\TerrData\TheaterDefinition\theater.lst');
    if LoadStringsFromFile(Lst, Lines) then
    begin
      N := 0;
      SetArrayLength(Kept, GetArrayLength(Lines));
      for I := 0 to GetArrayLength(Lines) - 1 do
        if (CompareText(Trim(Lines[I]), '{#TdfLine}') <> 0) and ((Trim(Lines[I]) <> '') or (I < GetArrayLength(Lines) - 1)) then
        begin
          Kept[N] := Lines[I];
          N := N + 1;
        end;
      SetArrayLength(Kept, N);
      SaveStringsToFile(Lst, Kept, False);
    end;
  end;
end;
