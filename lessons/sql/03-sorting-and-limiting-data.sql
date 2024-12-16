/* Sorting and Limiting Data */

/* `ORDER BY ASC/DESC`` */
-- Ascending by default
SELECT * FROM products ORDER BY name -- By column
SELECT name, SUM(price) FROM products ORDER BY SUM(price), name -- By aggregation

-- Ascending, Descending
ORDER BY id ASC
ORDER BY id DESC
ORDER BY id DESC, name ASC

/* `LIMIT OFFSET` */
SELECT * FROM table LIMIT 5; -- Limit to 5 rows
SELECT * FROM table LIMIT 5 OFFSET 5; -- Skipping the first 5 rows