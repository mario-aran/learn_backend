/* Mutations */

/* 1. Schema Mutations: `CREATE`, `ALTER`, `DROP` */


/* 2. Data Mutations: `INSERT INTO`, `UPDATE SET`, `DELETE FROM`, `TRUNCATE` */
-- `INSERT INTO`: Adds data to a table
INSERT INTO products (name, price, product_category_id)
VALUES ('solaris', 15000, 1), ('anti reflejo', 20000, 2);

-- `UPDATE SET` Modifies existing data
UPDATE products
SET price = 10000
WHERE product_category_id = 1;

-- `DELETE FROM` Removes records from a table
DELETE FROM products
WHERE product_category_id = 1;



/* `CREATE` */
CREATE TABLE test (id INT PRIMARY KEY, name VARCHAR(100)); -- Creates a new table

/* `ALTER` */
ALTER TABLE test ADD COLUMN description VARCHAR(100); -- Modifies an existing table

/* `DROP` */
DROP TABLE test; -- Deletes a table from the database


/* 6. Indexes: Unique Indexes, Non-Unique Indexes
- Indexes are asigned to columns and allow faster queries
*/
-- Unique Indexes: By default, all keys and unique columns have indexes
    
-- Non-Unique Indexes: Manually created on fields to speed up searches without uniqueness.
CREATE INDEX idx_product_name ON products(name);

-- Composite Index: Combines multiple columns into a single index.
CREATE INDEX idx_product_name_category ON products(name, category_id);
