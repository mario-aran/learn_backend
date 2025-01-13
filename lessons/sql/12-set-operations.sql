/* Lesson 12: Set Operations */

/* 1. Key Concepts */
-- Column count must match, fill missing columns with NULL
-- Data type must be compatible, cast if necessary
-- The first query defines result column names


/* 2. Unions: `UNION ALL`, `UNION` */
-- `UNION ALL`: combine results, includes duplicates
SELECT id, NULL AS "name" FROM products
UNION ALL
SELECT id, name FROM clients;

-- `UNION`: Combines results, removes duplicates
SELECT id, NULL AS "name" FROM products
UNION
SELECT id, name FROM clients;


/* 3. `INTERSECT`
- Returns common rows
*/
SELECT id, NULL AS "name" FROM products
INTERSECT
SELECT id, name FROM clients;


/* 4. `EXCEPT`
- Returns rows in the first query, not in the second
*/
SELECT id, NULL AS "name" FROM products
EXCEPT
SELECT id, name FROM clients;