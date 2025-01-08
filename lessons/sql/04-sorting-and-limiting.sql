/* Sorting and Limiting */

/* 1. `ORDER BY`
*/
-- Syntax
SELECT columns
FROM table
ORDER BY columns; -- Ascending order by default

-- Sort by column
SELECT * FROM products
    ORDER BY unit_price;


/* 2. `ASC`, `DESC`
*/
SELECT * FROM products
    ORDER BY unit_price ASC;
    ORDER BY unit_price DESC;
    ORDER BY unit_price DESC, name ASC;


/* 3. `LIMIT`, `OFFSET`
*/
SELECT * FROM products ORDER BY unit_price DESC
    LIMIT 5; -- Limit to 5 rows
    LIMIT 5 OFFSET 5; -- Skip the first 5 rows