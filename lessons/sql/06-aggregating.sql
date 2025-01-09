/* Aggregating */

/* 1. Aggregate Functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- Can't be used inside `WHERE` or `GROUP BY`
- Only COUNT(*) includes null values
*/
SELECT COUNT(*) FROM products; -- Count number of rows
SELECT COUNT(unit_price) FROM products; -- Count non-null rows
SELECT SUM(unit_price) FROM products; -- Sum non-null rows
SELECT AVG(unit_price) FROM products; -- Average of non-null rows
SELECT MIN(unit_price) FROM products; -- Minimum non-null rows
SELECT MAX(unit_price) FROM products; -- Maximum non-null rows


/* 2. `GROUP BY`
*/
-- Syntax
SELECT aggregate_functions, columns 
FROM table
GROUP BY columns;

-- Grouped Aggregate Functions
SELECT SUM(unit_price) AS "total_price", COUNT(*) AS "records",
product_category_id
FROM products
GROUP BY product_category_id
ORDER BY SUM(unit_price) DESC, product_category_id ASC; -- Order by is optional


/* 3. `HAVING`
- To filter aggregate functions
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