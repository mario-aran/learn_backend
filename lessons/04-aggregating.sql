/* Aggregating */

-- Aggregate Functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
/*
- Can't be used inside `WHERE`
*/
SELECT COUNT(*) FROM table; -- Count total number of rows, including nulls
SELECT COUNT(column) FROM table; -- Count non-null values
SELECT SUM(column) FROM table; -- Sum of all non-null values
SELECT AVG(column) FROM table; -- Average of non-null values
SELECT MIN(column) FROM table; -- Minimum non-null value
SELECT MAX(column) FROM table; -- Maximum non-null value

-- Group By
SELECT column FROM table GROUP BY column; -- Single column
SELECT COUNT(col1), col2 FROM table GROUP BY col2; -- With aggregate function

-- Having
/*
- To filter aggregate functions
*/
SELECT AVG(col1), col2 FROM table GROUP BY col2 HAVING AVG(col1) > 1; -- Single condition
SELECT AVG(col1), col2 FROM table GROUP BY col2 HAVING AVG(col1) < 2 OR AVG(col1) = 4; -- Multiple conditions