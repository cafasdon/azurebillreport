# Azure Billing Report Generator - Windows Installer
# Made by Rodrigo Quintian
# Licensed under Apache 2.0 License

!define APPNAME "Azure Billing Report Generator"
!define COMPANYNAME "Rodrigo Quintian"
!define DESCRIPTION "Professional Azure billing report generator with hierarchical resource grouping"
!define VERSIONMAJOR 1
!define VERSIONMINOR 0
!define VERSIONBUILD 0
!define HELPURL "https://github.com/cafasdon/azurebillreport"
!define UPDATEURL "https://github.com/cafasdon/azurebillreport/releases"
!define ABOUTURL "https://github.com/cafasdon/azurebillreport"
!define INSTALLSIZE 1024

RequestExecutionLevel admin
InstallDir "$PROGRAMFILES\${APPNAME}"
LicenseData "LICENSE"
Name "${APPNAME}"
Icon "icon.ico"
outFile "AzureBillingReportGenerator_Setup.exe"

!include LogicLib.nsh

# Modern UI
!include "MUI2.nsh"
!define MUI_ABORTWARNING
!define MUI_ICON "icon.ico"
!define MUI_UNICON "icon.ico"

# Pages
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_LICENSE "LICENSE"
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_WELCOME
!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES
!insertmacro MUI_UNPAGE_FINISH

!insertmacro MUI_LANGUAGE "English"

section "install"
    # Files to install
    setOutPath $INSTDIR
    file "azure_billing_generator.html"
    file "README.md"
    file "LICENSE"
    file "MARKUP_VISIBILITY_GUIDE.md"
    file ".gitignore"
    
    # Example directory
    setOutPath $INSTDIR\example
    file "example\AzureBilling_Sample_Structure.xlsx"
    file "example\README.md"
    file "example\create_sample_excel.py"
    
    # Create desktop shortcut
    createShortCut "$DESKTOP\${APPNAME}.lnk" "$INSTDIR\azure_billing_generator.html" "" "$INSTDIR\icon.ico"
    
    # Create start menu shortcuts
    createDirectory "$SMPROGRAMS\${APPNAME}"
    createShortCut "$SMPROGRAMS\${APPNAME}\${APPNAME}.lnk" "$INSTDIR\azure_billing_generator.html" "" "$INSTDIR\icon.ico"
    createShortCut "$SMPROGRAMS\${APPNAME}\Sample Data.lnk" "$INSTDIR\example\AzureBilling_Sample_Structure.xlsx"
    createShortCut "$SMPROGRAMS\${APPNAME}\Documentation.lnk" "$INSTDIR\README.md"
    createShortCut "$SMPROGRAMS\${APPNAME}\GitHub Repository.lnk" "${HELPURL}"
    createShortCut "$SMPROGRAMS\${APPNAME}\Uninstall.lnk" "$INSTDIR\uninstall.exe"
    
    # Registry information for add/remove programs
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayName" "${APPNAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "UninstallString" "$\"$INSTDIR\uninstall.exe$\""
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "QuietUninstallString" "$\"$INSTDIR\uninstall.exe$\" /S"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "InstallLocation" "$\"$INSTDIR$\""
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayIcon" "$\"$INSTDIR\icon.ico$\""
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "Publisher" "${COMPANYNAME}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "HelpLink" "${HELPURL}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "URLUpdateInfo" "${UPDATEURL}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "URLInfoAbout" "${ABOUTURL}"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "DisplayVersion" "${VERSIONMAJOR}.${VERSIONMINOR}.${VERSIONBUILD}"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "VersionMajor" ${VERSIONMAJOR}
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "VersionMinor" ${VERSIONMINOR}
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "NoRepair" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}" "EstimatedSize" ${INSTALLSIZE}
    
    # Create uninstaller
    writeUninstaller "$INSTDIR\uninstall.exe"
    
    # Success message
    MessageBox MB_OK "Installation completed successfully!$\r$\n$\r$\nDesktop shortcut created: ${APPNAME}$\r$\nStart Menu: Programs > ${APPNAME}$\r$\n$\r$\nClick the desktop shortcut to launch the application."
sectionEnd

# Uninstaller
function un.onInit
    MessageBox MB_OKCANCEL "Are you sure you want to uninstall ${APPNAME}?" IDOK next
        Abort
    next:
functionEnd

section "uninstall"
    # Remove files
    delete "$INSTDIR\azure_billing_generator.html"
    delete "$INSTDIR\README.md"
    delete "$INSTDIR\LICENSE"
    delete "$INSTDIR\MARKUP_VISIBILITY_GUIDE.md"
    delete "$INSTDIR\.gitignore"
    delete "$INSTDIR\icon.ico"
    delete "$INSTDIR\example\AzureBilling_Sample_Structure.xlsx"
    delete "$INSTDIR\example\README.md"
    delete "$INSTDIR\example\create_sample_excel.py"
    rmDir "$INSTDIR\example"
    delete "$INSTDIR\uninstall.exe"
    rmDir "$INSTDIR"
    
    # Remove shortcuts
    delete "$DESKTOP\${APPNAME}.lnk"
    delete "$SMPROGRAMS\${APPNAME}\${APPNAME}.lnk"
    delete "$SMPROGRAMS\${APPNAME}\Sample Data.lnk"
    delete "$SMPROGRAMS\${APPNAME}\Documentation.lnk"
    delete "$SMPROGRAMS\${APPNAME}\GitHub Repository.lnk"
    delete "$SMPROGRAMS\${APPNAME}\Uninstall.lnk"
    rmDir "$SMPROGRAMS\${APPNAME}"
    
    # Remove registry entries
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\${APPNAME}"
sectionEnd
