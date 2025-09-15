# Azure Billing Report Generator

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![GitHub stars](https://img.shields.io/github/stars/cafasdon/azurebillreport.svg)](https://github.com/cafasdon/azurebillreport/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/cafasdon/azurebillreport.svg)](https://github.com/cafasdon/azurebillreport/issues)

A professional, web-based tool for generating hierarchical Azure billing reports with automatic billing type detection, markup calculations, and customer-safe output.

Transform complex Azure billing files (Excel and CSV) into interactive, hierarchical reports that show resource relationships and dependencies. Supports both **Pay-as-you-go** and **Reserved Instances** billing with intelligent automatic detection. Perfect for MSPs, consultants, and IT professionals who need to present Azure costs to clients with professional markup handling.

## 🚀 **Live Demo**

[**Try it now!**](https://cafasdon.github.io/azurebillreport/) - No installation required, works directly in your browser.

## 📥 **Quick Start**

### **Option 1: Use Online (Recommended)**

- Visit the [live demo](https://cafasdon.github.io/azurebillreport/)
- Upload your Azure billing file (Excel or CSV, Pay-as-you-go or Reserved Instances)
- System automatically detects billing type
- Generate professional reports instantly

### **Option 2: Download for Offline Use**

- Download `azure_billing_generator.html` from this repository
- Open it in any modern web browser
- Works completely offline with no dependencies
- Supports both billing types with automatic detection

## ✨ **Key Features**

- 🤖 **Automatic Billing Type Detection** - Intelligently detects Pay-as-you-go vs Reserved Instances billing
- 🏗️ **Hierarchical Resource Grouping** - Shows VMs with their dependencies (disks, OS licensing, backup)
- 🔒 **Markup Confidentiality** - Internal pricing tools with customer-safe report export
- 📱 **Native HTML Interface** - Reliable expand/collapse using browser-native elements
- 💰 **Standardized Currency** - All reports use GBP (£) for consistent billing
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
  - `AzureBilling_Sample_Structure.xlsx` - Pay-as-you-go billing sample with hierarchical relationships
  - `RI_Sample_MockData.xlsx` - Reserved Instances billing sample with completely fictitious data
  - Perfect for testing automatic billing type detection and understanding expected data formats

### **Documentation**

- **`MARKUP_VISIBILITY_GUIDE.md`** - Security guide for markup confidentiality
- **`README.md`** - This file

## 📋 **How to Use**

1. **Access the Application**
   - Visit [https://cafasdon.github.io/azurebillreport/](https://cafasdon.github.io/azurebillreport/)
   - Or download `azure_billing_generator.html` and open in any browser

2. **Upload Your Data**
   - Drag and drop your Azure billing file (.xls, .xlsx, or .csv)
   - System automatically detects Pay-as-you-go or Reserved Instances billing type
   - Download sample files to see expected formats for both billing types

3. **Configure Settings**
   - Set markup percentage for sales pricing
   - Add company branding (all reports use standardized GBP currency)

4. **Preview & Generate**
   - Review hierarchical breakdown with markup details (account manager view)
   - Generate customer-safe report (markup information automatically hidden)
   - Export professional HTML report for client distribution

## ✨ Key Features

### **Automatic Billing Type Detection**

- **Intelligent Analysis**: Automatically detects Pay-as-you-go vs Reserved Instances billing
- **Column-Based Detection**: Analyzes file structure to determine billing type
- **Error Prevention**: Eliminates human error in billing type selection
- **Instant Feedback**: Shows detected billing type immediately upon upload

### **Dual Billing Type Support**

- **Pay-as-you-go**: Resource Groups → Resources → Products/Meters → Usage Items
- **Reserved Instances**: Customers → Subscriptions → Products/SKUs → Billing Items
- **Unified Interface**: Same professional reports for both billing types

### **Hierarchical Resource Grouping**

- **VM Dependencies**: Shows VMs with their disks, OS licensing, bandwidth
- **Parent-Child Relationships**: Uses Azure `cm-resource-parent` tags for Pay-as-you-go
- **Subscription Grouping**: Customer and subscription hierarchy for Reserved Instances
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

- **Billing Type Detection**: Automatically identifies Pay-as-you-go vs Reserved Instances
- **Multi-Format Support**: Seamlessly handles Excel (.xls, .xlsx) and CSV (.csv) files
- **Standardized Currency**: All reports use GBP (£) for consistent billing
- **Date Formatting**: Fixes Excel date serial numbers
- **Resource Type Detection**: Automatically categorizes VMs, disks, backup services
- **Cost Aggregation**: Shows individual and rolled-up totals at each level

### **File Format Support**

- **Excel Files (.xls, .xlsx)**: Full support for Microsoft Excel formats using SheetJS
- **CSV Files (.csv)**: Robust CSV parsing with Papa Parse library
- **Automatic Detection**: System automatically determines file type and uses appropriate parser
- **Header Handling**: Intelligent header detection and whitespace trimming for CSV files
- **Error Handling**: Comprehensive validation and error reporting for both formats

## 🎯 Use Cases

### **For Account Managers**

- Upload Azure billing data (Pay-as-you-go or Reserved Instances)
- System automatically detects billing type
- Configure markup percentages for sales pricing
- Review detailed cost breakdowns with markup calculations
- Generate professional customer reports

### **For Customers**

- Receive clean, professional billing reports
- Explore hierarchical resource breakdown (both billing types supported)
- Understand Azure service costs and usage
- No exposure to internal markup information

## 🔒 Security

- **Markup Protection**: Customer reports never show markup details
- **Automatic Cleaning**: Markup information automatically stripped from exports
- **Professional Presentation**: Clean, branded output suitable for client distribution

## 📊 Supported Data

- **Pay-as-you-go Billing**: Azure Usage Summary files (Excel or CSV) with resource groups and hierarchical relationships
- **Reserved Instances Billing**: Azure Reserved Instances reports (Excel or CSV) with customer and subscription data
- **Automatic Detection**: System intelligently identifies billing type from file structure
- **Large Datasets**: Supports thousands of records efficiently
- **Standardized Currency**: All reports use GBP (£) for consistent billing
- **All Azure Services**: VMs, storage, backup, networking, reserved capacity, etc.

## 🛠️ Technical Requirements

- **Modern Web Browser**: Chrome, Firefox, Safari, Edge
- **No Installation**: Runs entirely in the browser
- **No Server Required**: Client-side processing only
- **File Support**: Built-in Excel (.xls, .xlsx) and CSV (.csv) file reading capability

## 📸 **Screenshots**

### Main Interface

![Upload Interface](https://via.placeholder.com/800x400/f8f9fa/6c757d?text=Azure+Billing+Report+Generator+Interface)

### Hierarchical Report View

![Hierarchical Report](https://via.placeholder.com/800x400/e3f2fd/1976d2?text=Hierarchical+Resource+Breakdown)

## 🏗️ **Architecture**

### Technology Stack

- **Frontend**: HTML5, CSS3, Bootstrap 5, Font Awesome
- **Processing**: Client-side JavaScript with SheetJS for Excel parsing and Papa Parse for CSV parsing
- **UI Components**: Native HTML `<details>`/`<summary>` elements for reliability
- **Dependencies**: All included via CDN - no installation required

### Data Flow

```text
Azure File (Excel/CSV) → Upload → Auto-Detect Type → Parse → Group Hierarchically → Apply Markup → Generate Report
     ↓                ↓           ↓             ↓            ↓                ↓              ↓
Raw Billing Data → Validation → Type Detection → Processing → Resource Tree → Pricing → Customer Report
                                (PayG/RI)
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
- Uses SheetJS for reliable Excel file processing and Papa Parse for CSV parsing
- Bootstrap 5 for responsive, professional UI design
- Font Awesome for consistent iconography

---

**Ready to transform your Azure billing data?** [**Get started now!**](https://cafasdon.github.io/azurebillreport/)
