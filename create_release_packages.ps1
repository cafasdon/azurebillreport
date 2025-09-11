# Azure Billing Report Generator - Release Package Creator
# Made by Rodrigo Quintian
# Licensed under Apache 2.0 License

param(
    [string]$Version = "1.0.0"
)

$ErrorActionPreference = "Stop"

function Write-Status {
    param([string]$Message, [string]$Type = "Info")
    
    switch ($Type) {
        "Success" { Write-Host "✅ $Message" -ForegroundColor Green }
        "Error"   { Write-Host "❌ $Message" -ForegroundColor Red }
        "Warning" { Write-Host "⚠️ $Message" -ForegroundColor Yellow }
        default   { Write-Host "ℹ️ $Message" -ForegroundColor Cyan }
    }
}

function New-ReleaseDirectory {
    param([string]$Path)
    
    if (Test-Path $Path) {
        Remove-Item $Path -Recurse -Force
    }
    New-Item -ItemType Directory -Path $Path -Force | Out-Null
}

Write-Status "Creating Azure Billing Report Generator Release Packages v$Version"
Write-Status "=============================================================="

# Create releases directory
$ReleasesDir = "releases"
New-ReleaseDirectory $ReleasesDir

# Package 1: Web-Only Version (Minimal)
Write-Status "Creating Web-Only Package..."
$WebOnlyDir = "$ReleasesDir\AzureBillingReportGenerator_WebOnly_v$Version"
New-ReleaseDirectory $WebOnlyDir

# Copy essential files for web usage
Copy-Item "azure_billing_generator.html" $WebOnlyDir
Copy-Item "LICENSE" $WebOnlyDir
New-Item -ItemType Directory -Path "$WebOnlyDir\example" -Force | Out-Null
Copy-Item "example\AzureBilling_Sample_Structure.xlsx" "$WebOnlyDir\example\"
Copy-Item "example\README.md" "$WebOnlyDir\example\"

# Create web-only README
@"
# Azure Billing Report Generator - Web Version

## Quick Start
1. Open `azure_billing_generator.html` in any modern web browser
2. Upload your Azure billing Excel file or use the sample data
3. Generate professional hierarchical reports

## Sample Data
- `example/AzureBilling_Sample_Structure.xlsx` - Example file structure
- Click "Download Sample" in the application for the same file

## Features
- No installation required
- Works offline in any browser
- Hierarchical resource grouping
- Markup calculations with customer-safe output
- Professional report generation

## License
Apache 2.0 - see LICENSE file

## More Information
GitHub: https://github.com/cafasdon/azurebillreport
"@ | Out-File "$WebOnlyDir\README.md" -Encoding UTF8

# Package 2: Windows Installer Package (Complete)
Write-Status "Creating Windows Installer Package..."
$InstallerDir = "$ReleasesDir\AzureBillingReportGenerator_WindowsInstaller_v$Version"
New-ReleaseDirectory $InstallerDir

# Copy all installer files
$InstallerFiles = @(
    "azure_billing_generator.html",
    "LICENSE",
    "MARKUP_VISIBILITY_GUIDE.md",
    ".gitignore",
    "INSTALL.bat",
    "UNINSTALL.bat",
    "create_simple_installer.ps1",
    "installer.nsi",
    "build_installer.bat",
    "icon.ico",
    "INSTALLER_README.md"
)

foreach ($file in $InstallerFiles) {
    if (Test-Path $file) {
        Copy-Item $file $InstallerDir
    }
}

# Copy example directory
New-Item -ItemType Directory -Path "$InstallerDir\example" -Force | Out-Null
Copy-Item "example\*" "$InstallerDir\example\" -Recurse

# Create installer package README
@"
# Azure Billing Report Generator - Windows Installer Package

## Installation Options

### Option 1: Simple Installation (Recommended)
1. Run `INSTALL.bat` as Administrator
2. Follow the installation prompts
3. Click the desktop shortcut to launch

### Option 2: Advanced Installation (NSIS)
1. Install NSIS from https://nsis.sourceforge.io/Download
2. Run `build_installer.bat` to create professional installer
3. Distribute the generated .exe file

