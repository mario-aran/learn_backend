/* Joins */

/* `(INNER) JOIN` 
- Returns matching rows from both tables
*/
SELECT p.name, pc.name  
FROM products p
INNER JOIN product_categories pc ON p.product_category_id = pc.id;

/* `LEFT (OUTER) JOIN`
- Returns all rows from the left table and matching rows from the right, or NULL
*/
SELECT p.name, pc.name  
FROM products p
LEFT JOIN product_categories pc ON p.product_category_id = pc.id;

/* `RIGHT (OUTER) JOIN`
- Returns all rows from the right table and matching rows from the left, or NULL
*/
SELECT p.name, pc.name  
FROM products p
RIGHT JOIN product_categories pc ON p.product_category_id = pc.id;

/* `FULL (OUTER) JOIN`
- Returns all rows from both tables, with NULL in unmatched fields
*/
SELECT p.name, pc.name  
FROM products p
FULL JOIN product_categories pc ON p.product_category_id = pc.id;

/* Self Join
- Joins a table with itself
*/
SELECT e1.name AS "employee", e2.name AS "manager"
FROM employees e1
INNER JOIN employees e2 ON e1.manager_id = e2.id;

/* Multiple Joins */
SELECT s.id, p.name AS "product", c.name AS "client"
FROM sales s
LEFT JOIN products p ON s.product_id = p.id
LEFT JOIN clients c ON s.client_id = c.id;