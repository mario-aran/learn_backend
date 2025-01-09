/* Aggregating */

/* 1. Aggregate Functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Can't be used inside `WHERE` or `GROUP BY`
- Only COUNT(*) includes null values
*/
SELECT COUNT(*) AS "total_count" FROM products;
SELECT COUNT(unit_price) AS "count" FROM products;
SELECT SUM(unit_price) AS "total_sum" FROM products;
SELECT AVG(unit_price) AS "average" FROM products;
SELECT MIN(unit_price) AS "min_value" FROM products;
SELECT MAX(unit_price) AS "max_value"FROM products;


/* 2. `GROUP BY`
*/
-- Syntax
SELECT aggregate_functions, columns 
FROM table
GROUP BY columns;

-- Grouped Aggregate Functions
SELECT SUM(unit_price) AS "total_price",
product_category_id
FROM products
GROUP BY product_category_id
ORDER BY SUM(unit_price) DESC; -- `ORDER BY` is optional


/* 3. `HAVING`
- Same as `WHERE` but for aggregate functions
*/
-- Single condition
SELECT AVG(unit_price) AS "average_price",
product_category_id
FROM products
GROUP BY product_category_id
HAVING (AVG(unit_price) > 500);

-- Multiple conditions
SELECT AVG(unit_price) AS "average_price",
product_category_id
FROM products
GROUP BY product_category_id
HAVING (AVG(unit_price) > 500) OR (AVG(unit_price) < 3000);