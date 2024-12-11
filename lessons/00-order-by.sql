/* Order By */

-- Sintaxis
SELECT * FROM table_name ORDER BY column;

-- By columns: `ORDER BY`
ORDER BY column -- Sort by one column (ascending by default)
ORDER BY column2, column1 -- Sort by multiple columns (ascending by default)

-- By direction: `ASC`, `DESC`
ORDER BY "column1" ASC -- Sort ascending
ORDER BY "column1" DESC -- Sort descending
ORDER BY "column2" DESC, "column1" ASC -- Sort by multiple directions and columns