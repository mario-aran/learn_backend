/* Lesson 04: Sorting and Limiting */

/* 1. `ORDER BY`
- Ascending order by default
*/
-- Syntax
SELECT columns
FROM table
ORDER BY columns;

-- Sort by column
SELECT * FROM products
    ORDER BY unit_price;


/* 2. `ASC`, `DESC` */
SELECT * FROM products
    ORDER BY unit_price ASC; -- Ascending
    ORDER BY unit_price DESC; -- Descending
    ORDER BY unit_price DESC, name ASC; -- Combined


/* 3. `LIMIT`, `OFFSET` */
SELECT * FROM products ORDER BY unit_price
    LIMIT 5; -- Limit to 5 rows    
    OFFSET 5; -- Skip the first 5 rows
    LIMIT 5 OFFSET 5; -- Combined for paginations