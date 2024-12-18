/* Set Operations */

/* `UNION ALL` */
-- Combines results, includes duplicates
SELECT id FROM products
UNION ALL
SELECT id FROM clients;

/* `UNION` */
-- Combines results, removes duplicates
SELECT id FROM products
UNION
SELECT id FROM clients;

/* `INTERSECT` */
-- Returns common rows
SELECT id FROM products
INTERSECT
SELECT id FROM clients;

/* `EXCEPT` */
-- Returns rows in the first query, not in the second
SELECT id FROM products
EXCEPT
SELECT id FROM clients;