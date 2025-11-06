/* ===================
   Enforce constraints 
   with CREATE TABLE
   =================== */

-- create a duckdb file first
-- syntax: duckdb -ui constraints.duckdb

-- NOT NULL constraint: column cannot have NULL value
CREATE TABLE students 
    (name VARCHAR NOT NULL);

INSERT INTO students (name) 
VALUES (NULL), ('Amy'); -- both rows will not be inserted

DROP TABLE students

-- UNIQUE constraint: all values in a column must be different
CREATE TABLE students 
    (name VARCHAR UNIQUE,
    age INTEGER);

INSERT INTO students (name, age) 
VALUES ('Amy', 4), 
       ('Bill', 8),
       ('Bill', 6); -- no rows are inserted

DROP TABLE students

-- CHECK constraint: all values in a column must satisfy a condition
CREATE TABLE students 
    (name VARCHAR UNIQUE,
    age INTEGER CHECK (age>=10));

INSERT INTO students (name, age) 
VALUES ('Amy', 13),
       ('Bill', 5); -- no rows are inserted

DROP TABLE students

-- Default constraint: set a default value for a column if no value is specified
CREATE TABLE students 
    (name VARCHAR UNIQUE,
    school_year INTEGER DEFAULT 2025);

INSERT INTO students (name) 
VALUES ('Amy'),
       ('Bill'); -- both rows will have value of 2025 in the second column
DROP TABLE students

-- csv load?