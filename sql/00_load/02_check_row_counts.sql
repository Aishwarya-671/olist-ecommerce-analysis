-- Row counts for every raw table: the first check after any load.

SELECT 'orders'              
 AS table_name, COUNT(*) AS row_count FROM raw.orders
UNION ALL SELECT 'order_items', COUNT(*) FROM raw.order_items
UNION ALL SELECT 'order_payments', COUNT(*) FROM raw.order_payments
UNION ALL SELECT 'order_reviews', COUNT(*) FROM raw.order_reviews
UNION ALL SELECT 'customers', COUNT(*) FROM raw.customers
UNION ALL SELECT 'sellers', COUNT(*) FROM raw.sellers
UNION ALL SELECT 'products', COUNT(*) FROM raw.products
UNION ALL SELECT 'geolocation', COUNT(*) FROM raw.geolocation
UNION ALL SELECT 'category_translation', COUNT(*) FROM raw.category_translation
ORDER BY row_count DESC;