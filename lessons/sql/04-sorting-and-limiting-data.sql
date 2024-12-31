/* Sorting and Limiting Data */

/* `ORDER BY ASC/DESC`
- Ascending by default
*/
-- By column
SELECT *
FROM products
ORDER BY name

-- Ascending, Descending
ORDER BY id ASC
ORDER BY id DESC
ORDER BY id DESC, name ASC

/* `LIMIT OFFSET` */
-- Limit to 5 rows
SELECT *
FROM table
LIMIT 5;

-- Skipping the first 5 rows
SELECT *
FROM table
LIMIT 5 OFFSET 5;