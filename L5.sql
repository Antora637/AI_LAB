-- Create Database
CREATE DATABASE college_db;

USE college_db;

-- Table 1
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

-- Table 2
CREATE TABLE marks (
    id INT,
    marks INT
);

-- Insert Data
INSERT INTO students VALUES (1, 'Rahim');
INSERT INTO students VALUES (2, 'Karim');
INSERT INTO students VALUES (3, 'Sadia');

INSERT INTO marks VALUES (1, 85);
INSERT INTO marks VALUES (2, 78);
INSERT INTO marks VALUES (4, 90);

-- Cartesian Product
SELECT * FROM students
CROSS JOIN marks;

-- Natural Join
SELECT * FROM students
NATURAL JOIN marks;

-- Left Join
SELECT * FROM students
LEFT JOIN marks
ON students.id = marks.id;

-- Right Join
SELECT * FROM students
RIGHT JOIN marks
ON students.id = marks.id;

-- Full Outer Join (MySQL way)
SELECT * FROM students
LEFT JOIN marks ON students.id = marks.id
UNION
SELECT * FROM students
RIGHT JOIN marks ON students.id = marks.id;