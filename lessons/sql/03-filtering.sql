/* Filtering */

/* `WHERE`
*/
-- Syntax
SELECT columns
FROM table
WHERE (condition); -- Optional parentheses


/* Comparison Operators: `=`, `>`, `<`, `>=`, `<=`, `<>`
*/
SELECT * FROM products
    WHERE unit_price = 100;
    WHERE unit_price > 100;
    WHERE unit_price < 100;
    WHERE unit_price >= 100;
    WHERE unit_price <= 100;
    WHERE unit_price <> 100;


/* Null Operators: `IS NULL`, `IS NOT NULL`
*/
SELECT * FROM products
    WHERE unit_price IS NULL;
    WHERE unit_price IS NOT NULL;


/* Logical Operators: `AND`, `OR`, `NOT`
*/
SELECT * FROM products
    WHERE (unit_price > 200) AND (unit_price < 1000);
    WHERE (unit_price > 200) OR (unit_price < 1000);
    WHERE NOT unit_price > 200;


/* Conditional Operators: `BETWEEN`, `IN`, `LIKE`
*/
SELECT * FROM products
    WHERE unit_price BETWEEN 200 AND 1000;
    WHERE unit_price IN (100, 200, 300);
    WHERE name LIKE 'A%e%'; -- For string columns only, % is a wildcard