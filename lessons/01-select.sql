/* Select */

-- Select Syntax: `SELECT`
SELECT 1; -- Single value
SELECT 1, 2, 3; -- Multiple values separated by commas

-- Aliases: `AS`
SELECT 1 AS "custom_name"; -- Use "" if the name is a reserved keyword
SELECT 1 "custom_name"; -- `AS` is optional

-- Arithmetic Operators: `+`, `-`, `*`, `/`, `%`, `()`
SELECT 1 + 1;
SELECT 1 - 1;
SELECT 1 * 1;
SELECT 1 / 1;
SELECT 1 % 1;
SELECT 2 * (1 + 1); -- PEMDAS

-- Select From: `FROM`
SELECT * FROM table_name; -- Wildcard all columns from table
SELECT column FROM table_name; -- Single column
SELECT column1, column2 FROM table_name; -- Multiple columns
SELECT 1, column, * FROM table_name; -- Combination of value, column and wildcard

-- Select Distinct: `DISTINCT`
SELECT DISTINCT column FROM -- Select distinct values

-- Aggregate Functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
SELECT COUNT(*) FROM -- Count total number of rows, including nulls
SELECT COUNT(column) FROM -- Count non-null values
SELECT SUM(column) FROM -- Sum of all non-null values
SELECT AVG(column) FROM -- Average of non-null values
SELECT MIN(column) FROM -- Minimum non-null value
SELECT MAX(column) FROM -- Maximum non-null value