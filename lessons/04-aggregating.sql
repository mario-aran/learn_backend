/* Aggregating */

-- Aggregate Functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
/*
- Can't be used inside `WHERE`
*/
SELECT COUNT(*) FROM table_name; -- Count total number of rows, including nulls
SELECT COUNT(column) FROM table_name; -- Count non-null values
SELECT SUM(column) FROM table_name; -- Sum of all non-null values
SELECT AVG(column) FROM table_name; -- Average of non-null values
SELECT MIN(column) FROM table_name; -- Minimum non-null value
SELECT MAX(column) FROM table_name; -- Maximum non-null value

-- Group By
SELECT column FROM table_name GROUP BY column; -- Single column
SELECT COUNT(column1), column2, column3 FROM table_name GROUP BY column2, column3; -- With aggregate function

-- Having
/*
- To filter aggregate functions
*/
SELECT SUM(column1), column2 FROM table_name GROUP BY column2 HAVING SUM(column1) > 1; -- Single condition
SELECT AVG(column1), column2 FROM table_name GROUP BY column2 HAVING AVG(column1) < 2 OR AVG(column1) = 4; -- Multiple conditions