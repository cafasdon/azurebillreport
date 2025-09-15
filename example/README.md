# Azure Billing Sample Data

This directory contains **completely fictitious** sample Azure billing data to demonstrate the expected Excel file structure for the Azure Billing Report Generator.

🔒 **Security Notice**: All data in this directory is completely mock/fictitious and contains no real customer information.

## 📁 Files

### **Pay-as-you-go Billing**

- **`AzureBilling_Sample_Structure.xlsx`** - Pay-as-you-go billing sample with hierarchical relationships
- **`create_sample_excel.py`** - Script to generate the Pay-as-you-go sample file

### **Reserved Instances Billing**

- **`RI_Sample_MockData.xlsx`** - Reserved Instances billing sample with completely fictitious data
- **`create_ri_sample.py`** - Script to generate the Reserved Instances sample file

### **Documentation**

- **`README.md`** - This documentation

## 📊 Sample Data Structure

### **Pay-as-you-go Billing Sample**

The Pay-as-you-go sample Excel file contains **5 mock billing records** that demonstrate the hierarchical relationship structure used by Azure billing:

### **Reserved Instances Billing Sample**

The Reserved Instances sample Excel file contains **16 mock billing records** with completely fictitious customer data:

**Mock Customers:**

- **Contoso Corp** - Fictitious technology company
- **Fabrikam Inc** - Fictitious manufacturing company
- **Adventure Works** - Fictitious retail company
- **Northwind Traders** - Fictitious trading company

**Mock Data Features:**

- Fake customer IDs, tenant IDs, and subscription IDs (UUID generated)
- Realistic but fabricated cost amounts ($2,539.08 total)
- Sample Azure Reserved Instance services (VMs, SQL Database, Cosmos DB, App Service)
- 1-3 year reservation terms with upfront pricing
- Customer → Subscription → Product/SKU hierarchy

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
