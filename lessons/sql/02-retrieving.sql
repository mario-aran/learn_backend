/* Retrieving */

/* 1. `SELECT`, `FROM`
*/
-- Syntax
SELECT columns
FROM table;

-- All columns
SELECT *
FROM products;

-- One column
SELECT id
FROM products;

-- Multiple columns, separated by commas
SELECT *, id, 1, 'soy una frase'
FROM products;


/* 2. Aliases: `AS`
- Use double quotes ("") for aliases to avoid errors with reserved keywords
- `AS` is optional
- Can be used for columns or tables (primarily used with joins)
- It doesn't replace the column name, it just changes its appearance
*/
SELECT id AS "order_id"
FROM orders o;


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
SELECT DISTINCT product_category_id, unit_price
FROM products;