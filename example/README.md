# Azure Billing Sample Data

This directory contains sample Azure billing data to demonstrate the expected Excel file structure for the Azure Billing Report Generator.

## 📁 Files

- **`AzureBilling_Sample_Structure.xlsx`** - Sample Excel file with correct Azure billing structure
- **`create_sample_excel.py`** - Script to generate the sample file
- **`README.md`** - This documentation

## 📊 Sample Data Structure

The sample Excel file contains **5 mock billing records** that demonstrate the hierarchical relationship structure used by Azure billing:

### **Resource Hierarchy Example**
```
📁 production-rg (Resource Group)
├── 🖥️ vm-web-server-01 (Virtual Machine)
│   ├── 💾 vm-web-server-01_OsDisk (Storage Disk)
│   ├── 🪟 Windows Server License
│   └── 🌐 Data Transfer Out
└── 📊 Total: £3.7247

📁 backup-rg (Resource Group)
├── 🛡️ backup-vm-web-server-01 (Backup Service)
└── 📊 Total: £5.00
```

### **Required Excel Columns**

| Column Name | Description | Example |
|-------------|-------------|---------|
| **Usage Date** | Daily billing date | 2025-07-15 |
| **Product Name** | Azure service category | Virtual Machines, Storage, Backup |
| **Meter Name** | Specific service meter | D2s v3, Premium SSD Managed Disks |
| **Resource Group** | Azure resource group | production-rg, backup-rg |
| **Resource Name** | Individual resource name | vm-web-server-01, vm-web-server-01_OsDisk |
| **Meter Region** | Azure region | UK South, East US |
| **Unit Price** | Cost per unit | 0.096 |
| **Quantity** | Usage quantity | 24.0 (hours), 1.0 (disk) |
| **Total Cost** | Line item total cost | 2.304 |
| **Currency** | Billing currency | GBP, USD |
| **Tags** | Azure resource tags | cm-resource-parent=vm-web-server-01 |

### **Key Structure Elements**

#### **1. Parent-Child Relationships**
- **`cm-resource-parent` tag**: Links child resources to their parent
- **Example**: Disk `vm-web-server-01_OsDisk` has tag `cm-resource-parent=vm-web-server-01`
- **Result**: Disk appears under the VM in hierarchical view

#### **2. Resource Naming Conventions**
- **VMs**: `vm-web-server-01`, `vm-database-prod`
- **Disks**: `{vm-name}_OsDisk`, `{vm-name}_DataDisk01`
- **Backup**: `backup-{resource-name}`

#### **3. Service Categories**
- **Virtual Machines**: Compute costs, OS licensing
- **Storage**: Managed disks, blob storage
- **Backup**: VM backup instances, storage
- **Bandwidth**: Data transfer in/out

## 🎯 Usage

### **Testing the Application**
1. Open `azure_billing_generator.html` in your browser
2. Upload `AzureBilling_Sample_Structure.xlsx`
3. Configure markup and settings
4. Generate hierarchical report

### **Creating Your Own Sample Data**
```bash
python create_sample_excel.py
```

### **Adapting for Your Data**
- Ensure your Excel file has all required columns
- Use `cm-resource-parent` tags to establish resource relationships
- Follow Azure naming conventions for automatic resource type detection

## 🔍 Data Validation

The sample data demonstrates:
- ✅ **Proper date formatting** (YYYY-MM-DD)
- ✅ **Hierarchical relationships** (parent-child via tags)
- ✅ **Multiple resource groups** (production-rg, backup-rg)
- ✅ **Various service types** (VM, Storage, Backup, Bandwidth)
- ✅ **Currency consistency** (all GBP)
- ✅ **Realistic pricing** (based on actual Azure rates)

## 📋 Expected Output

When processed by the Azure Billing Report Generator, this sample data will show:

- **2 Resource Groups** with proper hierarchy
- **1 Virtual Machine** with 4 associated services
- **Collapsible interface** showing VM dependencies
- **Total cost**: £8.72 (before markup)
- **Professional report** suitable for customer distribution

This sample structure ensures your real Azure billing data will be processed correctly by the report generator.
