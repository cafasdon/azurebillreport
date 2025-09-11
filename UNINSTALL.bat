@echo off
title Azure Billing Report Generator - Uninstaller
echo.
echo ========================================
echo Azure Billing Report Generator
echo Uninstaller
echo ========================================
echo.
echo This will completely remove the Azure Billing Report Generator from your computer.
echo.
echo This will remove:
echo - All application files
echo - Desktop shortcut
echo - Start Menu shortcuts
echo - Registry entries
echo.
echo Are you sure you want to continue?
pause

echo.
echo Starting uninstallation...
echo.

REM Run PowerShell uninstaller
PowerShell -ExecutionPolicy Bypass -File "create_simple_installer.ps1" -Uninstall

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ========================================
    echo Uninstallation completed successfully!
    echo ========================================
    echo.
    echo Azure Billing Report Generator has been completely removed from your computer.
    echo.
) else (
    echo.
    echo ========================================
    echo Uninstallation failed!
    echo ========================================
    echo.
    echo Please try running as Administrator or check the error messages above.
    echo.
)

echo.
echo Press any key to exit...
pause >nul
