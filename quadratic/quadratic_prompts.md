# Quadratic Prompts – AI Spreadsheet Analytics

This document contains all prompts used inside Quadratic for data preparation, transformation, KPI calculation, and business analysis.

---

## 1. Create Date Dimension Table

Create a date table from 2025-03-01 to 2025-05-31 with the following columns:
- date
- year
- month
- month_name
- week
- day
- day_name

---

## 2. Create Exchange Rate Table

Using OpenExchangeRates API, create an exchange rate table from USD to INR for dates between 2025-03-01 and 2025-05-31.

Columns required:
- date
- usd_to_inr_rate

Round the exchange rate to 4 decimal places.

---

## 3. Create Fact Summary Table

Load data from:
- fact_orders_aggregate
- fact_order_lines
- dim_customers
- dim_products
- dim_target_orders
- exchange_rate

Clean the data, remove nulls, convert IDs to integers, convert dates to datetime, and merge all tables into a single denormalized `fact_summary` table.

Calculate `total_order_value_in_inr` using exchange rate where required.

---

## 4. KPI Calculation Prompt

Using the `fact_summary` table, calculate:
1. Total Orders  
2. Total Order Lines  
3. Line Fill Rate  
4. Volume Fill Rate  
5. On-Time Delivery % (order level)  
6. In-Full Delivery % (order level)  
7. OTIF % (order level)  

Important:
- On-Time and In-Full must be calculated at **ORDER LEVEL**
- An order is successful only if **all its lines meet the condition**

---

## 5. Business Insight Prompt

Using `fact_summary` data:

- Show monthly OTIF trend  
- Show city-wise On-Time % and OTIF %  
- Show top 5 customers by revenue with their OTIF %  
- Identify problem areas and give 3 business recommendations  
