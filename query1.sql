-- Consider the following relational database:                                                                               
                                 classroom(building(ul), room_number(ul), capacity)  
                                 department(dept_name(ul), building, budget)  
                                 section(course_id(ul), sec_id(ul), semester, year, building)  
                                 course(course_id(ul), title, dept_name(ul), credits)  
                                 instructor(ID(ul), name, dept_name(ul), salary)  
                                 teaches(ID(ul), course_id(ul), sec_id(ul), semester, year)  
here, primary keys are ul( underlined). Give an expression in the SQL to express each of the  
following queries: 
i. Find the department names of all instructors. 
ii. Retrieve the names of all instructors, along with their department names and department 
building name. 
iii. Find the names of all departments whose building name includes the substring 'Watson'. 
iv. Show the list of entire instructor in descending order of salary. 
v. Find the names of instructors with salary amounts between $90,000 and $100,000. 
vi. Find the set of all courses taught either in Fall 2017 or in Spring 2018, or both. 
vii. Find the average salary of instructors in the Computer Science department. 
viii. Find the average salary in each department. 
Find the average salary of instructors in those departments where the average salary is more than 
$42,000. mysql full code deo eitar jonno


-- =========================
-- DATABASE CREATE
-- =========================
CREATE DATABASE university1;
USE university1;

-- =========================
-- TABLES
-- =========================

CREATE TABLE classroom (
    building VARCHAR(50),
    room_number VARCHAR(10),
    capacity INT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE department (
    dept_name VARCHAR(50),
    building VARCHAR(50),
    budget DECIMAL(12,2),
    PRIMARY KEY (dept_name)
);

CREATE TABLE student (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    tot_cred INT
);

CREATE TABLE course (
    course_id VARCHAR(20) PRIMARY KEY,
    title VARCHAR(100),
    dept_name VARCHAR(50),
    credits INT
);

CREATE TABLE instructor (
    ID INT PRIMARY KEY,
    name VARCHAR(50),
    dept_name VARCHAR(50),
    salary INT
);

CREATE TABLE section (
    course_id VARCHAR(20),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    building VARCHAR(50),
    PRIMARY KEY (course_id, sec_id, semester, year)
);

CREATE TABLE takes (
    ID INT,
    course_id VARCHAR(20),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    grade VARCHAR(5),
    PRIMARY KEY (ID, course_id, sec_id, semester, year)
);

CREATE TABLE teaches (
    ID INT,
    course_id VARCHAR(20),
    sec_id VARCHAR(10),
    semester VARCHAR(10),
    year INT,
    PRIMARY KEY (ID, course_id, sec_id, semester, year)
);

-- =========================
-- INSERT DATA
-- =========================

INSERT INTO department VALUES
('Computer Science','Watson',500000),
('Physics','Watson',300000),
('EEE','Waz Building',400000);

INSERT INTO classroom VALUES
('Watson','101',50),
('Watson','102',60),
('Waz Building','201',40);

INSERT INTO student VALUES
(1,'Rahim','Computer Science',120),
(2,'Karim','Physics',100),
(3,'Sumi','EEE',90),
(4,'Nadia','Computer Science',110);

INSERT INTO instructor VALUES
(101,'Dr. Ali','Computer Science',95000),
(102,'Dr. Hasan','Physics',88000),
(103,'Dr. Rahman','EEE',99000),
(104,'Dr. Khan','Computer Science',93000);

INSERT INTO course VALUES
('C101','Database','Computer Science',3),
('P201','Quantum Physics','Physics',4),
('E301','Circuit','EEE',3);

INSERT INTO section VALUES
('C101','1','Fall',2017,'Watson'),
('C101','1','Spring',2018,'Watson'),
('P201','1','Fall',2017,'Watson'),
('E301','1','Spring',2018,'Waz Building');

INSERT INTO takes VALUES
(1,'C101','1','Fall',2017,'A'),
(2,'P201','1','Fall',2017,'B'),
(3,'C101','1','Spring',2018,'A');

INSERT INTO teaches VALUES
(101,'C101','1','Fall',2017),
(102,'P201','1','Fall',2017),
(103,'E301','1','Spring',2018);

-- =========================
-- QUERIES
-- =========================

-- (i) department names of instructors
SELECT DISTINCT dept_name
FROM instructor;

-- (ii) instructor + dept + building
SELECT i.name, i.dept_name, d.building
FROM instructor i
JOIN department d ON i.dept_name = d.dept_name;

-- (iii) departments with Watson
SELECT dept_name
FROM department
WHERE building LIKE '%Watson%';

-- (iv) instructors descending salary
SELECT *
FROM instructor
ORDER BY salary DESC;

-- (v) salary between 90000 and 100000
SELECT name
FROM instructor
WHERE salary BETWEEN 90000 AND 100000;

-- (vi) courses in Fall 2017 or Spring 2018
SELECT DISTINCT course_id
FROM teaches
WHERE (semester='Fall' AND year=2017)
   OR (semester='Spring' AND year=2018);

-- (vii) avg salary Computer Science
SELECT AVG(salary) AS avg_salary
FROM instructor
WHERE dept_name='Computer Science';

-- (viii) avg salary each dept
SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name;

-- (ix) avg salary > 42000
SELECT dept_name, AVG(salary) AS avg_salary
FROM instructor
GROUP BY dept_name
HAVING AVG(salary) > 42000;