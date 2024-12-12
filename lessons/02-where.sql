/* Where */

-- Where Syntax
SELECT * FROM table_name WHERE condition;

-- Comparison Operators: `=`, `>`, `<`, `>=`, `<=`, `<>`
WHERE column = 1;
WHERE column > 1;
WHERE column < 1;
WHERE column >= 1;
WHERE column <= 1;
WHERE column <> 1;

-- Logical Operators: `NOT`, `AND`, `OR`, `BETWEEN`, `IN`, `LIKE`
WHERE NOT column = 1; -- Not equal
WHERE column1 = 1 AND column2 = 2;
WHERE column1 = 1 OR column2 = 2;
WHERE column BETWEEN 1 AND 3;
WHERE column IN (1, 2, 3);
WHERE string_column LIKE 'a__%'; -- String with wildcards, at least 3 characters length

-- Null Values: `IS NULL`, `IS NOT NULL`
WHERE column IS NULL;
WHERE column IS NOT NULL;