/* Data Modification */

/* `INSERT INTO` */
-- Adds data to a table
INSERT INTO products (name, price, product_category_id)
VALUES ('solaris', 15000, 1), ('anti reflejo', 20000, 2);

/* `UPDATE SET` */
-- Modifies existing data
UPDATE products
SET price = 10000
WHERE product_category_id = 1;

/* `DELETE FROM` */
-- Removes records from a table
DELETE FROM products
WHERE product_category_id = 1;