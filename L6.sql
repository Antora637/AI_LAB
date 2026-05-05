-- Create Database
CREATE DATABASE college_db;
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

-- COUNT
SELECT COUNT(*) AS total_students FROM students;

-- MAX
SELECT MAX(marks) AS highest_marks FROM students;

-- MIN
SELECT MIN(marks) AS lowest_marks FROM students;

-- AVG
SELECT AVG(marks) AS average_marks FROM students;