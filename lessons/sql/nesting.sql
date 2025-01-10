/* Nesting */

/* 1. `CASE` */


/* 2. Subqueries */


/* 3. CTEs */


/* `CASE` */
SELECT CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    ELSE result_default
END

/* Case in `SELECT` */
(CASE WHEN price = 1 THEN 1 END) AS "custom_price"; -- Alias and Null as default value
CASE WHEN price = 1 THEN 1 ELSE 2 END; -- Default value
SUM(CASE WHEN price = 1 THEN 1 END); -- Aggregate function
CASE WHEN (case1) > 1 THEN 2 ELSE (case2) END; -- Nested cases

/* Case with Other Commands */
WHERE (CASE WHEN price = 1 THEN 1 END) = 1; -- Where
ORDER BY (CASE WHEN price = 1 THEN 1 END) DESC; -- Order By
SELECT (case1) GROUP BY (CASE WHEN price = 1 THEN 1 END); -- Group By
SELECT SUM(price) HAVING SUM(price) > (CASE WHEN price = 1 THEN 1 END); -- Having



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



/* CTEs */
WITH orders_products_cte AS (
	SELECT o.id AS "order_id",
		o.created_at AS "order_created_at",
		o.seller_id,
		o.client_id,
		otp.unit_price AS "order_unit_price",
		otp.quantity AS "order_quantity",
		otp.discount AS "order_discount",
		otp.product_id,
		p.name AS "product",
		p.unit_price AS "product_unit_price",
		p.product_category_id,
		pc.name AS "product_category"
	FROM orders AS "o"
		/* orders -> products */
		LEFT JOIN orders_to_products AS "otp" ON o.id = otp.order_id
		LEFT JOIN products AS "p" ON otp.product_id = p.id
		LEFT JOIN product_categories AS "pc" ON p.product_category_id = pc.id
),
sellers_users_cte AS (
	SELECT s.id AS "seller_id",
		s.user_id AS "seller_user_id",
		u.name AS "seller_user",
		u.email AS "seller_user_email",
		u.password AS "seller_user_password",
		u.user_role_id AS "seller_user_role_id",
		ur.name AS "seller_user_role"
	FROM sellers AS "s"
		/* sellers -> users */
		LEFT JOIN users AS "u" ON s.user_id = u.id
		LEFT JOIN user_roles AS "ur" ON u.user_role_id = ur.id
),
clients_users_cte AS (
	SELECT c.id AS "client_id",
		c.client_discount_id,
		cd.discount AS "client_discount",
		c.user_id AS "client_user_id",
		u.name AS "client_user",
		u.email AS "client_user_email",
		u.password AS "client_user_password",
		u.user_role_id AS "client_user_role_id",
		ur.name AS "client_user_role"
	FROM clients AS "c"
		/* clients -> users */
		LEFT JOIN users AS "u" ON c.user_id = u.id
		LEFT JOIN user_roles AS "ur" ON u.user_role_id = ur.id
		
		/* clients -> client_discounts */
		LEFT JOIN client_discounts AS "cd" ON c.client_discount_id = cd.id
)

/* Select */
SELECT *

/* From, Join */
FROM orders_products_cte AS "opcte"
  /* orders -> sellers */
	LEFT JOIN sellers_users_cte AS "sucte" ON opcte.seller_id = sucte.seller_id
	
	/* orders -> clients */
	LEFT JOIN clients_users_cte AS "cucte" ON opcte.client_id = cucte.client_id

/* Where */


/* Group By, Having */


/* Order By, Limit, Offset */


/* Semicolon */
;