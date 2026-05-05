-- Create Database
CREATE DATABASE college_db;

-- Use Database
USE college_db;

-- CREATE TABLE
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50)
);

-- VIEW STRUCTURE
DESCRIBE students;

-- ALTER TABLE (Add Column)
ALTER TABLE students
ADD marks INT;

-- ALTER TABLE (Modify Column)
ALTER TABLE students
MODIFY name VARCHAR(100);

-- ALTER TABLE (Drop Column)
ALTER TABLE students
DROP COLUMN department;

-- VIEW UPDATED STRUCTURE
DESCRIBE students;

-- DROP TABLE
DROP TABLE students;