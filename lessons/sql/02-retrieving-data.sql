/* Retrieving Data */

/* `SELECT FROM` */
-- All columns
SELECT *
FROM products;

-- One column
SELECT id
FROM products;

-- Multiple values, separated by commas
SELECT *, id, 1
FROM products;

/* `SELECT DISTINCT` */
-- Unique values
SELECT DISTINCT product_category_id, price
FROM table;

/* Arithmetic Operators: `+`, `-`, `*`, `/`, `%` */
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;
SELECT 1 % 1;
SELECT 2 * (1 + 1); -- P. E. M. D. A. S.

/* Aliases: `AS`
- Use "" to avoid errors on reserved keywords
- `AS` is optional
*/
-- Column and table
SELECT price AS "alias"
FROM products AS "p";