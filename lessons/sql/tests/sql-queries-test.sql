/* SQL Queries Test */

/* 1. Retrieving */
-- Show all the data in the products table.
-- Now, remove all columns except for the id of the product category and price.
-- Give an alias to these two columns.
-- Create a new column with the price multiplied by 2 and give it an alias. 
-- Remove the duplicate rows.


/* 2. Filtering */
-- Show all the data in orders to products table, filtered by unit price bigger than 100.
-- Now add a condition to make sure the price is bigger than 100 and less than 1000.
-- Convert the previous condition to a between.
-- Add a condition to still comply with the previous condition, but show only the orders to products that doesn't have empty created at dates
-- Now, all the previous should work as a group, but add an or condition where quantity is less than 2.
-- Negate the previous condition.


/* 3. Sorting and Limiting */
-- Show all the products data, and order them by price with a descending order.
-- Now, add after the previous order, an order by name with an ascending order.
-- Now, modify the previous query to show me only the 5 most expensive products.


/* 4. Aggregating */
-- Count all the records from the products table.
-- Tell me how much money we earned with all the sales.
-- Tell me the average price of all the products.
-- Group orders to products by discounts, and tell me how many records are grouped inside each discount.
-- Add a condition to the previous query, to show only the discounts with more than one grouped record.


/* 5. Joins */
-- Do a join between orders and product categories, and show me all the data.
-- Add every knowledge applied in the previous questions, to show me a report grouped by products to see which 5 products are sold the most.