### Option 3: PowerShell Direct
1. Run PowerShell as Administrator
2. Execute: `PowerShell -ExecutionPolicy Bypass -File create_simple_installer.ps1`

## What Gets Installed
- Desktop shortcut for easy access
- Start Menu integration with shortcuts to:
  - Main application
  - Sample data
  - Documentation
  - GitHub repository
  - Uninstaller
- Windows Add/Remove Programs entry

## Features
- Professional Windows integration
- Complete uninstallation support
- Sample data included
- Comprehensive documentation

## Requirements
- Windows 7 or later
- PowerShell (included in Windows)
- Modern web browser
- Administrator privileges for installation

## License
Apache 2.0 - see LICENSE file

## Support
GitHub: https://github.com/cafasdon/azurebillreport
Documentation: See INSTALLER_README.md for detailed instructions
"@ | Out-File "$InstallerDir\README.md" -Encoding UTF8

# Package 3: Complete Source Package
Write-Status "Creating Complete Source Package..."
$SourceDir = "$ReleasesDir\AzureBillingReportGenerator_Complete_v$Version"
New-ReleaseDirectory $SourceDir

# Copy all files except releases directory and git files
$ExcludePatterns = @("releases", ".git", "*.zip", "*.exe", "icon.png", "create_icon.py", "create_release_packages.ps1")

Get-ChildItem -Path "." -Recurse | Where-Object {
    $relativePath = $_.FullName.Substring((Get-Location).Path.Length + 1)
    $exclude = $false
    foreach ($pattern in $ExcludePatterns) {
        if ($relativePath -like $pattern -or $relativePath -like "*\$pattern" -or $relativePath -like "$pattern\*") {
            $exclude = $true
            break
        }
    }
    -not $exclude
} | ForEach-Object {
    $relativePath = $_.FullName.Substring((Get-Location).Path.Length + 1)
    $targetPath = Join-Path $SourceDir $relativePath
    
    if ($_.PSIsContainer) {
        New-Item -ItemType Directory -Path $targetPath -Force | Out-Null
    } else {
        $targetDir = Split-Path $targetPath -Parent
        if (-not (Test-Path $targetDir)) {
            New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
        }
        Copy-Item $_.FullName $targetPath
    }
}

# Create ZIP files
Write-Status "Creating ZIP archives..."

# Function to create ZIP files
function New-ZipArchive {
    param(
        [string]$SourcePath,
        [string]$DestinationPath
    )
    
    try {
        Compress-Archive -Path "$SourcePath\*" -DestinationPath $DestinationPath -Force
        Write-Status "Created: $(Split-Path $DestinationPath -Leaf)" "Success"
    }
    catch {
        Write-Status "Failed to create $(Split-Path $DestinationPath -Leaf): $($_.Exception.Message)" "Error"
    }
}

# Create ZIP archives
New-ZipArchive $WebOnlyDir "$ReleasesDir\AzureBillingReportGenerator_WebOnly_v$Version.zip"
New-ZipArchive $InstallerDir "$ReleasesDir\AzureBillingReportGenerator_WindowsInstaller_v$Version.zip"
New-ZipArchive $SourceDir "$ReleasesDir\AzureBillingReportGenerator_Complete_v$Version.zip"

# Clean up temporary directories
Remove-Item $WebOnlyDir -Recurse -Force
Remove-Item $InstallerDir -Recurse -Force
Remove-Item $SourceDir -Recurse -Force

# Create release notes
Write-Status "Creating release notes..."
@"
# Azure Billing Report Generator v$Version - Release Notes

## Download Options

### 🌐 Web-Only Version (Recommended for most users)
**File**: `AzureBillingReportGenerator_WebOnly_v$Version.zip`
**Size**: ~500 KB
**Use Case**: Quick start, no installation needed

**Contents**:
- Main application (HTML file)
- Sample data for testing
- Basic documentation

**Usage**: Extract and open `azure_billing_generator.html` in any web browser

---

### 💻 Windows Installer Package
**File**: `AzureBillingReportGenerator_WindowsInstaller_v$Version.zip`
**Size**: ~1 MB
**Use Case**: Professional Windows installation with shortcuts

