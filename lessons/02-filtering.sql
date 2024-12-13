/* Filtering */

-- `WHERE`
SELECT * FROM table_name WHERE condition;

-- Comparison Operators: `=`, `>`, `<`, `>=`, `<=`, `<>`
WHERE column = 1;
WHERE column > 1;
WHERE column < 1;
WHERE column >= 1;
WHERE column <= 1;
WHERE column <> 1;

-- Conditional Operators: `BETWEEN`, `IN`, `LIKE`
WHERE column BETWEEN 1 AND 3;
WHERE column IN (1, 2, 3);
WHERE string_column LIKE 'a__%'; -- _% wildcards, at least 3 characters length

-- Null Values: `IS NULL`, `IS NOT NULL`
WHERE column IS NULL;
WHERE column IS NOT NULL;

-- Logical Operators: `AND`, `OR`, `NOT`
WHERE column1 = 1 AND column2 = 1;
WHERE column1 = 1 OR column2 = 1;
WHERE NOT column = 1;