/* Introduction */

/* 1. Concepts
*/
- SQL: -- (Structured Query Language), allows to interact with a database.
- DB: -- Data organized and structured in multiple tables.
- Tables: -- Matrix of records, like excel sheets.
- Columns: -- Fields of a table.
- Rows: -- Records of a table.
- Keys: -- Identify records in a table, either PK or FK.
    - PK: -- (Primary Key), unique identifier for each record in a table.
    - FK: -- (Foreign Key), reference to the primary key of another table.
- ERD: -- (Entity Relationship Diagram), used to visualize the relationships between tables.

/* 2. Tools
*/
- RDBMS: -- (Relational Database Management System), PostgreSQL, MySQL, Micorsoft SQL Server, Oracle.
- Clients: -- DBeaver, SQL Server Management Studio, MySQL Workbench.
- Playgrounds: -- SQL Playground.
- Tool Settings:
    - SQL Playground: "https://sqlplayground.app/"
    -- Settings: "create sandbox" -> "dbms: postgresql & template: world" -> "create sandbox"
    - "https://dbeaver.io/download/"
    -- Connection: "new database connection" -> "all" -> "postgresql" -> "host, port, database, user, password"
    -- Settings (UPPERCASE): "window" -> "preferences" -> "editors" -> "sql editor" -> "formatting" -> "keyword case: upper"


/* 3. Syntax
*/
- Queries: `SELECT * FROM products;`
- SQL is Case insensitive but:
    UPPERCASE: -- Recommended for SQL keywords
    snake_case: -- Recommended for everything else, like tables/columns
- Semicolon: `;` -- Optional but recommended to define where the query ends

/* Comments */
-- This is a single line comment

/*
This is a multi-line comment
in multiple lines
*/

- Template:
    /* Select */
    /* From, Join */
    /* Where */
    /* Group By, Having */
    /* Order By, Limit, Offset */
    /* Semicolon */
- Basic Data Types: Numeric, Text, Date/Time, Boolean, NULL

/* Data Types */
- INTEGER: 1
- NUMERIC(precision, scale): 1.1
- VARCHAR(length): 'This is text' 
- TEXT: 'This is text'
- DATE: '2025-01-31'
- TIMESTAMP: '2025-01-31 12:30:45'
- BOOLEAN: true, false