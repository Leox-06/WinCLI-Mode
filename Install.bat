@echo off
TITLE Install WinCLI-Mode
echo ==========================================
echo      Installing WinCLI-Mode...
echo ==========================================
echo.

:: 1. Crea la cartella C:\CLI se non esiste
if not exist "C:\CLI" (
    echo [1/3] Creating directory C:\CLI...
    mkdir "C:\CLI"
) else (
    echo [1/3] Directory C:\CLI already exists.
)

:: 2. Copia i file necessari nella cartella
echo [2/3] Copying script files...
copy /Y "%~dp0CLI-Mode.bat" "C:\CLI\CLI-Mode.bat" >nul
copy /Y "%~dp0CLI-Shell.ps1" "C:\CLI\CLI-Shell.ps1" >nul

:: 3. Crea il collegamento sul Desktop
echo [3/3] Creating Desktop shortcut...
powershell.exe -NoProfile -Command "$WshShell = New-Object -ComObject WScript.Shell; $DesktopPath = [Environment]::GetFolderPath('Desktop'); $Shortcut = $WshShell.CreateShortcut($DesktopPath + '\WinCLI Mode.lnk'); $Shortcut.TargetPath = 'C:\Windows\System32\cmd.exe'; $Shortcut.Arguments = '/c C:\CLI\CLI-Mode.bat'; $Shortcut.IconLocation = 'cmd.exe, 0'; $Shortcut.Description = 'Restart Windows in pure CLI Mode'; $Shortcut.Save()"

echo.
echo ==========================================
echo  Installation Complete! 🚀
echo  Check your Desktop for the 'WinCLI Mode' shortcut.
echo ==========================================
echo.
pause
