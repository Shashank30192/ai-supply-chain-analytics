# Data Dictionary

## fact_aggregate (transactional data )

| Column Name | Description |
|------------|-------------|
order_id | Unique identifier for each order  
customer_id | Unique identifier for customer  
order_placement_date | Date when order was placed  
city | City of the customer  
country | Country of the customer  
total_order_value | Total monetary value of the order  

---

## fact_order_line (Transactional Data)

| Column Name | Description |
|------------|-------------|
order_id | Order identifier (FK to fact_aggregate)  
product_id | Product identifier  
order_qty | Quantity ordered  
delivery_qty | Quantity delivered  
on_time | 1 if delivered on time, else 0  
in_full | 1 if delivered in full, else 0  

---

## dim_customers  (Dimentational Data )

| Column Name | Description |
|------------|-------------|
customer_id | Unique customer identifier  
customer_name | Name of the customer  
city | City of operation  
country | Country of operation  

---

## dim_products (Dimentational Data)

| Column Name | Description |
|------------|-------------|
product_id | Unique product identifier  
product_name | Name of the product  
category | Product category  

---

## dim_target_orders (Dimentational Data)

| Column Name | Description |
|------------|-------------|
customer_id | Customer identifier  
target_orders | Target number of orders for customer  
