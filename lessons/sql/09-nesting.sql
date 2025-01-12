/* Lesson 09: Nesting */

/* 1. `CASE`
- Counts as a single column
- Parentheses are optional but recommended
- The `ELSE` is Optional, but if not present the default value is NULL
*/
-- Syntax
CASE
	WHEN conditions1 THEN result1
    WHEN conditionsN THEN resultN
    ELSE default_result
END;

-- Usage
SELECT
	(CASE WHEN unit_price > 200 THEN 'blue' ELSE 'red' END); -- With default value
	(CASE WHEN unit_price > 200 THEN 'blue' END); -- Without default value
FROM products;


/* 2. Subqueries
- Counts as a single column
- Parentheses are optional but recommended
*/
-- Syntax
SELECT 
	(subquery)
FROM table;

-- Usage
SELECT name 
FROM products
WHERE unit_price = (SELECT MAX(unit_price) FROM products);


/* 3. CTEs */
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
	FROM orders o
		/* orders -> products */
		LEFT JOIN orders_to_products otp ON o.id = otp.order_id
		LEFT JOIN products p ON otp.product_id = p.id
		LEFT JOIN product_categories pc ON p.product_category_id = pc.id
),
sellers_users_cte AS (
	SELECT s.id AS "seller_id",
		s.user_id AS "seller_user_id",
		u.name AS "seller_user",
		u.email AS "seller_user_email",
		u.password AS "seller_user_password",
		u.user_role_id AS "seller_user_role_id",
		ur.name AS "seller_user_role"
	FROM sellers s
		/* sellers -> users */
		LEFT JOIN users u ON s.user_id = u.id
		LEFT JOIN user_roles ur ON u.user_role_id = ur.id
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
	FROM clients c
		/* clients -> users */
		LEFT JOIN users u ON c.user_id = u.id
		LEFT JOIN user_roles ur ON u.user_role_id = ur.id
		
		/* clients -> client_discounts */
		LEFT JOIN client_discounts cd ON c.client_discount_id = cd.id
)

SELECT *
FROM orders_products_cte opcte
  	/* orders -> sellers */
	LEFT JOIN sellers_users_cte sucte ON opcte.seller_id = sucte.seller_id
	
	/* orders -> clients */
	LEFT JOIN clients_users_cte cucte ON opcte.client_id = cucte.client_id;