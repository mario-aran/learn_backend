/* Set Operations */

/* 1. Unions: `UNION`, `UNION ALL` */
-- `UNION ALL`: combine results, includes duplicates
SELECT id, name FROM products
UNION ALL
SELECT id, NULL FROM clients;

-- `UNION`: Combines results, removes duplicates
SELECT id, name FROM products
UNION
SELECT id, NULL FROM clients;


/* 2. `INTERSECT` */
-- Returns common rows
SELECT id, name FROM products
INTERSECT
SELECT id, NULL FROM clients;


/* 3. `EXCEPT` */
-- Returns rows in the first query, not in the second
SELECT id, name FROM products
EXCEPT
SELECT id, NULL FROM clients;