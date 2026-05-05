-- Create Database
CREATE DATABASE college_db;

-- Use Database
USE college_db;

-- Create Table
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    marks INT
);

-- Insert Data
INSERT INTO students VALUES (1, 'Rahim', 'CSE', 85);
INSERT INTO students VALUES (2, 'Karim', 'EEE', 78);
INSERT INTO students VALUES (3, 'Sadia', 'CSE', 92);
INSERT INTO students VALUES (4, 'Nabila', 'BBA', 65);
INSERT INTO students VALUES (5, 'Tanvir', 'CSE', 74);

-- SELECT + FROM (All Data)
SELECT * FROM students;

-- SELECT Specific Columns
SELECT name, marks FROM students;

-- WHERE Clause (Filter by Department)
SELECT * FROM students
WHERE department = 'CSE';

-- WHERE Clause (Marks greater than 80)
SELECT * FROM students
WHERE marks > 80;

-- WHERE Clause (Range condition)
SELECT * FROM students
WHERE marks BETWEEN 70 AND 90;