**Contents**:
- Complete installer scripts
- Desktop and Start Menu integration
- Professional uninstaller
- Comprehensive documentation

**Usage**: Extract and run `INSTALL.bat` as Administrator

---

### 📦 Complete Source Package
**File**: `AzureBillingReportGenerator_Complete_v$Version.zip`
**Size**: ~2 MB
**Use Case**: Developers, customization, full source code

**Contents**:
- Complete source code
- All documentation
- Build scripts
- Development tools

**Usage**: For development, customization, or contributing

---

## Features in v$Version

### ✨ Core Features
- **Hierarchical Resource Grouping**: Shows Azure resources with their dependencies
- **Markup Calculations**: Professional pricing with customer-safe output
- **Multi-Currency Support**: GBP and USD with auto-detection
- **Professional Reports**: Clean, branded HTML output
- **Sample Data**: Example files for immediate testing

### 🔒 Security Features
- **Markup Confidentiality**: Two-tier visibility system
- **Client-Safe Reports**: Automatic markup removal for customer reports
- **Privacy Protection**: No data transmission, works offline

### 💻 Windows Integration
- **Desktop Shortcuts**: Easy access from desktop
- **Start Menu Integration**: Professional Windows integration
- **Add/Remove Programs**: Standard Windows uninstallation
- **Sample Data Access**: Quick access to example files

### 🌐 Web Features
- **No Installation**: Works directly in web browsers
- **Offline Operation**: No internet connection required
- **Cross-Platform**: Works on Windows, Mac, Linux
- **Modern UI**: Bootstrap 5 with responsive design

---

## System Requirements

### Minimum Requirements
- **Operating System**: Windows 7+ (for installer) or any OS with modern browser
- **Browser**: Chrome 60+, Firefox 55+, Safari 12+, Edge 79+
- **Disk Space**: 5 MB
- **Memory**: 512 MB RAM

### Recommended
- **Operating System**: Windows 10/11
- **Browser**: Latest Chrome, Firefox, or Edge
- **Disk Space**: 10 MB
- **Memory**: 1 GB RAM

---

## Installation Instructions

### Web Version
1. Download `AzureBillingReportGenerator_WebOnly_v$Version.zip`
2. Extract to any folder
3. Open `azure_billing_generator.html` in your browser
4. Upload Azure billing file or use sample data

### Windows Installer
1. Download `AzureBillingReportGenerator_WindowsInstaller_v$Version.zip`
2. Extract to any folder
3. Right-click `INSTALL.bat` and "Run as Administrator"
4. Follow installation prompts
5. Click desktop shortcut to launch

---

## Support & Documentation

- **GitHub Repository**: https://github.com/cafasdon/azurebillreport
- **Issues & Bug Reports**: https://github.com/cafasdon/azurebillreport/issues
- **Documentation**: See README.md in each package
- **License**: Apache 2.0

---

## Changelog

### v$Version ($(Get-Date -Format 'yyyy-MM-dd'))
- Initial release
- Complete web-based Azure billing report generator
- Windows installer package with desktop integration
- Hierarchical resource grouping with parent-child relationships
- Markup calculation system with customer-safe output
- Multi-currency support (GBP/USD)
- Professional HTML report generation
- Sample data and comprehensive documentation
- Apache 2.0 open source license

---

**Made by Rodrigo Quintian**
**Licensed under Apache 2.0**
"@ | Out-File "$ReleasesDir\RELEASE_NOTES.md" -Encoding UTF8

Write-Status "=============================================================="
Write-Status "Release packages created successfully!" "Success"
Write-Status ""
Write-Status "📦 Available Downloads:"
Write-Status "  • AzureBillingReportGenerator_WebOnly_v$Version.zip (Web version)"
Write-Status "  • AzureBillingReportGenerator_WindowsInstaller_v$Version.zip (Windows installer)"
Write-Status "  • AzureBillingReportGenerator_Complete_v$Version.zip (Complete source)"
Write-Status ""
Write-Status "📋 Release Notes: releases\RELEASE_NOTES.md"
Write-Status ""
Write-Status "Ready for distribution! 🚀"
