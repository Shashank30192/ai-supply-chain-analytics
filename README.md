# End-to-End Supply Chain Analytics & Automation Pipeline

## Overview
This project simulates a real-world supply chain analytics system where daily sales data is received via email, automatically ingested using n8n, stored in PostgreSQL, transformed into an analytics-ready fact table, and used to calculate critical KPIs such as OTIF, line fill rate, and reliability.

The project demonstrates end-to-end data engineering, analytics engineering, and supply chain domain understanding.

## Architecture
architecture_diagram.drawio.png

**Flow:**
Email (Vendors) → n8n Automation → PostgreSQL (Supabase) → Analytics Layer → KPI Dashboard

## Tech Stack
- n8n (Workflow Automation)
- PostgreSQL (Supabase)
- Python, Pandas
- SQL
- Quadratic (AI-assisted analytics)
- Gmail API

## Data Pipeline Flow
- Vendor sends daily sales CSV files via email  
- n8n Gmail trigger monitors inbox and extracts attachments  
- CSV data is parsed, validated, and transformed  
- Cleaned data is loaded into PostgreSQL fact tables  
- Data is merged into a denormalized `fact_summary` table  
- KPIs are calculated and visualized  

## KPIs Implemented
- Total Orders  
- Line Fill Rate  
- Volume Fill Rate  
- On-Time Delivery % (order level)  
- In-Full Delivery % (order level)  
- **OTIF (On-Time In-Full) % – order level**

## Key Challenges & Learnings
- Debugged date format issues during ingestion (DD-MM-YYYY to ISO format)
- Corrected AI-generated KPI aggregation errors (line-level vs order-level)
- Implemented strict order-level OTIF logic to match real supply chain practice
- Built idempotent email ingestion using Gmail labels to avoid duplication

## Sample Insights
- Identified customers with high revenue but low OTIF
- Detected cities with declining on-time performance
- Observed service reliability gaps across regions

## Future Improvements
- Add Power BI / Tableau dashboard
- Implement real-time ingestion
- Add alerting for low OTIF performance
