/* Retrieving */

/* 1. `SELECT`, `FROM`
*/
-- Syntax
SELECT columns
FROM table;

-- All columns
SELECT * FROM products;

-- Specific columns, separated by commas
SELECT id, name, unit_price FROM products;

-- Combined values
SELECT *, id, 1, 'soy una frase' FROM products;


/* 2. Aliases: `AS`
- Use double quotes ("") for aliases to avoid errors
- `AS` keyword is optional
- Can be used for columns and tables(primarily with joins)
- It doesn't replace the column name
*/
SELECT id AS "order_id" FROM orders o;


/* 3. Arithmetic Operators: `+`, `-`, `*`, `/`, `%`
*/
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;
SELECT 1 % 1;
SELECT 2 * (1 + 1); -- Optional parentheses P. E. M. D. A. S.


/* 4. `SELECT DISTINCT`
*/
SELECT DISTINCT product_category_id, unit_price FROM products;