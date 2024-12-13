/* Sorting and Limiting */

-- `ORDER BY`
SELECT * FROM table_name ORDER BY column -- Sort by column (ascending by default)
SELECT column1, SUM(column2) FROM table_name ORDER BY SUM(column2) -- Sort by aggregation
SELECT * FROM table_name ORDER BY column1 DESC, column2 ASC -- `ASC`, `DESC`

-- `LIMIT OFFSET`
SELECT * FROM table_name LIMIT 5; -- Limit to 5 rows
SELECT * FROM table_name LIMIT 5 OFFSET 5; -- Skipping the first 5 rows