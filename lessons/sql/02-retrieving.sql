/* Retrieving Data */

/* 1. `SELECT`, `FROM`
*/
-- Syntax
SELECT columns
FROM table;

-- All columns
SELECT *
FROM products;

-- Specific columns, separated by commas
SELECT id, name, unit_price
FROM products;

-- Specific values as columns
SELECT 1, 'soy una frase'
FROM products;

-- Combined
SELECT *, id, 1, 'soy una frase'
FROM products;

/* 2. Aliases: `AS`
- Can be used for columns and tables(primarily with joins)
- Use double quotes ("") for aliases on columns to avoid errors
- `AS` keyword is optional but recommended for columns
- It does not replace the column name but it does replace the table name
*/
SELECT id AS "order_id"
FROM orders o;


/* 3. Arithmetic Operators: `+`, `-`, `*`, `/`, `%`
- Any column can be used for this operations
- Parentheses are optional but recommended
*/
SELECT (1 + 1) AS "addition";
SELECT (1 - 1) AS "substraction";
SELECT (1 * 1) AS "multiplication";
SELECT (1 / 1) AS "division";
SELECT (1 % 1) AS "remainder";
SELECT (2 * (1 + 1)) AS "combined"; -- P. E. M. D. A. S.


/* 4. `SELECT DISTINCT`
- Remove duplicates
*/
SELECT DISTINCT product_category_id, unit_price
FROM products;