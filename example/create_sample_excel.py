#!/usr/bin/env python3
"""
Create a sample Azure billing Excel file with the correct structure
for testing the Azure Billing Report Generator.
"""

import pandas as pd
from datetime import datetime, timedelta
import random

def create_sample_azure_billing():
    """Create a sample Azure billing Excel file with realistic structure."""
    
    # Sample data that matches Azure billing format
    sample_data = [
        {
            'Usage Date': '2025-07-15',
            'Product Name': 'Virtual Machines',
            'Meter Name': 'D2s v3',
            'Resource Group': 'production-rg',
            'Resource Name': 'vm-web-server-01',
            'Meter Region': 'UK South',
            'Unit Price': 0.096,
            'Quantity': 24.0,
            'Total Cost': 2.304,
            'Currency': 'GBP',
            'Tags': 'environment=production;owner=it-team'
        },
        {
            'Usage Date': '2025-07-15',
            'Product Name': 'Storage',
            'Meter Name': 'Premium SSD Managed Disks',
            'Resource Group': 'production-rg',
            'Resource Name': 'vm-web-server-01_OsDisk',
            'Meter Region': 'UK South',
            'Unit Price': 0.0512,
            'Quantity': 1.0,
            'Total Cost': 0.0512,
            'Currency': 'GBP',
            'Tags': 'cm-resource-parent=vm-web-server-01;environment=production'
        },
        {
            'Usage Date': '2025-07-15',
            'Product Name': 'Virtual Machines',
            'Meter Name': 'Windows Server License',
            'Resource Group': 'production-rg',
            'Resource Name': 'vm-web-server-01',
            'Meter Region': 'UK South',
            'Unit Price': 0.048,
            'Quantity': 24.0,
            'Total Cost': 1.152,
            'Currency': 'GBP',
            'Tags': 'cm-resource-parent=vm-web-server-01;environment=production'
        },
        {
            'Usage Date': '2025-07-15',
            'Product Name': 'Backup',
            'Meter Name': 'VM Backup Instance',
            'Resource Group': 'backup-rg',
            'Resource Name': 'backup-vm-web-server-01',
            'Meter Region': 'UK South',
            'Unit Price': 5.00,
            'Quantity': 1.0,
            'Total Cost': 5.00,
            'Currency': 'GBP',
            'Tags': 'cm-resource-parent=vm-web-server-01;backup-policy=daily'
        },
        {
            'Usage Date': '2025-07-15',
            'Product Name': 'Bandwidth',
            'Meter Name': 'Data Transfer Out',
            'Resource Group': 'production-rg',
            'Resource Name': 'vm-web-server-01',
            'Meter Region': 'UK South',
            'Unit Price': 0.087,
            'Quantity': 2.5,
            'Total Cost': 0.2175,
            'Currency': 'GBP',
            'Tags': 'environment=production;data-type=outbound'
        }
    ]
    
    # Create DataFrame
    df = pd.DataFrame(sample_data)
    
    # Save to Excel file
    output_file = 'AzureBilling_Sample_Structure.xlsx'
    df.to_excel(output_file, index=False, sheet_name='Usage Summary')
    
    print(f"✅ Created sample Excel file: {output_file}")
    print(f"📊 Contains {len(sample_data)} sample records")
    print(f"💰 Total sample cost: £{df['Total Cost'].sum():.4f}")
    print("\n📋 File structure matches Azure billing format:")
    print("- Usage Date: Daily billing records")
    print("- Resource hierarchy: Resource Group → Resource → Product/Meter")
    print("- Parent-child relationships: cm-resource-parent tags link dependencies")
    print("- Currency: GBP/USD support")
    print("- Realistic Azure service types: VMs, Storage, Backup, Bandwidth")

if __name__ == "__main__":
    create_sample_azure_billing()
