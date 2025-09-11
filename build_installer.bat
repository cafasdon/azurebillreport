@echo off
echo ========================================
echo Azure Billing Report Generator Installer Builder
echo Made by Rodrigo Quintian
echo ========================================
echo.

REM Check if NSIS is installed
where makensis >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ERROR: NSIS (Nullsoft Scriptable Install System) is not installed or not in PATH.
    echo.
    echo Please download and install NSIS from: https://nsis.sourceforge.io/Download
    echo After installation, add NSIS to your PATH or run this script from the NSIS directory.
    echo.
    pause
    exit /b 1
)

REM Check if icon exists
if not exist "icon.ico" (
    echo Creating application icon...
    python create_icon.py
    if %ERRORLEVEL% NEQ 0 (
        echo WARNING: Could not create icon. Using default.
    )
)

REM Check if all required files exist
echo Checking required files...
set MISSING_FILES=0

if not exist "azure_billing_generator.html" (
    echo ERROR: azure_billing_generator.html not found!
    set MISSING_FILES=1
)

if not exist "README.md" (
    echo ERROR: README.md not found!
    set MISSING_FILES=1
)

if not exist "LICENSE" (
    echo ERROR: LICENSE not found!
    set MISSING_FILES=1
)

if not exist "example\AzureBilling_Sample_Structure.xlsx" (
    echo ERROR: example\AzureBilling_Sample_Structure.xlsx not found!
    set MISSING_FILES=1
)

if %MISSING_FILES% EQU 1 (
    echo.
    echo ERROR: Missing required files. Please ensure all files are present.
    pause
    exit /b 1
)

echo All required files found!
echo.

REM Build the installer
echo Building installer...
makensis installer.nsi

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo SUCCESS! Installer created successfully!
    echo ========================================
    echo.
    echo Output file: AzureBillingReportGenerator_Setup.exe
    echo.
    echo The installer includes:
    echo - Azure Billing Report Generator application
    echo - Desktop shortcut
    echo - Start Menu shortcuts
    echo - Sample data files
    echo - Documentation
    echo - Uninstaller
    echo.
    echo You can now distribute AzureBillingReportGenerator_Setup.exe
    echo.
) else (
    echo.
    echo ERROR: Failed to build installer!
    echo Please check the NSIS script for errors.
)

pause
