# Database Table Documentation

This document describes the schema and purpose of each table used in the supply chain analytics project.

## fact_orders_aggregate

**Description:**  
Stores order-level information. One row represents one complete order.

| Column | Description |
|--------|-------------|
order_id | Unique identifier for each order  
customer_id | ID of the customer placing the order  
order_placement_date | Date when the order was placed  
city | City of the customer  
country | Country of the customer  
total_order_value | Total monetary value of the order  

## fact_order_lines

**Description:**  
Stores line-item level details. One row represents one product within an order.

| Column | Description |
|--------|-------------|
order_id | Order identifier (foreign key to fact_orders_aggregate)  
product_id | Product identifier  
order_qty | Quantity ordered  
delivery_qty | Quantity delivered  
on_time | 1 if delivered on time, else 0  
in_full | 1 if delivered in full, else 0  


## dim_customers

**Description:**  
Stores customer master data.

| Column | Description |
|--------|-------------|
customer_id | Unique customer ID  
customer_name | Name of the customer  
city | City of operation  
country | Country of operation  

## dim_products

**Description:**  
Stores product master data.

| Column | Description |
|--------|-------------|
product_id | Unique product ID  
product_name | Name of the product  
category | Product category  

## dim_target_orders

**Description:**  
Stores target order values per customer for performance comparison.

| Column | Description |
|--------|-------------|
customer_id | Customer identifier  
target_orders | Target number of orders for customer  
