# Set the starting directory to the user's profile folder
Set-Location $env:USERPROFILE

# CLI Graphical Interface
Clear-Host
Write-Host "==============================" -ForegroundColor Cyan
Write-Host "           CLI MODE           " -ForegroundColor Cyan
Write-Host "==============================" -ForegroundColor Cyan
Write-Host "`nLogged in as: $env:USERNAME" -ForegroundColor Green
Write-Host "Current Path: $((Get-Location).Path)" -ForegroundColor Green
Write-Host "`nTo return to standard Windows, type 'exit' and press Enter.`n"

# Function to restore the registry and launch Explorer
function Restore-Shell {
    Write-Host "`nRestoring Windows shell..." -ForegroundColor Yellow
    Remove-ItemProperty -Path "HKCU:\Software\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "Shell" -ErrorAction SilentlyContinue
    Start-Process explorer.exe
}

try {
    # Create a clean interactive prompt
    $host.UI.RawUI.WindowTitle = "CLI Environment (Low RAM)"
    
    # Keep the session active until the user types 'exit'
    $nestedPrompt = $true
    while ($nestedPrompt) {
        $input = Read-Host "PS $((Get-Location).Path)>"
        if ($input -eq "exit") {
            $nestedPrompt = $false
        } elseif ($input.Trim() -ne "") {
            Invoke-Expression $input
        }
    }
}
finally {
    # This block is executed when exiting the try block (e.g., typing exit)
    Restore-Shell
}
