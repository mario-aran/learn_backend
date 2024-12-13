/* Retrieving */

-- `SELECT FROM`
SELECT * FROM table_name; -- * wildcard that means all columns
SELECT column FROM table_name; -- Column
SELECT *, column, 1 FROM table_name; -- Multiple values, separated by commas

-- `SELECT DISTINCT`
SELECT DISTINCT column1, column2 FROM table_name; -- Select distinct values

-- Arithmetic Operators: `+`, `-`, `*`, `/`, `%`, `()`
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;
SELECT 1 % 1;
SELECT 2 * (1 + 1); -- P. E. M. D. A. S.

-- Aliases: `AS`
/*
- Use "" to avoid errors on reserved keywords
- `AS` is optional 
*/
SELECT column AS "alias"; -- Column alias
SELECT column FROM table_name AS "tn"; -- Table alias