/* Basics */

/* Concepts */
- SQL: -- (Structured Query Language), allows to interact with a database.
- DB: -- Data organized and structured in multiple tables.
- Tables: -- Matrix of records, like excel sheets.
- Columns: -- Fields of a table.
- Ids: -- Keys that uniquely identify a record.
- Rows: -- Records of a table.

/* Tools */
- RDBMS: -- (Relational Database Management System), PostgreSQL, MySQL, SQL Server, Oracle.
- Clients: -- DBeaver, SQL Server Management Studio, MySQL Workbench.
- Playgrounds: -- SQL Playground
- DBeaver Settings: "https://dbeaver.io/download/"
    -- Connection: new database connection -> all -> postgresql -> host, port, database, user, password
    -- Settings (UPPERCASE): "window" -> "preferences" -> "editors" -> "sql editor" -> "formatting" -> "keyword case: upper"
- SQL Playground: "https://sqlplayground.app/"
    -- Settings: "create sandbox" -> "dbms: postgresql & template: world" -> "create sandbox"

/* Syntax */
- Queries: `SELECT column_name FROM table_name;`
- Semicolon: `;`
- Case insensitive
- UPPERCASE: -- In SQL commands
- snake_case: -- In name of tables/columns 

/* Data Types */
- INTEGER: 1
- FLOAT: 1.1
- VARCHAR: 'This is a string'
- DATE/TIMESTAMP: '2024-12-13 14:30:45'
- BOOLEAN: true, false
- NULL: NULL

/* Comments */
-- This is a single line comment

/*
This is a multi-line comment
in multiple lines
*/