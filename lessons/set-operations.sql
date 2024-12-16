/* Set Operations*/

-- `UNION`: Combines result sets and removes duplicates.
SELECT id FROM products
UNION
SELECT id FROM clients;

-- `UNION ALL`: Combines result sets and includes duplicates.
SELECT id FROM products
UNION ALL
SELECT id FROM clients;

-- `INTERSECT`: Returns rows that are common to both result sets.
SELECT id FROM products
INTERSECT
SELECT id FROM clients;

-- `EXCEPT`: Returns rows from the first query that are not in the second.
SELECT id FROM products
EXCEPT
SELECT id FROM clients;