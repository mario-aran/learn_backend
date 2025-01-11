/* Lesson 07: Modeling */

/* 1. Normalization */
-- D.R.Y.: (Don't Repeat Yourself), Data is stored in multiple tables, with each table having a single responsibility 


/* 2. Keys: Primary, Foreign, Composite */
-- Primary Keys: (PK), ensures unique identifiers for each row
-- Foreign Keys: (FK), links tables and enforces referential integrity
-- Composite Keys: Used in Many-to-Many tables to ensure uniqueness through two foreign primary keys


/* 3. Relationships: Cardinality, Ordinality
- To evaluate the relationship of a table, always place the symbols on the destination table
*/
-- Cardinality: One-to-One, One-to-Many, Many-to-Many
-- Ordinality: Mandatory (1), Optional (0)


/* 4. Notations: Crow's Foot, Number */
-- Crow's Foot, Number:
    - "One":              |, (1)
    - "Many":             <, (N) 
    - "Zero-or-one":      O|, (0..1)
    - "One-and-only-one": ||, (1..1) 
    - "Zero-or-many":     O<, (0..N) 
    - "One-or-many":      |<, (1..N)

-- Examples:
    - "Crow's Foot Notation": 'Students || -- |< Enrolls >| -- O| Courses'
    - "Numeric Notation": 'Students (1..1) -- (1..N) Enrolls (N..1) -- (0..1) Courses'


/* 5. Constraints: Unique, Not Null */
-- Unique: Ensures distinct values in a column, even if its not a primary key
-- Not Null: Prevents NULL values in a column