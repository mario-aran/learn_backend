/* Modification */

-- INSERT INTO: Adds data to a table.
INSERT INTO employees (name, department_id, salary)  
VALUES ('John Doe', 2, 60000);  


INSERT INTO employees (name, department_id, salary)  
VALUES ('Jane Smith', 3, 75000), ('Mark Brown', 4, 50000);  

-- UPDATE SET: Modifies existing data.
UPDATE employees  
SET salary = salary * 1.1  
WHERE department_id = 3;  

-- DELETE FROM: Removes data from a table.
DELETE FROM employees  
WHERE department_id = 4;  


-- Data Definition
CREATE TABLE tab (id INT PRIMARY KEY, name VARCHAR(100)); -- Creates a new table
ALTER TABLE tab ADD COLUMN col VARCHAR(100); -- Modifies an existing table
DROP TABLE tab; -- Deletes a table from the database