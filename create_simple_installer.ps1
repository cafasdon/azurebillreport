# Azure Billing Report Generator - Simple PowerShell Installer
# Made by Rodrigo Quintian
# Licensed under Apache 2.0 License

param(
    [string]$InstallPath = "$env:ProgramFiles\Azure Billing Report Generator",
    [switch]$Uninstall = $false,
    [switch]$Silent = $false
)

$AppName = "Azure Billing Report Generator"
$Version = "1.0.0"
$Publisher = "Rodrigo Quintian"
$GitHubUrl = "https://github.com/cafasdon/azurebillreport"

function Write-Status {
    param([string]$Message, [string]$Type = "Info")
    
    if (-not $Silent) {
        switch ($Type) {
            "Success" { Write-Host "✅ $Message" -ForegroundColor Green }
            "Error"   { Write-Host "❌ $Message" -ForegroundColor Red }
            "Warning" { Write-Host "⚠️ $Message" -ForegroundColor Yellow }
            default   { Write-Host "ℹ️ $Message" -ForegroundColor Cyan }
        }
    }
}

function Test-Administrator {
    $currentUser = [Security.Principal.WindowsIdentity]::GetCurrent()
    $principal = New-Object Security.Principal.WindowsPrincipal($currentUser)
    return $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
}

function Install-Application {
    Write-Status "Starting installation of $AppName v$Version"
    
    # Check if running as administrator
    if (-not (Test-Administrator)) {
        Write-Status "Administrator privileges required for installation" "Error"
        if (-not $Silent) {
            $response = Read-Host "Restart as administrator? (y/n)"
            if ($response -eq 'y' -or $response -eq 'Y') {
                Start-Process PowerShell -Verb RunAs -ArgumentList "-File `"$PSCommandPath`" -InstallPath `"$InstallPath`""
                exit
            }
        }
        exit 1
    }
    
    # Create installation directory
    Write-Status "Creating installation directory: $InstallPath"
    try {
        New-Item -ItemType Directory -Path $InstallPath -Force | Out-Null
        New-Item -ItemType Directory -Path "$InstallPath\example" -Force | Out-Null
    }
    catch {
        Write-Status "Failed to create installation directory: $($_.Exception.Message)" "Error"
        exit 1
    }
    
    # Copy files
    Write-Status "Copying application files..."
    $filesToCopy = @(
        "azure_billing_generator.html",
        "README.md",
        "LICENSE",
        "MARKUP_VISIBILITY_GUIDE.md",
        ".gitignore"
    )
    
    foreach ($file in $filesToCopy) {
        if (Test-Path $file) {
            Copy-Item $file $InstallPath -Force
            Write-Status "Copied $file"
        } else {
            Write-Status "Warning: $file not found" "Warning"
        }
    }
    
    # Copy example files
    $exampleFiles = @(
        "example\AzureBilling_Sample_Structure.xlsx",
        "example\README.md",
        "example\create_sample_excel.py"
    )
    
    foreach ($file in $exampleFiles) {
        if (Test-Path $file) {
            Copy-Item $file "$InstallPath\example\" -Force
            Write-Status "Copied $file"
        } else {
            Write-Status "Warning: $file not found" "Warning"
        }
    }
    
    # Copy icon if exists
    if (Test-Path "icon.ico") {
        Copy-Item "icon.ico" $InstallPath -Force
        Write-Status "Copied application icon"
    }
    
    # Create desktop shortcut
    Write-Status "Creating desktop shortcut..."
    try {
        $WshShell = New-Object -comObject WScript.Shell
        $Shortcut = $WshShell.CreateShortcut("$env:USERPROFILE\Desktop\$AppName.lnk")
        $Shortcut.TargetPath = "$InstallPath\azure_billing_generator.html"
        $Shortcut.WorkingDirectory = $InstallPath
        $Shortcut.Description = "Azure Billing Report Generator - Professional Azure billing reports"
        if (Test-Path "$InstallPath\icon.ico") {
            $Shortcut.IconLocation = "$InstallPath\icon.ico"
        }
        $Shortcut.Save()
        Write-Status "Desktop shortcut created"
    }
    catch {
        Write-Status "Failed to create desktop shortcut: $($_.Exception.Message)" "Warning"
    }
    
    # Create Start Menu shortcuts
    Write-Status "Creating Start Menu shortcuts..."
    try {
        $StartMenuPath = "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$AppName"
        New-Item -ItemType Directory -Path $StartMenuPath -Force | Out-Null
        
        # Main application shortcut
        $Shortcut = $WshShell.CreateShortcut("$StartMenuPath\$AppName.lnk")
        $Shortcut.TargetPath = "$InstallPath\azure_billing_generator.html"
        $Shortcut.WorkingDirectory = $InstallPath
        $Shortcut.Description = "Azure Billing Report Generator"
        if (Test-Path "$InstallPath\icon.ico") {
            $Shortcut.IconLocation = "$InstallPath\icon.ico"
        }
        $Shortcut.Save()
        
        # Sample data shortcut
        if (Test-Path "$InstallPath\example\AzureBilling_Sample_Structure.xlsx") {
            $Shortcut = $WshShell.CreateShortcut("$StartMenuPath\Sample Data.lnk")
            $Shortcut.TargetPath = "$InstallPath\example\AzureBilling_Sample_Structure.xlsx"
            $Shortcut.WorkingDirectory = "$InstallPath\example"
            $Shortcut.Description = "Sample Azure billing data"
            $Shortcut.Save()
        }
        
        # Documentation shortcut
        $Shortcut = $WshShell.CreateShortcut("$StartMenuPath\Documentation.lnk")
        $Shortcut.TargetPath = "$InstallPath\README.md"
        $Shortcut.WorkingDirectory = $InstallPath
        $Shortcut.Description = "Azure Billing Report Generator Documentation"
        $Shortcut.Save()
        
        # GitHub repository shortcut
        $Shortcut = $WshShell.CreateShortcut("$StartMenuPath\GitHub Repository.lnk")
        $Shortcut.TargetPath = $GitHubUrl
        $Shortcut.Description = "Azure Billing Report Generator GitHub Repository"
        $Shortcut.Save()
        
        # Uninstall shortcut
        $Shortcut = $WshShell.CreateShortcut("$StartMenuPath\Uninstall.lnk")
        $Shortcut.TargetPath = "PowerShell"
        $Shortcut.Arguments = "-File `"$PSCommandPath`" -Uninstall"
        $Shortcut.Description = "Uninstall Azure Billing Report Generator"
        $Shortcut.Save()
        
        Write-Status "Start Menu shortcuts created"
    }
    catch {
        Write-Status "Failed to create Start Menu shortcuts: $($_.Exception.Message)" "Warning"
    }
    
    # Add to Windows Programs list
    Write-Status "Registering with Windows Programs..."
    try {
        $RegPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$AppName"
        New-Item -Path $RegPath -Force | Out-Null
        Set-ItemProperty -Path $RegPath -Name "DisplayName" -Value $AppName
        Set-ItemProperty -Path $RegPath -Name "DisplayVersion" -Value $Version
        Set-ItemProperty -Path $RegPath -Name "Publisher" -Value $Publisher
        Set-ItemProperty -Path $RegPath -Name "InstallLocation" -Value $InstallPath
        Set-ItemProperty -Path $RegPath -Name "UninstallString" -Value "PowerShell -File `"$PSCommandPath`" -Uninstall"
        Set-ItemProperty -Path $RegPath -Name "HelpLink" -Value $GitHubUrl
        Set-ItemProperty -Path $RegPath -Name "URLInfoAbout" -Value $GitHubUrl
        Set-ItemProperty -Path $RegPath -Name "NoModify" -Value 1 -Type DWord
        Set-ItemProperty -Path $RegPath -Name "NoRepair" -Value 1 -Type DWord
        Set-ItemProperty -Path $RegPath -Name "EstimatedSize" -Value 1024 -Type DWord
        Write-Status "Registered with Windows Programs"
    }
    catch {
        Write-Status "Failed to register with Windows Programs: $($_.Exception.Message)" "Warning"
    }
    
    Write-Status "Installation completed successfully!" "Success"
    Write-Status "Application installed to: $InstallPath"
    Write-Status "Desktop shortcut created: $AppName"
    Write-Status "Start Menu: Programs > $AppName"
    
    if (-not $Silent) {
        Write-Host ""
        Write-Host "🎉 Installation Complete!" -ForegroundColor Green
        Write-Host "Click the desktop shortcut to launch the Azure Billing Report Generator."
        Write-Host ""
        $response = Read-Host "Launch application now? (y/n)"
        if ($response -eq 'y' -or $response -eq 'Y') {
            Start-Process "$InstallPath\azure_billing_generator.html"
        }
    }
}

