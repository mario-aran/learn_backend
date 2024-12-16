/* Aggregating Data */

/* Aggregate Functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX` */
-- Can't be used inside `WHERE`

SELECT COUNT(*) FROM products; -- Count total number of rows, including nulls
SELECT COUNT(id) FROM products; -- Count non-null values
SELECT SUM(id) FROM products; -- Sum of all non-null values
SELECT AVG(id) FROM products; -- Average of non-null values
SELECT MIN(id) FROM products; -- Minimum non-null value
SELECT MAX(id) FROM products; -- Maximum non-null value

/* `GROUP BY` */

-- Column
SELECT product_category_id
FROM products
GROUP BY product_category_id;

-- Aggregate function
SELECT COUNT(id), product_category_id
FROM products
GROUP BY product_category_id;

/* `HAVING` */
-- To filter aggregate functions

-- Single condition
SELECT AVG(price), product_category_id
FROM products
GROUP BY product_category_id
HAVING AVG(price) > 1000;

-- Multiple conditions
SELECT AVG(price), product_category_id
FROM products
GROUP BY product_category_id
HAVING AVG(price) < 2000 OR AVG(price) = 3000;