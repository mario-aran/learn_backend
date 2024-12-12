/* Order */

-- Order By
/* Notes:
- Goes after `WHERE`, `GROUP BY` and `HAVING`
- Can be used with aggregation functions
*/
SELECT * FROM table_name ORDER BY column;

-- By Columns
SELECT * FROM ORDER BY column -- Sort by one column (ascending by default)
SELECT * FROM ORDER BY column2, column1 -- Sort by multiple columns
SELECT SUM(column1), column2 FROM ORDER BY SUM(column1) -- Sort by aggregation function

-- By Direction: `ASC`, `DESC`
ORDER BY column ASC -- Sort ascending
ORDER BY column DESC -- Sort descending
ORDER BY column2 DESC, column1 ASC -- Sort by multiple directions and columns