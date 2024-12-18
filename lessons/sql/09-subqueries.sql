/* Subqueries */

/* Subquery Syntax */
SELECT column_name 
FROM table_name
WHERE column_name = (SELECT column_name FROM another_table WHERE condition);

/* Single-Row Subqueries
- Returns a single value for comparison (e.g., for equality or inequality)
*/
SELECT name 
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

/* Multi-Row Subqueries
- Returns multiple rows, typically used with IN, ANY, or ALL
*/
SELECT name 
FROM employees
WHERE department_id IN (SELECT department_id FROM departments WHERE location = 'New York');

/* Correlated Subqueries
- A subquery that references a column from the outer query
*/
SELECT e.name 
FROM employees e
WHERE e.salary > (SELECT AVG(salary) FROM employees WHERE department_id = e.department_id);

/* Subqueries in `SELECT`, `WHERE` and `FROM` */

/* Using Subquery in `SELECT`
- Use a subquery in the SELECT clause to return derived data.
*/
SELECT name, 
       (SELECT COUNT(*) FROM orders WHERE employee_id = employees.id) AS order_count
FROM employees;

/* Using Subquery in `WHERE` */
SELECT name 
FROM products
WHERE price > (SELECT AVG(price) FROM products);

/* Using Subquery in `FROM`
- Subquery in FROM clause, treating the subquery as a derived table.
*/
SELECT dept_avg.department_id, dept_avg.avg_salary
FROM (SELECT department_id, AVG(salary) AS avg_salary FROM employees GROUP BY department_id) dept_avg
WHERE dept_avg.avg_salary > 50000;