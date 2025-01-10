ROW_NUMBER() OVER (PARTITION BY column ORDER BY column)
RANK() OVER (PARTITION BY column ORDER BY column)
DENSE_RANK() OVER (PARTITION BY column ORDER BY column)
NTILE(4) OVER (PARTITION BY column ORDER BY column)
SUM(column) OVER (PARTITION BY column ORDER BY column)
AVG(column) OVER (PARTITION BY column ORDER BY column)
MIN(column) OVER (PARTITION BY column ORDER BY column)
MAX(column) OVER (PARTITION BY column ORDER BY column)
LEAD(column, 1) OVER (PARTITION BY column ORDER BY column)
LAG(column, 1) OVER (PARTITION BY column ORDER BY column)
FIRST_VALUE(column) OVER (PARTITION BY column ORDER BY column)
LAST_VALUE(column) OVER (PARTITION BY column ORDER BY column ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING)

SELECT 
    order_id,
    created_at,
    unit_price,
    FIRST_VALUE(unit_price) OVER (PARTITION BY order_id ORDER BY created_at)
FROM 
    orders_to_products;