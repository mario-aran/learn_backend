/* Lesson 05: Data Manipulation */

/* 1. Handling NULLs: `COALESCE`, `NULLIF` */
SELECT COALESCE(name, 'N/A') FROM products; -- Replaces NULL with a default value
SELECT NULLIF(name, '') FROM products; -- Returns NULL if the two arguments are equal, otherwise returns the first argument


/* 2. String Functions: `CONCAT`, `SUBSTRING`, `TRIM`, `UPPER`, `LOWER` */
SELECT CONCAT(name, ' ', name) FROM products; -- Combines two strings
SELECT SUBSTRING(name, 1, 3) FROM products; -- Extracts part of a string (3 characters starting from position 1)
SELECT TRIM(name) FROM products; -- Removes leading and trailing spaces from a string
SELECT UPPER(name) FROM products; -- Converts string to uppercase
SELECT LOWER(name) FROM products; -- Converts string to lowercase


/* 3. Date Functions: `EXTRACT` */
SELECT EXTRACT(YEAR FROM created_at) FROM products; -- Extracts a specific part of a date (e.g., year, month, day)


/* 4. Type Casting: `CAST`, `::` */
SELECT CAST(unit_price AS INT) FROM products; -- Converts a value from one data type to another
SELECT unit_price::INT FROM products; -- Shorthand for type casting