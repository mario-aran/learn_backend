# Learn SQL and DBs

## 01. Introduction

- Concepts: SQL, Databases, Tables, Columns, Rows, Keys, ERD
- Tools: RDBMS, SQL Clients, Playgrounds
- Syntax: Queries, Semicolons, Naming Conventions, Comments, Data Types

## 02. Retrieving

- `SELECT`, `FROM`
- Aliases: `AS`
- Arithmetic Operators: `+`, `-`, `*`, `/`, `%`
- `SELECT DISTINCT`

## 03. Filtering

- `WHERE`
- Comparison Operators: `=`, `>`, `<`, `>=`, `<=`, `<>`
- NULL Values: `IS NULL`, `IS NOT NULL`
- Logical Operators: `AND`, `OR`, `NOT`
- Conditional Operators: `BETWEEN`, `IN`, `LIKE`

## 04. Sorting and Limiting

- `ORDER BY`
- `ASC`, `DESC`
- `LIMIT`, `OFFSET`

## 05. Data Manipulation

- Handling NULLs: `COALESCE`, `NULLIF`
- String Functions: `CONCAT`, `SUBSTRING`, `TRIM`, `UPPER`, `LOWER`
- Date Functions: `EXTRACT`, `DATE_TRUNC`, `AGE`
- Type Casting: `CAST`, `::`

## 06. Aggregating

- Aggregate Functions: `COUNT`, `SUM`, `AVG`, `MIN`, `MAX`
- `GROUP BY`
- `HAVING`

## 07. Modeling

![img-data-modeling](/lessons/sql/resources/modeling-relationships.png)

- Normalization
- Keys: Primary, Foreign, Composite
- Notations: Crow's Foot, Chen
- Relationships: Cardinality, Ordinality
- Constraints and Indexes

## 08. Joins

![img-joins](/lessons/sql/resources/joins.png)

- Outer Joins: `LEFT JOIN`, `RIGHT JOIN`, `FULL JOIN`
- `INNER JOIN`
- Self Join
- Multiple Joins

## 09. Nesting

- `CASE`
- Subqueries
- CTEs

## 10. Mutations

- Schema Mutations: `CREATE`, `ALTER`, `DROP`
- Data Mutations: `INSERT INTO`, `UPDATE SET`, `DELETE FROM`, `TRUNCATE`

## 11. Window Functions - pending

- ??

## 12. Set Operations

- Unions: `UNION`, `UNION ALL`
- `INTERSECT`
- `EXCEPT`
