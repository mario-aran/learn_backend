/* Filtering */

/* 1. `WHERE`
*/
-- Syntax
SELECT columns
FROM table
WHERE conditions


/* 2. Comparison Operators: `=`, `>`, `<`, `>=`, `<=`, `<>`
*/
SELECT * FROM products
    WHERE unit_price = 100;
    WHERE unit_price > 100;
    WHERE unit_price < 100;
    WHERE unit_price >= 100;
    WHERE unit_price <= 100;
    WHERE unit_price <> 100;


/* 3. Null Operators: `IS NULL`, `IS NOT NULL`
*/
SELECT * FROM products
    WHERE unit_price IS NULL;
    WHERE unit_price IS NOT NULL;


/* 4. Logical Operators: `AND`, `OR`, `NOT`
*/
SELECT * FROM products
    WHERE (unit_price > 200) AND (unit_price < 1000); -- Optional parentheses
    WHERE (unit_price > 200) OR (unit_price < 1000);
    WHERE NOT unit_price > 200;


/* 5. Conditional Operators: `BETWEEN`, `IN`, `LIKE`
*/
SELECT * FROM products
    WHERE unit_price BETWEEN 200 AND 1000;
    WHERE unit_price IN (100, 200, 300);
    WHERE name LIKE 'A%e%'; -- For string columns only, % is a wildcard