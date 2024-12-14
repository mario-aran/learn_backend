/* Sorting and Limiting */

-- `ORDER BY`
/* 
- Sort ascending by default
*/
SELECT * FROM table ORDER BY column -- By column
SELECT col1, SUM(col2) FROM table ORDER BY SUM(col2) -- By aggregation

-- `ASC`, `DESC`
ORDER BY column ASC -- Ascending
ORDER BY column DESC -- Descending
ORDER BY col1 DESC, col2 ASC -- Combined

-- `LIMIT OFFSET`
SELECT * FROM table LIMIT 5; -- Limit to 5 rows
SELECT * FROM table LIMIT 5 OFFSET 5; -- Skipping the first 5 rows