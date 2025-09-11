# Azure Billing Report Generator

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![GitHub stars](https://img.shields.io/github/stars/cafasdon/azurebillreport.svg)](https://github.com/cafasdon/azurebillreport/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/cafasdon/azurebillreport.svg)](https://github.com/cafasdon/azurebillreport/issues)

A professional, web-based tool for generating hierarchical Azure billing reports with markup calculations and customer-safe output.

Transform complex Azure billing Excel files into interactive, hierarchical reports that show resource relationships and dependencies. Perfect for MSPs, consultants, and IT professionals who need to present Azure costs to clients with professional markup handling.

## 🚀 **Quick Start Options**

### **Option 1: Web Browser (Recommended)**

[**Try it now!**](https://cafasdon.github.io/azurebillreport/) - No installation required, works directly in your browser.

### **Option 2: Download Packages**

Choose the package that best fits your needs:

#### 📦 **Download Options**

| Package | Size | Use Case | Download |
|---------|------|----------|----------|
| **Web-Only** | ~500 KB | Quick start, no installation | [Download ZIP](releases/AzureBillingReportGenerator_WebOnly_v1.0.0.zip) |
| **Windows Installer** | ~1 MB | Professional Windows installation | [Download ZIP](releases/AzureBillingReportGenerator_WindowsInstaller_v1.0.0.zip) |
| **Complete Source** | ~2 MB | Development, customization | [Download ZIP](releases/AzureBillingReportGenerator_Complete_v1.0.0.zip) |

#### 🌐 **Web-Only Package**

- Extract and open `azure_billing_generator.html` in any browser
- Includes sample data for immediate testing
- No installation required

#### 💻 **Windows Installer Package**

- Extract and run `INSTALL.bat` as Administrator
- Creates desktop shortcut and Start Menu integration
- Professional Windows installation experience

## ✨ **Key Features**

- 🏗️ **Hierarchical Resource Grouping** - Shows VMs with their dependencies (disks, OS licensing, backup)
- 🔒 **Markup Confidentiality** - Internal pricing tools with customer-safe report export
- 📱 **Native HTML Interface** - Reliable expand/collapse using browser-native elements
- 💰 **Multi-Currency Support** - GBP and USD with automatic detection
- 📊 **Professional Reports** - Clean, branded output suitable for client distribution
- 🌐 **No Server Required** - Runs entirely in your browser with client-side processing

## 📁 Files

### **Core Application**

- **`azure_billing_generator.html`** - Main application interface
  - Complete web-based Azure billing report generator
  - Native HTML collapsible interface (no JavaScript errors)
  - Hierarchical resource grouping with proper Azure relationships
  - Markup calculation tools for account managers
  - Customer-safe report export (markup information automatically hidden)

### **Sample Data**

- **`example/`** - Sample data directory
  - `AzureBilling_Sample_Structure.xlsx` - Mock Azure billing data with correct structure
  - 5 sample records demonstrating hierarchical relationships
  - Perfect for testing and understanding the expected data format

### **Documentation**

- **`MARKUP_VISIBILITY_GUIDE.md`** - Security guide for markup confidentiality
- **`README.md`** - This file

## 🚀 Quick Start

1. **Open the Application**
   - Download `azure_billing_generator.html` from this repository
   - Open it in any modern web browser (Chrome, Firefox, Safari, Edge)

2. **Upload Your Data**
   - Drag and drop your Azure billing Excel file (.xls or .xlsx)
   - Or click "Download Sample" in the interface to get the example file structure

3. **Configure Settings**
   - Select currency (GBP/USD auto-detected)
   - Set markup percentage for sales pricing
   - Add company branding

4. **Preview & Generate**
   - Review hierarchical breakdown with markup details (account manager view)
   - Generate customer-safe report (markup information automatically hidden)
   - Export professional HTML report for client distribution

## 💻 **Windows Installation Package**

For Windows users who prefer a traditional desktop application experience:

### **Installation Features**

- **Desktop Shortcut**: Quick access from desktop
- **Start Menu Integration**: Professional Windows integration
- **Sample Data Included**: Example files for testing
- **Easy Uninstallation**: Standard Windows Add/Remove Programs
- **No Dependencies**: Works with any modern web browser

### **Installation Steps**

1. **Download**: Clone or download this repository
2. **Install**: Run `INSTALL.bat` as Administrator
3. **Launch**: Click desktop shortcut or Start Menu item
4. **Uninstall**: Use `UNINSTALL.bat` or Windows Add/Remove Programs

### **What Gets Installed**

- Application files in `C:\Program Files\Azure Billing Report Generator\`
- Desktop shortcut for easy access
- Start Menu folder with shortcuts to:
  - Main application
  - Sample data files
  - Documentation
  - GitHub repository
  - Uninstaller

See `INSTALLER_README.md` for detailed installation documentation.

## ✨ Key Features

### **Hierarchical Resource Grouping**

- **Resource Groups** → **Resources** → **Products/Meters** → **Usage Items**
- **VM Dependencies**: Shows VMs with their disks, OS licensing, bandwidth
- **Parent-Child Relationships**: Uses Azure `cm-resource-parent` tags
- **Collapsible Interface**: Native HTML `<details>`/`<summary>` elements

### **Markup Confidentiality**

- **Account Manager View**: Shows markup details for internal pricing decisions
- **Customer Reports**: Automatically strips ALL markup information
- **Professional Output**: Clean, branded reports safe for client distribution

### **Reliable Technology**

- **No JavaScript Errors**: Uses native HTML elements instead of complex JS
- **Cross-Browser Compatible**: Works on all modern browsers
- **Self-Contained**: Single HTML file with all dependencies

### **Smart Data Processing**

- **Currency Auto-Detection**: Detects GBP/USD from Azure region data
- **Date Formatting**: Fixes Excel date serial numbers
- **Resource Type Detection**: Automatically categorizes VMs, disks, backup services
- **Cost Aggregation**: Shows individual and rolled-up totals at each level

## 🎯 Use Cases

### **For Account Managers**

- Upload Azure billing data
- Configure markup percentages for sales pricing
- Review detailed cost breakdowns with markup calculations
- Generate professional customer reports

### **For Customers**

- Receive clean, professional billing reports
- Explore hierarchical resource breakdown
- Understand Azure service costs and usage
- No exposure to internal markup information

## 🔒 Security

- **Markup Protection**: Customer reports never show markup details
- **Automatic Cleaning**: Markup information automatically stripped from exports
- **Professional Presentation**: Clean, branded output suitable for client distribution

## 📊 Supported Data

- **Azure Usage Summary** Excel files (.xls, .xlsx)
- **Large Datasets**: Supports thousands of records efficiently
- **Multiple Currencies**: GBP and USD support
- **All Azure Services**: VMs, storage, backup, networking, etc.

## 🛠️ Technical Requirements

- **Modern Web Browser**: Chrome, Firefox, Safari, Edge
- **No Installation**: Runs entirely in the browser
- **No Server Required**: Client-side processing only
- **Excel Support**: Built-in Excel file reading capability

## 📸 **Screenshots**

### Main Interface

![Upload Interface](https://via.placeholder.com/800x400/f8f9fa/6c757d?text=Azure+Billing+Report+Generator+Interface)

### Hierarchical Report View

![Hierarchical Report](https://via.placeholder.com/800x400/e3f2fd/1976d2?text=Hierarchical+Resource+Breakdown)

## 🏗️ **Architecture**

### Technology Stack

- **Frontend**: HTML5, CSS3, Bootstrap 5, Font Awesome
- **Processing**: Client-side JavaScript with SheetJS for Excel parsing
- **UI Components**: Native HTML `<details>`/`<summary>` elements for reliability
- **Dependencies**: All included via CDN - no installation required

### Data Flow

```
Azure Excel File → Upload → Parse → Group Hierarchically → Apply Markup → Generate Report
     ↓                ↓        ↓            ↓                ↓              ↓
Raw Billing Data → Validation → Processing → Resource Tree → Pricing → Customer Report
```

## 🤝 **Contributing**

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

1. Fork the repository
2. Clone your fork: `git clone https://github.com/yourusername/azurebillreport.git`
3. Make your changes to `azure_billing_generator.html`
4. Test thoroughly with sample data
5. Submit a pull request

## 📝 **License**

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 **Author**

**Rodrigo Quintian** - [GitHub](https://github.com/cafasdon)

## 🙏 **Acknowledgments**

- Built with modern web standards for maximum compatibility
- Uses SheetJS for reliable Excel file processing
- Bootstrap 5 for responsive, professional UI design
- Font Awesome for consistent iconography

---

**Ready to transform your Azure billing data?** [**Get started now!**](https://cafasdon.github.io/azurebillreport/)
