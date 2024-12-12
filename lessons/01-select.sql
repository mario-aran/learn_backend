/* Select */

-- Select Syntax
SELECT value; -- Single value
SELECT 1, 2, 3; -- Multiple values separated by commas

-- Arithmetic Operators: `+`, `-`, `*`, `/`, `%`, `()`
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;
SELECT 1 % 1;
SELECT 2 * (1 + 1); -- PEMDAS

-- From
SELECT * FROM table_name; -- Wildcard all columns
SELECT column1, column2 FROM table_name; -- Specific columns
SELECT 1, column, * FROM table_name; -- Combination of value, column and wildcard

-- Aliases
/* Notes: 
- Use "" for reserved keywords
- `AS` is optional 
*/
SELECT column AS "custom_alias"; -- Column alias
SELECT column FROM table_name AS "custom_alias"; -- Table alias
SELECT column custom_name FROM table_name tn; -- Without `AS` or ""

-- Select Distinct
SELECT DISTINCT column1, column2 FROM table_name; -- Select distinct values