-- OJO ESTA LECCIÓN NO ESTA COMPLETA

/* Lesson 10: Mutations */

/* 1. Schema Mutations: `CREATE`, `ALTER`, `DROP` */
CREATE TABLE test (id INT PRIMARY KEY, name VARCHAR(100)); -- Creates a new table
ALTER TABLE test ADD COLUMN description VARCHAR(100); -- Modifies an existing table
DROP TABLE test; -- Deletes a table from the database


/* 2. Data Mutations: `INSERT`, `UPDATE`, `DELETE`, `TRUNCATE` */
-- `INSERT`: Adds data to a table
INSERT INTO products (name, price, product_category_id)
VALUES ('solaris', 15000, 1), ('anti reflejo', 20000, 2);

-- `UPDATE`: Modifies existing data
UPDATE products
SET price = 10000
WHERE product_category_id = 1;

-- `DELETE`: Removes specific records from a table
DELETE FROM products
WHERE product_category_id = 1;

-- `TRUNCATE`: Deletes all records from a table
TRUNCATE TABLE products;


/* 3. Indexes: Unique Indexes, Non-Unique Indexes 
- Indexes are assigned to columns and allow faster queries
*/
-- Unique Indexes: By default, all keys and unique columns have indexes
    
-- Non-Unique Indexes: Manually created on fields to speed up searches without uniqueness.
CREATE INDEX idx_product_name ON products(name);

-- Composite Index: Combines multiple columns into a single index.
CREATE INDEX idx_product_name_category ON products(name, category_id);