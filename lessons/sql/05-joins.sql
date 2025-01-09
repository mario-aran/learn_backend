/* Joins */

/* 1. `OUTER JOIN`: `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`
- OUTER keyword is optional
*/
-- Syntax
SELECT columns
FROM table t
	JOIN destination_table dt ON conditions;

-- `LEFT JOIN`
SELECT p.name AS "product", pc.name AS "product_category" FROM products p
	LEFT JOIN product_categories pc ON p.product_category_id = pc.id;

-- `RIGHT JOIN`
SELECT p.name AS "product", pc.name AS "product_category"
FROM products p
	RIGHT JOIN product_categories pc ON p.product_category_id = pc.id;

-- `FULL JOIN`
SELECT p.name AS "product", pc.name AS "product_category"
FROM products p
	FULL JOIN product_categories pc ON p.product_category_id = pc.id;


/* 2. `INNER JOIN`
- INNER keyword is optional but recommended
*/
SELECT p.name AS "product", pc.name AS "product_category"
FROM products p
	INNER JOIN product_categories pc ON p.product_category_id = pc.id;


/* 3. Self Join
*/
SELECT p1.name AS "product1", p2.name AS "product2"
FROM products p1
	LEFT JOIN products p2 ON p1.id = p2.id;


/* 4. Multiple Joins
*/
SELECT o.id AS "order_id",
	o.created_at AS "order_created_at",
	otp.unit_price AS "order_unit_price",
	otp.quantity AS "order_quantity",
	otp.discount AS "order_discount",
	otp.product_id,
	p.name AS "product",
	p.unit_price AS "product_unit_price",
	p.product_category_id,
	pc.name AS "product_category",
	s.id AS "seller_id",
	s.user_id AS "seller_user_id",
	us.name AS "seller_user",
	us.email AS "seller_user_email",
	us.password AS "seller_user_password",
	us.user_role_id AS "seller_user_role_id",
	urs.name AS "seller_user_role",
	c.client_discount_id,
	cd.discount AS "client_discount",
	c.user_id AS "client_user_id",
	uc.name AS "client_user",
	uc.email AS "client_user_email",
	uc.password AS "client_user_password",
	uc.user_role_id AS "client_user_role_id",
	urc.name AS "client_user_role"
FROM orders o
	/* orders -> products */
	LEFT JOIN orders_to_products AS "otp" ON o.id = otp.order_id
	LEFT JOIN products AS "p" ON otp.product_id = p.id
	LEFT JOIN product_categories AS "pc" ON p.product_category_id = pc.id

	/* orders -> sellers */
	LEFT JOIN sellers AS "s" ON o.seller_id = s.id
	LEFT JOIN users AS "us" ON s.user_id = us.id
	LEFT JOIN user_roles AS "urs" ON us.user_role_id = urs.id

	/* orders -> clients */
	LEFT JOIN clients AS "c" ON o.client_id = c.id

	/* clients -> client_discounts */
	LEFT JOIN client_discounts AS "cd" ON c.client_discount_id = cd.id

	/* clients -> users */
	LEFT JOIN users AS "uc" ON c.user_id = uc.id
	LEFT JOIN user_roles AS "urc" ON uc.user_role_id = urc.id;