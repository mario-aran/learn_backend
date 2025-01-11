/* Lesson 05: Data Manipulation */

/* 1. Handling NULLs */
SELECT COALESCE(name, 'N/A') FROM products; -- Replaces NULL with a default value


/* 2. String Functions */
SELECT CONCAT(name, ' ', name) FROM products; -- Combines two strings
SELECT SUBSTRING(name, 1, 3) FROM products; -- Extracts part of a string (3 characters starting from position 1)
SELECT TRIM(name) FROM products; -- Removes leading and trailing spaces from a string
SELECT UPPER(name) FROM products; -- Converts string to uppercase
SELECT LOWER(name) FROM products; -- Converts string to lowercase


/* 3. Date Functions */
SELECT EXTRACT(YEAR FROM created_at) FROM products; -- Extracts a specific part of a date (e.g., year, month, day)


/* 4. Type Casting */
SELECT CAST(unit_price AS INT) FROM products; -- Converts a value from one data type to another