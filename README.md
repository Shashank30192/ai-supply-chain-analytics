# End-to-End Supply Chain Analytics & Automation Pipeline

## Overview
This project simulates a real-world supply chain analytics system where daily sales data is received via email, automatically ingested using n8n, stored in PostgreSQL, transformed into an analytics-ready fact table, and used to calculate critical KPIs such as OTIF, line fill rate, and reliability.

The project demonstrates end-to-end data engineering, analytics engineering, and supply chain domain understanding.

## Architecture
architecture_diagram.drawio.png

**Flow:**
Email (Vendors) → n8n Automation → PostgreSQL (Supabase) → Analytics Layer → KPI Dashboard

Tech Stack
Workflow Automation
n8n – Used to build automated workflows for monitoring Gmail inbox, extracting CSV attachments, transforming data, and loading it into PostgreSQL. Enabled end-to-end automation without manual intervention.
Database
PostgreSQL (Supabase) – Central relational database used to store fact and dimension tables. Supabase was used as the managed PostgreSQL service for easy hosting, scalability, and secure access.
Programming & Data Processing
Python – Used for data transformation and processing inside Quadratic.
Pandas – Used for data cleaning, type conversion, merging fact and dimension tables, and building the final fact_summary table.
Query Language
SQL – Used to design schema, create tables, and extract data from PostgreSQL into Quadratic for analytics.
AI-Assisted Analytics
Quadratic – Used as the analytics layer to perform AI-assisted data transformations, KPI calculations, and business analysis using natural language prompts and Python code generation.
Email Integration
Gmail API – Used by n8n to monitor inbox for incoming sales files and trigger workflows.
Gmail OAuth Configuration – Configured OAuth credentials to securely authenticate and authorize access to Gmail inbox for automated data ingestion.
Infrastructure & Setup
Supabase Project Setup – Used to create and manage PostgreSQL database instance, tables, and access credentials.
Database Schema Design – Implemented fact and dimension tables to support order-level and line-level analysis.

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


## Future Improvements
- Add Power BI / Tableau dashboard
- Implement real-time ingestion
- Add alerting for low OTIF performance
