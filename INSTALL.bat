@echo off
title Azure Billing Report Generator - Installer
echo.
echo ========================================
echo Azure Billing Report Generator
echo Professional Azure billing reports
echo Made by Rodrigo Quintian
echo ========================================
echo.
echo This will install the Azure Billing Report Generator on your Windows computer.
echo.
echo Features:
echo - Desktop shortcut for easy access
echo - Start Menu integration
echo - Sample data files included
echo - Complete documentation
echo - Easy uninstallation
echo.
echo Installation location: C:\Program Files\Azure Billing Report Generator
echo.
pause

echo.
echo Starting installation...
echo.

REM Run PowerShell installer
PowerShell -ExecutionPolicy Bypass -File "create_simple_installer.ps1"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo Installation completed successfully!
    echo ========================================
    echo.
    echo You can now:
    echo 1. Click the desktop shortcut "Azure Billing Report Generator"
    echo 2. Find it in Start Menu under "Azure Billing Report Generator"
    echo 3. Access sample data and documentation from the Start Menu
    echo.
    echo To uninstall: Use Windows Add/Remove Programs or the Start Menu uninstall shortcut
    echo.
) else (
    echo.
    echo ========================================
    echo Installation failed!
    echo ========================================
    echo.
    echo Please try running as Administrator or check the error messages above.
    echo.
)

echo.
echo Press any key to exit...
pause >nul
