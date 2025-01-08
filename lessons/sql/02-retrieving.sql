/* Retrieving */

/* `SELECT FROM` */
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

/* Aliases: `AS`
 - Use double quotes ("") for aliases to avoid errors with reserved keywords.
 - `AS` is optional.
 - Can be used for columns or tables (primarily used with joins).
*/
SELECT id AS "order_id"
FROM orders o;

/* Arithmetic Operators: `+`, `-`, `*`, `/`, `%` */
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;
SELECT 1 % 1;
SELECT 2 * (1 + 1); -- P. E. M. D. A. S.

/* Removing Duplicates: `SELECT DISTINCT` */
SELECT DISTINCT product_category_id, unit_price
FROM products;