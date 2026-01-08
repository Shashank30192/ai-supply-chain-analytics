-- ===============================
-- FACT TABLES
-- ===============================

CREATE TABLE fact_orders_aggregate (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_placement_date DATE,
    city VARCHAR(100),
    country VARCHAR(50),
    total_order_value NUMERIC
);

CREATE TABLE fact_order_lines (
    order_id INT,
    product_id INT,
    order_qty INT,
    delivery_qty INT,
    on_time INT,
    in_full INT
);

-- ===============================
-- DIMENSION TABLES
-- ===============================

CREATE TABLE dim_customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(150),
    city VARCHAR(100),
    country VARCHAR(50)
);

CREATE TABLE dim_products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(150),
    category VARCHAR(100)
);

CREATE TABLE dim_target_orders (
    customer_id INT,
    target_orders INT
);
