## 05. Data Manipulation

- Handling NULLs: `COALESCE`, `NULLIF`
- String Functions: `CONCAT`, `SUBSTRING`, `TRIM`, `UPPER`, `LOWER`
- Date Functions: `EXTRACT`, `DATE_TRUNC`, `AGE`
- Type Casting: `CAST`, `::`


Fields Manipulation (PostgreSQL)
1. Data Types
Key types:
INT: Whole numbers.
VARCHAR(n): Text up to n characters.
DATE: Calendar dates (e.g., 2025-01-01).
NUMERIC(p, s): Precise numbers (e.g., NUMERIC(10, 2) for currency).
2. Handling NULL
COALESCE: Replaces NULL with a default.
sql
Copy code
SELECT COALESCE(price, 0) AS adjusted_price FROM products;
NULLIF: Returns NULL if two values match.
sql
Copy code
SELECT NULLIF(sales_price, cost_price) AS profit FROM products;
3. String Functions
CONCAT: Combines strings.
sql
Copy code
SELECT CONCAT(first_name, ' ', last_name) AS full_name FROM employees;
SUBSTRING: Extracts a part of a string.
sql
Copy code
SELECT SUBSTRING(product_code, 1, 3) AS category FROM products;
TRIM: Removes leading/trailing spaces.
sql
Copy code
SELECT TRIM(name) AS cleaned_name FROM customers;
UPPER/LOWER: Changes case.
sql
Copy code
SELECT UPPER(name) AS name_upper, LOWER(name) AS name_lower FROM customers;
4. Date Functions
EXTRACT: Extracts a specific part of a date.
sql
Copy code
SELECT EXTRACT(YEAR FROM hire_date) AS hire_year FROM employees;
DATE_TRUNC: Truncates to a unit.
sql
Copy code
SELECT DATE_TRUNC('month', sales_date) AS sales_month FROM sales;
AGE: Calculates difference between two dates.
sql
Copy code
SELECT AGE(NOW(), birth_date) AS age FROM customers;
5. Casting
CAST: Converts data types.
sql
Copy code
SELECT CAST(sales_amount AS INT) AS sales_int FROM sales;
:: Syntax: Shorthand for casting.
sql
Copy code
SELECT sales_amount::INT AS sales_int FROM sales;
Additional Notes
Regex Functions:
Use REGEXP_REPLACE and REGEXP_MATCHES for advanced string operations.
sql
Copy code
SELECT REGEXP_REPLACE(email, '@.*$', '@example.com') AS standardized_email FROM users;
Interval Arithmetic:
Add or subtract time with intervals.
sql
Copy code
SELECT order_date + INTERVAL '7 days' AS delivery_date FROM orders;
This covers all essential field manipulations in PostgreSQL.