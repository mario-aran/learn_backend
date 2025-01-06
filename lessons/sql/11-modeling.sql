/* Modeling */

/* Constraints */
-- Primary Key: Ensures unique identifiers for each row
-- Foreign Key: Links tables and enforces referential integrity
-- Unique: Ensures distinct values in a column thats not a pk
-- Not Null: Prevents NULL values.
-- Default: Sets a default value when none is provided.
-- Check: Defines conditions for column values.

/* Indexes
- Primary Key and Unique columns have Indexes by default
*/

-- Non-Unique Index: Manually created to speed up searches without uniqueness.
CREATE INDEX idx_product_name ON products(name);

-- Composite Index: Combines multiple columns into a single index.
CREATE INDEX idx_product_name_category ON products(name, category_id);

/* `CREATE` */
CREATE TABLE test (id INT PRIMARY KEY, name VARCHAR(100)); -- Creates a new table

/* `ALTER` */
ALTER TABLE test ADD COLUMN description VARCHAR(100); -- Modifies an existing table

/* `DROP` */
DROP TABLE test; -- Deletes a table from the database