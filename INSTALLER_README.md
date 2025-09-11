# Azure Billing Report Generator - Windows Installer

This directory contains everything needed to create a Windows installer for the Azure Billing Report Generator.

## 📦 **What the Installer Does**

### **Installation Features**
- **Program Files Installation**: Installs to `C:\Program Files\Azure Billing Report Generator\`
- **Desktop Shortcut**: Creates a desktop shortcut for easy access
- **Start Menu Integration**: Adds shortcuts to Windows Start Menu
- **Sample Data**: Includes example Excel file for testing
- **Documentation**: Installs all documentation files
- **Uninstaller**: Provides clean uninstallation through Windows Add/Remove Programs

### **Shortcuts Created**
- **Desktop**: `Azure Billing Report Generator.lnk` → Opens the application
- **Start Menu Folder**: `Azure Billing Report Generator`
  - `Azure Billing Report Generator.lnk` → Main application
  - `Sample Data.lnk` → Opens sample Excel file
  - `Documentation.lnk` → Opens README.md
  - `GitHub Repository.lnk` → Opens project GitHub page
  - `Uninstall.lnk` → Uninstalls the application

## 🛠️ **Building the Installer**

### **Prerequisites**
1. **NSIS (Nullsoft Scriptable Install System)**
   - Download from: https://nsis.sourceforge.io/Download
   - Install and add to Windows PATH

2. **Python (for icon generation)**
   - Python 3.6+ with Pillow library
   - Run: `pip install Pillow`

### **Required Files**
Ensure these files are present in the directory:
- `azure_billing_generator.html` - Main application
- `README.md` - Documentation
- `LICENSE` - License file
- `MARKUP_VISIBILITY_GUIDE.md` - Security guide
- `.gitignore` - Git ignore file
- `example/AzureBilling_Sample_Structure.xlsx` - Sample data
- `example/README.md` - Sample documentation
- `example/create_sample_excel.py` - Sample generator script

### **Build Process**

#### **Option 1: Automated Build (Recommended)**
```batch
# Run the automated build script
build_installer.bat
```

#### **Option 2: Manual Build**
```batch
# 1. Create icon (if needed)
python create_icon.py

# 2. Build installer with NSIS
makensis installer.nsi
```

### **Output**
- **Installer File**: `AzureBillingReportGenerator_Setup.exe`
- **Size**: Approximately 1-2 MB
- **Signed**: No (can be code-signed separately if needed)

## 📋 **Installer Features**

### **Professional Installation Experience**
- **Welcome Screen**: Professional installer welcome page
- **License Agreement**: Shows Apache 2.0 license
- **Installation Directory**: Allows custom installation path
- **Progress Indicator**: Shows installation progress
- **Completion Screen**: Confirms successful installation

### **Windows Integration**
- **Add/Remove Programs**: Appears in Windows Programs list
- **Registry Entries**: Proper Windows registry integration
- **Version Information**: Displays version 1.0.0
- **Publisher Information**: Shows "Rodrigo Quintian"
- **Help Links**: Links to GitHub repository

### **Clean Uninstallation**
- **Complete Removal**: Removes all files and shortcuts
- **Registry Cleanup**: Removes all registry entries
- **Confirmation Dialog**: Asks for confirmation before uninstalling

## 🎯 **Distribution**

### **Installer Properties**
- **File Name**: `AzureBillingReportGenerator_Setup.exe`
- **Version**: 1.0.0
- **Publisher**: Rodrigo Quintian
- **License**: Apache 2.0
- **Requirements**: Windows 7+ with modern web browser

### **Installation Requirements**
- **Operating System**: Windows 7, 8, 10, 11
- **Disk Space**: ~5 MB
- **Browser**: Any modern web browser (Chrome, Firefox, Edge, Safari)
- **Permissions**: Administrator rights for installation

### **User Experience**
1. **Download**: User downloads `AzureBillingReportGenerator_Setup.exe`
2. **Run**: Double-click to start installation
3. **Install**: Follow installation wizard
4. **Launch**: Click desktop shortcut to open application
5. **Use**: Upload Azure billing files and generate reports

## 🔧 **Customization**

### **Modifying the Installer**
Edit `installer.nsi` to customize:
- **Installation directory**: Change `InstallDir`
- **Application name**: Modify `APPNAME` define
- **Version numbers**: Update `VERSIONMAJOR`, `VERSIONMINOR`, `VERSIONBUILD`
- **Company information**: Change `COMPANYNAME`
- **URLs**: Update help and support URLs

### **Icon Customization**
- **Replace**: Replace `icon.ico` with your custom icon
- **Regenerate**: Modify `create_icon.py` and run to create new icon
- **Formats**: Icon should include multiple sizes (16x16 to 256x256)

### **Adding Files**
To include additional files in the installer:
1. Add files to the `section "install"` in `installer.nsi`
2. Add corresponding delete commands in `section "uninstall"`
3. Update file size estimate in `INSTALLSIZE` define

## 🚀 **Advanced Features**

### **Silent Installation**
```batch
# Install silently without user interaction
AzureBillingReportGenerator_Setup.exe /S

# Install to custom directory
AzureBillingReportGenerator_Setup.exe /S /D=C:\MyCustomPath
```

### **Command Line Options**
- `/S` - Silent installation
- `/D=path` - Custom installation directory
- `/NCRC` - Skip CRC check (not recommended)

### **Code Signing (Optional)**
To add digital signature for enhanced security:
```batch
# Sign the installer (requires code signing certificate)
signtool sign /f certificate.pfx /p password AzureBillingReportGenerator_Setup.exe
```

## 📝 **Troubleshooting**

### **Common Issues**

#### **NSIS Not Found**
- **Problem**: `makensis` command not recognized
- **Solution**: Install NSIS and add to Windows PATH

#### **Missing Files**
- **Problem**: Build fails due to missing files
- **Solution**: Ensure all required files are present in directory

#### **Icon Creation Fails**
- **Problem**: Python or Pillow not available
- **Solution**: Install Python and run `pip install Pillow`

#### **Permission Denied**
- **Problem**: Cannot install to Program Files
- **Solution**: Run installer as Administrator

### **Support**
- **GitHub Issues**: https://github.com/cafasdon/azurebillreport/issues
- **Documentation**: https://github.com/cafasdon/azurebillreport
- **License**: Apache 2.0 - see LICENSE file

---

**Ready to create professional Windows installers for the Azure Billing Report Generator!**
