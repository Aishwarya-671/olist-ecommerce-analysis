-- Load the raw Olist CSVs into DuckDB.
-- Run from the project root: duckdb olist.duckdb < sql/00_load/01_load_raw_tables.sql
-- Safe to rerun: CREATE OR REPLACE rebuilds each table from the CSV.

CREATE SCHEMA IF NOT EXISTS raw;

-- Zip code prefixes are read as text so leading zeros (e.g. 01310) are kept.
CREATE OR REPLACE TABLE raw.customers AS
SELECT * FROM read_csv('data/raw/olist_customers_dataset.csv',
    types = {'customer_zip_code_prefix': 'VARCHAR'});

CREATE OR REPLACE TABLE raw.sellers AS
SELECT * FROM read_csv('data/raw/olist_sellers_dataset.csv',
    types = {'seller_zip_code_prefix': 'VARCHAR'});

CREATE OR REPLACE TABLE raw.geolocation AS
SELECT * FROM read_csv('data/raw/olist_geolocation_dataset.csv',
    types = {'geolocation_zip_code_prefix': 'VARCHAR'});

CREATE OR REPLACE TABLE raw.orders AS
SELECT * FROM read_csv('data/raw/olist_orders_dataset.csv');

CREATE OR REPLACE TABLE raw.order_items AS
SELECT * FROM read_csv('data/raw/olist_order_items_dataset.csv');

CREATE OR REPLACE TABLE raw.order_payments AS
SELECT * FROM read_csv('data/raw/olist_order_payments_dataset.csv');

CREATE OR REPLACE TABLE raw.order_reviews AS
SELECT * FROM read_csv('data/raw/olist_order_reviews_dataset.csv');

CREATE OR REPLACE TABLE raw.products AS
SELECT * FROM read_csv('data/raw/olist_products_dataset.csv');

CREATE OR REPLACE TABLE raw.category_translation AS
SELECT * FROM read_csv('data/raw/product_category_name_translation.csv');