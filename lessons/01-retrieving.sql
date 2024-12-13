/* Retrieving */

-- `SELECT FROM`
SELECT 1, 2, 3; -- One or multiple values separated by commas
SELECT column FROM table_name; -- Column
SELECT * FROM table_name; -- * wildcard that means all columns
SELECT 1, column, * FROM table_name; -- Combination of number, column and all columns

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