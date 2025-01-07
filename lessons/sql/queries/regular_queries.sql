/* Regular Query */

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
	/* Orders -> Products */
	LEFT JOIN orders_to_products otp ON o.id = otp.order_id
	LEFT JOIN products p ON otp.product_id = p.id
	LEFT JOIN product_categories pc ON p.product_category_id = pc.id

	/* Orders -> Sellers */
	LEFT JOIN sellers s ON o.seller_id = s.id
	LEFT JOIN users us ON s.user_id = us.id
	LEFT JOIN user_roles urs ON us.user_role_id = urs.id

	/* Orders -> Clients */
	LEFT JOIN clients c ON o.client_id = c.id

	/* Clients -> ClientDiscounts */
	LEFT JOIN client_discounts cd ON c.client_discount_id = cd.id

	/* Clients -> Users */
	LEFT JOIN users uc ON c.user_id = uc.id
	LEFT JOIN user_roles urc ON uc.user_role_id = urc.id
	
	/* Last line semicolon */
;