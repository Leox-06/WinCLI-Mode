@echo off

:: Define the registry key for the current user's shell
set "KEY=HKCU\Software\Microsoft\Windows NT\CurrentVersion\Winlogon"
:: Use Windows Terminal (wt.exe) in Fullscreen mode (-F)
set "PS_CMD=wt.exe -F powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File C:\CLI\CLI-Shell.ps1"

echo Activating CLI Mode...

reg add "%KEY%" /v Shell /t REG_SZ /d "%PS_CMD%" /f >nul

if errorlevel 1 (
    echo.
    echo ERROR: Unable to set the CLI shell.
    pause
    exit /b 1
)

echo CLI Mode activated.
echo Logging off...

shutdown /l
