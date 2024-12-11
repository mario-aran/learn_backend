/* Order By */

-- Order By Syntax: `ORDER BY`
SELECT * FROM table_name ORDER BY column;

-- By Columns
ORDER BY column -- Sort by one column (ascending by default)
ORDER BY column2, column1 -- Sort by multiple columns (ascending by default)

-- By Direction: `ASC`, `DESC`
ORDER BY column ASC -- Sort ascending
ORDER BY column DESC -- Sort descending
ORDER BY column2 DESC, column1 ASC -- Sort by multiple directions and columns