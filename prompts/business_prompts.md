# Quadratic Prompts – AI Spreadsheet Analytics

This file documents the prompts used in Quadratic to generate tables, KPIs, and insights.
## Data Ingestion into Quadratic

Quadratic was connected directly to the PostgreSQL (Supabase) database using the built-in SQL connector.  
The following tables were imported into separate sheets using SQL SELECT queries:

- fact_orders_aggregate  
- fact_order_lines  
- dim_customers  
- dim_products  
- dim_target_orders  

Each table was loaded into its own Quadratic sheet to maintain clear separation between fact and dimension data. These sheets were then used as source inputs for data cleaning, transformation, and denormalization into the final `fact_summary` table.

## SQL Queries Used in Quadratic

### fact_orders_aggregate
-----------------------------------------
sql
SELECT 
    order_id,
    customer_id,
    order_placement_date,
    city,
    country,
    total_order_value
FROM fact_orders_aggregate;
-----------------------------------------
SELECT
    order_id,
    product_id,
    order_qty,
    delivery_qty,
    on_time,
    in_full
FROM fact_order_lines;
-----------------------------------------
SELECT
    customer_id,
    customer_name,
    city,
    country
FROM dim_customers;
-----------------------------------------
SELECT
    product_id,
    product_name,
    category
FROM dim_products;
------------------------------------------
SELECT
    customer_id,
    target_orders
FROM dim_target_orders;

## Create Date Dimension Table

Create a date table from 2025-03-01 to 2025-05-31 with the following columns:
- date
- year
- month
- month_name
- week
- day
- day_name

---

## Create Exchange Rate Table

Using OpenExchangeRates API, create an exchange rate table from USD to INR for dates between 2025-03-01 and 2025-05-31.
Columns required:
- date
- usd_to_inr_rate

Round the exchange rate to 4 decimal places.

---

## Create Fact Summary Table

Load data from fact_orders_aggregate, fact_order_lines, dim_customers, dim_products, and dim_target_orders.
Clean the data, remove nulls, convert IDs to integers, convert dates to datetime, and merge all tables into a single denormalized fact_summary table.

Calculate total_order_value_in_inr using exchange rate where required.


## KPI Calculation Prompt

Using the fact_summary table, calculate:
- Total Orders
- Total Order Lines
- Line Fill Rate
- Volume Fill Rate
- On-Time Delivery % (order level)
- In-Full Delivery % (order level)
- OTIF % (order level)

Important:
On-Time and In-Full must be calculated at ORDER LEVEL.  
An order is successful only if all its lines meet the condition.

---

## Business Question Prompt

Using fact_summary data:
- Show monthly OTIF trend
- Show city-wise On-Time % and OTIF %
- Show top 5 customers by revenue with their OTIF %
- Identify problem areas and give 3 business recommendations