function Uninstall-Application {
    Write-Status "Starting uninstallation of $AppName"
    
    if (-not $Silent) {
        $response = Read-Host "Are you sure you want to uninstall $AppName? (y/n)"
        if ($response -ne 'y' -and $response -ne 'Y') {
            Write-Status "Uninstallation cancelled"
            exit 0
        }
    }
    
    # Remove files
    Write-Status "Removing application files..."
    if (Test-Path $InstallPath) {
        Remove-Item $InstallPath -Recurse -Force
        Write-Status "Application files removed"
    }
    
    # Remove shortcuts
    Write-Status "Removing shortcuts..."
    $shortcuts = @(
        "$env:USERPROFILE\Desktop\$AppName.lnk",
        "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$AppName"
    )
    
    foreach ($shortcut in $shortcuts) {
        if (Test-Path $shortcut) {
            Remove-Item $shortcut -Recurse -Force
            Write-Status "Removed shortcut: $shortcut"
        }
    }
    
    # Remove registry entries
    Write-Status "Removing registry entries..."
    try {
        $RegPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\$AppName"
        if (Test-Path $RegPath) {
            Remove-Item $RegPath -Force
            Write-Status "Registry entries removed"
        }
    }
    catch {
        Write-Status "Failed to remove registry entries: $($_.Exception.Message)" "Warning"
    }
    
    Write-Status "Uninstallation completed successfully!" "Success"
}

# Main execution
try {
    if ($Uninstall) {
        Uninstall-Application
    } else {
        Install-Application
    }
}
catch {
    Write-Status "An error occurred: $($_.Exception.Message)" "Error"
    exit 1
}
