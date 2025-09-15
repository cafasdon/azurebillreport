#!/usr/bin/env python3
"""
Create a mock Reserved Instances Azure billing Excel file with completely fictitious data
that demonstrates the same structure as real RI billing files.
"""

import pandas as pd
from datetime import datetime, timedelta
import uuid
import random

def generate_mock_guid():
    """Generate a mock GUID that looks realistic but is completely fake."""
    return str(uuid.uuid4())

def generate_mock_customer_id():
    """Generate a mock customer ID."""
    return f"mock{random.randint(10000000, 99999999)}-{random.randint(10000000, 99999999)}"

def create_mock_ri_billing():
    """Create a mock Reserved Instances billing Excel file with realistic structure."""
    
    # Mock customer data
    customers = [
        "Contoso Corp",
        "Fabrikam Inc", 
        "Adventure Works",
        "Northwind Traders"
    ]
    
    # Mock Azure RI products and SKUs
    ri_products = [
        {
            "Product Name": "Virtual Machines Dv3 Series",
            "Sku Name": "Reserved VM Instance, Standard_D4s_v3, East US, 1 Year",
            "Unit Price": 85.50,
            "Quantity": 2
        },
        {
            "Product Name": "Virtual Machines Ev3 Series", 
            "Sku Name": "Reserved VM Instance, Standard_E8s_v3, West Europe, 3 Years",
            "Unit Price": 120.75,
            "Quantity": 1
        },
        {
            "Product Name": "SQL Database",
            "Sku Name": "Reserved SQL Database, S2, East US, 1 Year", 
            "Unit Price": 45.25,
            "Quantity": 3
        },
        {
            "Product Name": "Virtual Machines Fsv2 Series",
            "Sku Name": "Reserved VM Instance, Standard_F4s_v2, North Europe, 1 Year",
            "Unit Price": 95.80,
            "Quantity": 1
        },
        {
            "Product Name": "Cosmos DB",
            "Sku Name": "Reserved Cosmos DB, 1000 RU/s, West US, 3 Years",
            "Unit Price": 65.40,
            "Quantity": 2
        },
        {
            "Product Name": "Virtual Machines Bs Series",
            "Sku Name": "Reserved VM Instance, Standard_B2ms, UK South, 1 Year", 
            "Unit Price": 35.60,
            "Quantity": 4
        },
        {
            "Product Name": "App Service",
            "Sku Name": "Reserved App Service, P1v2, Central US, 1 Year",
            "Unit Price": 55.90,
            "Quantity": 2
        },
        {
            "Product Name": "Virtual Machines Dv4 Series",
            "Sku Name": "Reserved VM Instance, Standard_D8s_v4, Australia East, 3 Years",
            "Unit Price": 140.25,
            "Quantity": 1
        }
    ]
    
    # Generate mock data
    mock_data = []
    base_date = datetime(2025, 8, 1)
    
    for i, product in enumerate(ri_products):
        # Create multiple entries for some products to simulate real billing
        num_entries = random.randint(1, 3)
        
        for j in range(num_entries):
            customer = random.choice(customers)
            customer_id = generate_mock_customer_id()
            tenant_id = generate_mock_guid()
            subscription_id = generate_mock_guid()
            
            # Generate realistic date ranges
            start_date = base_date + timedelta(days=random.randint(0, 30))
            if "3 Years" in product["Sku Name"]:
                end_date = start_date + timedelta(days=365*3)
            else:
                end_date = start_date + timedelta(days=365)
            
            billing_period = start_date.strftime("%Y-%m")
            
            # Calculate costs with some variation
            quantity = product["Quantity"] + random.randint(-1, 2)
            if quantity < 1:
                quantity = 1
                
            unit_price = product["Unit Price"] * random.uniform(0.9, 1.1)  # Add some price variation
            sub_total = quantity * unit_price
            
            record = {
                'CustomerId': customer_id,
                'Customer Name': customer,
                'Billing Period': billing_period,
                'Product Name': product["Product Name"],
                'Sku Name': product["Sku Name"],
                'Publisher Name': 'Microsoft',
                'Customer TenantId': tenant_id,
                'Subscription Id': subscription_id,
                'Subscription StartDate': start_date,
                'Subscription EndDate': end_date,
                'Quantity': quantity,
                'Unit Price': round(unit_price, 6),
                'Sub Total': round(sub_total, 2),
                'Product Category': 'Azure Reservations'
            }
            
            mock_data.append(record)
    
    # Create DataFrame
    df = pd.DataFrame(mock_data)
    
    # Save to Excel file
    output_file = 'RI_Sample_MockData.xlsx'
    df.to_excel(output_file, index=False, sheet_name='Reserved Instances')
    
    print(f"✅ Created mock Reserved Instances Excel file: {output_file}")
    print(f"📊 Contains {len(mock_data)} sample records")
    print(f"💰 Total sample cost: ${df['Sub Total'].sum():.2f}")
    print(f"👥 Mock customers: {len(df['Customer Name'].unique())}")
    print(f"🔑 Mock subscriptions: {len(df['Subscription Id'].unique())}")
    print("\n📋 File structure matches Azure RI billing format:")
    print("- Customer hierarchy: Customer → Subscription → Product/SKU")
    print("- Reserved Instances: 1-3 year commitments with upfront pricing")
    print("- Realistic Azure service types: VMs, SQL Database, Cosmos DB, App Service")
    print("- Completely fictitious data - no real customer information")

if __name__ == "__main__":
    create_mock_ri_billing()
