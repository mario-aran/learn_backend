/* Joins */

-- `(INNER) JOIN`: Returns rows when there is a match in both tables.
SELECT products.name, clients.name  
FROM employees
INNER JOIN departments ON employees.department_id = departments.id;  

-- LEFT (OUTER) JOIN: Returns all rows from the left table and the matching rows from the right table, or NULL if there’s no match.
SELECT employees.name, departments.name  
FROM employees  
LEFT JOIN departments ON employees.department_id = departments.id;  

-- RIGHT (OUTER) JOIN: Returns all rows from the right table and the matching rows from the left table, or NULL if there’s no match.
SELECT employees.name, departments.name  
FROM employees  
RIGHT JOIN departments ON employees.department_id = departments.id;

-- FULL (OUTER) JOIN: Returns all rows from both tables, with NULL in unmatched fields.
SELECT employees.name, departments.name  
FROM employees  
FULL JOIN departments ON employees.department_id = departments.id;

-- Self Join: Joins a table with itself.
SELECT e1.name AS Employee1, e2.name AS Manager  
FROM employees e1  
INNER JOIN employees e2 ON e1.manager_id = e2.id;

-- Multiple Joins: Joins multiple tables.
-- Multiple joins
SELECT t1.col, t2.col
FROM tab1 t1 
LEFT JOIN tab2 t2 ON t1.col_id = t2.id;
LEFT JOIN tab3 t3 ON t1.col_id = t2.id