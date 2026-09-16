<#
.SYNOPSIS
Installs WinCLI-Mode on the system.
#>

Write-Host "Installing WinCLI-Mode..." -ForegroundColor Cyan

$TargetDir = "C:\CLI"
$ScriptDir = $PSScriptRoot

# Create C:\CLI if it doesn't exist
if (-not (Test-Path $TargetDir)) {
    Write-Host "Creating directory $TargetDir..."
    New-Item -ItemType Directory -Path $TargetDir | Out-Null
}

# Copy script files
Write-Host "Copying files..."
Copy-Item -Path "$ScriptDir\CLI-Mode.bat" -Destination "$TargetDir\CLI-Mode.bat" -Force
Copy-Item -Path "$ScriptDir\CLI-Shell.ps1" -Destination "$TargetDir\CLI-Shell.ps1" -Force

# Create Desktop Shortcut
$WshShell = New-Object -ComObject WScript.Shell
$DesktopPath = [Environment]::GetFolderPath('Desktop')
$Shortcut = $WshShell.CreateShortcut("$DesktopPath\WinCLI Mode.lnk")
$Shortcut.TargetPath = "$TargetDir\CLI-Mode.bat"
$Shortcut.IconLocation = "cmd.exe, 0"
$Shortcut.Description = "Restart Windows in pure CLI Mode"
$Shortcut.Save()
Write-Host "Desktop shortcut created."

# Create Start Menu Shortcut
$StartMenuPath = [Environment]::GetFolderPath('Programs')
$ShortcutStart = $WshShell.CreateShortcut("$StartMenuPath\WinCLI Mode.lnk")
$ShortcutStart.TargetPath = "$TargetDir\CLI-Mode.bat"
$ShortcutStart.IconLocation = "cmd.exe, 0"
$ShortcutStart.Description = "Restart Windows in pure CLI Mode"
$ShortcutStart.Save()
Write-Host "Start Menu shortcut created."

Write-Host "`nInstallation complete! 🚀" -ForegroundColor Green
Write-Host "NOTE: To pin the app to the Taskbar, search for 'WinCLI Mode' in the Start Menu, right-click it, and select 'Pin to taskbar'." -ForegroundColor Yellow
Write-Host "`nPress any key to exit..."
$null = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
