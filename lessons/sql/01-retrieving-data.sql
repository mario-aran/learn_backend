/* Retrieving Data */

/* `SELECT FROM` */
SELECT * FROM products; -- All columns
SELECT id FROM products; -- One column
SELECT *, id, 1 FROM products; -- Multiple values, separated by commas

/* `SELECT DISTINCT` */
SELECT DISTINCT product_category_id, price FROM table; -- Unique values

/* Arithmetic Operators: `+`, `-`, `*`, `/`, `%` */
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;
SELECT 1 % 1;
SELECT 2 * (1 + 1); -- P. E. M. D. A. S.

/* Aliases: `AS` */
-- Use "" to avoid errors on reserved keywords
-- `AS` is optional 
SELECT price AS "alias" FROM products as "p"; -- Column and table