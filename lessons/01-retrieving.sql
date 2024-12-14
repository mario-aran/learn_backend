/* Retrieving */

-- `SELECT FROM`
SELECT * FROM table; -- * wildcard that means all columns
SELECT column FROM table; -- Column
SELECT *, column, 1 FROM table; -- Multiple values, separated by commas

-- `SELECT DISTINCT`
SELECT DISTINCT col1, col2 FROM table; -- Select distinct values

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
SELECT column FROM table AS "tn"; -- Table alias