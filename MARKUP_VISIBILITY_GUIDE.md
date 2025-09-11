# Azure Billing Report Generator - Markup Visibility Guide

## 🔒 **Markup Information Security**

The Azure Billing Report Generator has been designed with **strict markup confidentiality** to ensure sensitive pricing information is never exposed to customers.

## 📊 **Two-Tier Visibility System**

### **1. Account Manager View (Internal Use Only)**
**Location**: Configuration and Preview steps within the interface
**Visibility**: Shows markup details for internal pricing decisions

**What Account Managers See:**
- ✅ Original costs from Azure
- ✅ Markup amounts (£X.XX)
- ✅ Markup percentages (X%)
- ✅ Final costs (original + markup)
- ✅ Side-by-side cost comparison

**Example Display:**
```
Original: £100.00
+£20.00 (20% markup)
Final: £120.00
```

### **2. Customer Report (External Distribution)**
**Location**: Final exported HTML report
**Visibility**: Shows only final costs - NO markup information

**What Customers See:**
- ✅ Final costs only (£120.00)
- ✅ Resource hierarchy and usage details
- ✅ Professional billing breakdown
- ❌ NO markup amounts
- ❌ NO markup percentages
- ❌ NO original costs

**Example Display:**
```
Total Cost: £120.00
```

## 🛡️ **Security Features**

### **Automatic Markup Hiding**
- **Customer Reports**: Automatically use `generateCustomerTreeHTML()` function
- **No Manual Intervention**: Markup information is automatically stripped
- **Clean Presentation**: Only shows final costs to customers

### **Clear Visual Indicators**
- **Preview Warning**: "Account Manager Preview: This preview shows markup details for internal use"
- **Report Distinction**: Customer reports clearly labeled as customer-facing
- **No Markup References**: Customer reports contain no mention of markups

### **Data Flow Security**
```
Azure Data → Apply Markup → Internal Preview → Strip Markup → Customer Report
     ↓              ↓              ↓              ↓              ↓
Raw Costs    +Markup Info    Account Mgr    Remove Markup    Clean Report
                              View Only      Information      for Customer
```

## 📋 **Usage Guidelines**

### **For Account Managers:**
1. **Configure Markup**: Set markup percentages in Step 2
2. **Review Preview**: Check markup calculations in Step 3 (internal view)
3. **Generate Report**: Create customer-facing report in Step 4
4. **Verify Clean Report**: Ensure exported report shows no markup details

### **For Customer Distribution:**
1. **Export Only**: Only share the exported HTML file
2. **Never Share Interface**: Never give customers access to the configuration interface
3. **Clean Reports**: Exported reports automatically hide all markup information

## 🎯 **Key Benefits**

### **Business Protection**
- **Pricing Strategy**: Keeps markup strategies confidential
- **Competitive Advantage**: Protects pricing models from competitors
- **Professional Presentation**: Customers see clean, professional reports

### **Operational Efficiency**
- **No Manual Editing**: Automatic markup hiding eliminates human error
- **Consistent Reports**: All customer reports follow the same clean format
- **Account Manager Tools**: Internal tools for pricing decisions

## 📁 **File Structure**

### **Internal Files (Keep Confidential)**
- `azure_billing_native_interface.html` - Main interface with markup tools
- Configuration data and preview screens

### **Customer Files (Safe to Share)**
- `Azure_Billing_Report_YYYY-MM-DD.html` - Exported customer reports
- Contains no markup information

## ✅ **Verification Checklist**

Before sharing any report with customers:

- [ ] Report exported using "Export HTML" button
- [ ] No markup amounts visible (£X.XX markup)
- [ ] No markup percentages visible (X% markup)
- [ ] No "Original Cost" vs "Final Cost" comparisons
- [ ] Only final costs shown
- [ ] Professional, clean presentation
- [ ] Company branding applied correctly

## 🚨 **Important Notes**

1. **Never share the main interface** (`azure_billing_native_interface.html`) with customers
2. **Only share exported reports** that have been automatically cleaned
3. **Double-check exported reports** before customer distribution
4. **Keep markup configurations confidential** within your organization

This system ensures complete separation between internal pricing tools and customer-facing reports, protecting your business while providing professional service to clients.
