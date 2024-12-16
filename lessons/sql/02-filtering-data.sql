/* Filtering Data */

/* `WHERE` */
SELECT *
FROM table_name
WHERE condition;

/* Comparison Operators: `=`, `>`, `<`, `>=`, `<=`, `<>` */
WHERE id = 1;
WHERE id > 1;
WHERE id < 1;
WHERE id >= 1;
WHERE id <= 1;
WHERE id <> 1;

/* Conditional Operators: `BETWEEN`, `IN`, `LIKE` */
WHERE id BETWEEN 1 AND 3;
WHERE id IN (1, 2, 3);
WHERE name LIKE 'a__%'; -- String column and wildcards (_ %)

/* Null Values: `IS NULL`, `IS NOT NULL` */
WHERE name IS NULL;
WHERE name IS NOT NULL;

/* Logical Operators: `AND`, `OR`, `NOT` */
WHERE id = 1 AND product_category_id = 1;
WHERE id = 1 OR product_category_id = 1;
WHERE NOT id = 1;