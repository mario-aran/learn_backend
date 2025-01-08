/* Sorting and Limiting */

/* `ORDER BY, ASC/DESC`
- Ascending by default
*/
-- Syntax
SELECT columns
FROM table
ORDER BY columns;

-- By column
SELECT * FROM products
    ORDER BY unit_price;

/* `ASC`, `DESC` */
SELECT * FROM products
    ORDER BY unit_price ASC;
    ORDER BY unit_price DESC;
    ORDER BY unit_price DESC, name ASC;

/* `LIMIT`, `OFFSET` */
SELECT * FROM products ORDER BY unit_price DESC
    LIMIT 5; -- Limit to 5 rows
    LIMIT 5 OFFSET 5; -- Skipping the first 5 rows