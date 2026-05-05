-- Consider the following relational database:                                                                        
department(dept_name(ul), building, budget)  
section(course_id(ul), sec_id(ul), semester, year, building)  
course(course_id(ul), title, dept_name(ul), credits)  
instructor(ID(ul), name, dept_name(ul), salary)  
teaches(ID(ul), course_id(ul), sec_id(ul), semester, year)  
Give an expression in the relational algebra to express each of the following queries: 
i.  Find all instructors with salary greater than $90,000.  
ii. Find the set of all courses taught in both the Fall 2017 and the Spring 2018 semesters.  
iii. Find the ID and name of those instructors who earn more than the instructor whose ID is 12121.  
iv. Find the name of an instructor who has taught course.  
Find the names of all instructors except the Physics department. 

-- =========================
-- DATABASE
-- =========================
CREATE DATABASE university_db;
USE university_db;

-- =========================
-- TABLES
-- =========================

CREATE TABLE department (
    dept_name VARCHAR(50) PRIMARY KEY,
    building VARCHAR(50),
    budget DECIMAL(12,2)
);

CREATE TABLE course (
    course_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT,
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE section (
    course_id VARCHAR(20),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    building VARCHAR(50),
    PRIMARY KEY (course_id, sec_id, semester, year),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

CREATE TABLE teaches (
    ID INT,
    course_id VARCHAR(20),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year),
    FOREIGN KEY (ID) REFERENCES instructor(ID),
    FOREIGN KEY (course_id) REFERENCES course(course_id)
);

-- =========================
-- SAMPLE DATA
-- =========================

INSERT INTO department VALUES
('CSE','Watson',500000),
('Physics','Newton',300000),
('EEE','Waz Building',400000);

INSERT INTO course VALUES
('C101','Database','CSE',3),
('P201','Quantum Physics','Physics',4),
('E301','Circuit','EEE',3);

INSERT INTO instructor VALUES
(12121,'Dr. Rahman','CSE',95000),
(12122,'Dr. Hasan','Physics',88000),
(12123,'Dr. Ali','CSE',105000);

INSERT INTO section VALUES
('C101','1','Fall',2017,'Watson'),
('C101','2','Spring',2018,'Watson'),
('P201','1','Fall',2017,'Newton'),
('E301','1','Spring',2018,'Waz Building');

INSERT INTO teaches VALUES
(12121,'C101','1','Fall',2017),
(12121,'C101','2','Spring',2018),
(12122,'P201','1','Fall',2017),
(12123,'E301','1','Spring',2018);

-- =========================
-- QUERIES (RELATIONAL ALGEBRA BASED)
-- =========================

-- (i) salary > 90000
SELECT *
FROM instructor
WHERE salary > 90000;

-- (ii) courses taught in BOTH Fall 2017 AND Spring 2018
SELECT course_id
FROM teaches
WHERE semester='Fall' AND year=2017
INTERSECT
SELECT course_id
FROM teaches
WHERE semester='Spring' AND year=2018;

-- MySQL doesn't support INTERSECT, so alternative:
SELECT t1.course_id
FROM teaches t1
WHERE (t1.semester='Fall' AND t1.year=2017)
AND t1.course_id IN (
    SELECT t2.course_id
    FROM teaches t2
    WHERE t2.semester='Spring' AND t2.year=2018
);

-- (iii) instructors earning more than ID 12121
SELECT i1.ID, i1.name
FROM instructor i1
WHERE i1.salary > (
    SELECT salary
    FROM instructor
    WHERE ID = 12121
);

-- (iv) instructors who have taught courses
SELECT DISTINCT i.name
FROM instructor i
JOIN teaches t ON i.ID = t.ID;

-- (v) all instructors except Physics department
SELECT name
FROM instructor
WHERE dept_name <> 'Physics';