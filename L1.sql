-- Create Database
CREATE DATABASE college_db;

-- Use Database
USE college_db;

-- Create Table
CREATE TABLE students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    department VARCHAR(50),
    marks INT
);

-- INSERT DATA
INSERT INTO students (name, department, marks)
VALUES 
('Rahim', 'CSE', 85),
('Karim', 'EEE', 78),
('Nusrat', 'CSE', 90),
('Arafat', 'BBA', 70);

-- VIEW DATA
SELECT * FROM students;

SET SQL_SAFE_UPDATES = 0;


-- UPDATE DATA
UPDATE students
SET marks = 88
WHERE name = 'Karim';

UPDATE students
SET department = 'IT', marks = 92
WHERE name = 'Nusrat';

-- VIEW UPDATED DATA
SELECT * FROM students;

-- DELETE DATA
DELETE FROM students
WHERE name = 'Arafat';


-- FINAL OUTPUT
SELECT * FROM students;

SET SQL_SAFE_UPDATES = 1;