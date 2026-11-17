@echo off
rem Builds the Mideast installer from the theater installed in Falcon BMS.
rem Needs Inno Setup 7 or 6 (https://jrsoftware.org/isdl.php).
rem Usage: build-installer.bat ["C:\Falcon BMS 4.38\Data\Add-On Mideast128"]
setlocal
set "SRC=%~1"
if "%SRC%"=="" set "SRC=C:\Falcon BMS 4.38\Data\Add-On Mideast128"
if not exist "%SRC%\Terrdata\theaterdefinition\Mideast128_NT.tdf" (
  echo Theater folder not found: %SRC%
  exit /b 1
)
set "ISCC="
if not defined ISCC if exist "%ProgramFiles%\Inno Setup 7\ISCC.exe" set "ISCC=%ProgramFiles%\Inno Setup 7\ISCC.exe"
if not defined ISCC if exist "%ProgramFiles(x86)%\Inno Setup 7\ISCC.exe" set "ISCC=%ProgramFiles(x86)%\Inno Setup 7\ISCC.exe"
if not defined ISCC if exist "%LocalAppData%\Programs\Inno Setup 7\ISCC.exe" set "ISCC=%LocalAppData%\Programs\Inno Setup 7\ISCC.exe"
if not defined ISCC if exist "%ProgramFiles%\Inno Setup 6\ISCC.exe" set "ISCC=%ProgramFiles%\Inno Setup 6\ISCC.exe"
if not defined ISCC if exist "%ProgramFiles(x86)%\Inno Setup 6\ISCC.exe" set "ISCC=%ProgramFiles(x86)%\Inno Setup 6\ISCC.exe"
if not defined ISCC if exist "%LocalAppData%\Programs\Inno Setup 6\ISCC.exe" set "ISCC=%LocalAppData%\Programs\Inno Setup 6\ISCC.exe"
if not defined ISCC (
  echo Inno Setup 7 or 6 not found: install it from https://jrsoftware.org/isdl.php
  exit /b 1
)
cd /d "%~dp0"
"%ISCC%" /DSrcDir="%SRC%" Mideast.iss
if errorlevel 1 exit /b 1
echo.
echo Done: installer\Output\Mideast-4.38-Setup.exe and the .bin parts
endlocal
