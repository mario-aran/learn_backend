/* Lesson 01: Introduction */

/* 1. Concepts: SQL, Databases, Tables, Columns, Rows, Keys, ERD */
-- SQL: Structured Query Language, allows to interact with a database
-- DBs: Databases, data organized and structured in multiple tables (like huge text file)
-- Tables: Matrix of records, like excel sheets
-- Columns: Fields of a table
-- Rows: Records of a table
-- Keys: Identify records in a table (ids)
-- ERD: Entity Relationship Diagram, used to visualize the relationships between tables


/* 2. Tools: RDBMS, SQL Clients, Playgrounds */
-- RDBMS: (Relational Database Management System), PostgreSQL, MySQL, Microsoft SQL Server, Oracle
-- Clients: DBeaver, SQL Server Management Studio, MySQL Workbench
-- Playgrounds: SQL Playground


/* 3. Syntax: Queries, Semicolons, Naming Conventions, Data Types, Comments */
-- Queries:
    - "Query Example": SELECT * FROM products;
    - "Query Template":
        /* Select */
        /* From, Join */
        /* Where */
        /* Group By, Having */
        /* Order By, Limit */
        /* Semicolon */

-- Semicolons: `;` Optional but recommended to define where the query ends

-- Naming Conventions: SQL is Case insensitive
    - "UPPERCASE": -- Recommended for SQL keywords
    - "snake_case": -- Recommended for everything else, like tables/columns

-- Data Types:
    - INTEGER: 1 -- Whole numbers
    - NUMERIC(precision, scale): 1.1 -- Decimals
    - VARCHAR(length): 'This is text' -- Short texts
    - TEXT: 'This is text' -- Long texts
    - DATE: '2025-01-31' -- Dates
    - TIMESTAMP: '2025-01-31 12:30:45' -- Dates with time
    - BOOLEAN: true -- True or false

-- Comments:
    -- This is a single line comment

    /*
    This is a multi-line comment
    in multiple lines
    */