                                classroom(building(ul), room_number(ul), capacity)  
                                 student(ID(ul), name, dept_name(ul), tot_cred)  
                                 department(dept_name(ul), building, budget)  
                                 takes(ID9ul), course_id(ul), sec_id, semester, year, grade)  
                                 section(course_id(ul), sec_id(ul), semester, year, building)  
                                 course(course_id(ul), title, dept_name(ul), credits)  
                                 instructor(ID(ul), name, dept_name(ul), salary)  
                                 teaches(ID(ul), course_id(ul), sec_id(ul), semester, year)  
here, primary keys are underlined(ul). Give an expression in the SQL to express each of the following  
queries: 
i. Retrieve the number of instructors in each department. 
ii. Find the names of all departments whose building name beginning with 'Waz'. 
iii. Find those departments where the average salary of the instructors is more than $42,000. 
iv. Show the list of entire instructor in ascending order of salary. 
v. Delete all instructors with a salary between $13,000 and $15,000. 
vi. List the names of students along with the titles of courses that they have taken. 
vii. Find all students who have not taken a course. 
Find all Physics courses offered in the Fall 2017 semester in the Watson building by defined a view 
physics_fall_2017.   give me full mysql code with databasefull code deo

CREATE DATABASE university;
USE university;


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


INSERT INTO department VALUES
('CSE','Waz Building',500000),
('Physics','Watson',300000),
('EEE','Waz Tower',400000);

INSERT INTO classroom VALUES
('Watson','101',50),
('Watson','102',60),
('Waz Building','201',40);

INSERT INTO student VALUES
(1,'Rahim','CSE',120),
(2,'Karim','Physics',100),
(3,'Sumi','EEE',90),
(4,'Nadia','CSE',110);

INSERT INTO instructor VALUES
(101,'Dr. Ali','CSE',45000),
(102,'Dr. Hasan','Physics',50000),
(103,'Dr. Rahman','EEE',14000),
(104,'Dr. Khan','CSE',43000);

INSERT INTO course VALUES
('C101','Database','CSE',3),
('P201','Quantum Physics','Physics',4),
('E301','Circuit','EEE',3);

INSERT INTO section VALUES
('C101','1','Fall',2017,'Watson'),
('P201','1','Fall',2017,'Watson'),
('E301','1','Spring',2018,'Waz Building');

INSERT INTO takes VALUES
(1,'C101','1','Fall',2017,'A'),
(2,'P201','1','Fall',2017,'B');

INSERT INTO teaches VALUES
(101,'C101','1','Fall',2017),
(102,'P201','1','Fall',2017);



-- (i) number of instructors in each dept
SELECT dept_name, COUNT(*) AS total_instructors
FROM instructor
GROUP BY dept_name;

-- (ii) dept starting with Waz
SELECT dept_name
FROM department
WHERE building LIKE 'Waz%';

-- (iii) avg salary > 42000
SELECT dept_name
FROM instructor
GROUP BY dept_name
HAVING AVG(salary) > 42000;

-- (iv) instructors by salary
SELECT * FROM instructor ORDER BY salary ASC;

-- (v) delete salary 13000-15000
DELETE FROM instructor
WHERE salary BETWEEN 13000 AND 15000;

-- (vi) student + course title
SELECT s.name, c.title
FROM student s
JOIN takes t ON s.ID = t.ID
JOIN course c ON t.course_id = c.course_id;

-- (vii) students not taking course
SELECT * FROM student
WHERE ID NOT IN (SELECT DISTINCT ID FROM takes);

-- =========================
-- VIEW
-- =========================

CREATE VIEW physics_fall_2017 AS
SELECT c.course_id, c.title
FROM course c
JOIN section s ON c.course_id = s.course_id
WHERE c.dept_name = 'Physics'
AND s.semester = 'Fall'
AND s.year = 2017
AND s.building = 'Watson';

-- check view
SELECT * FROM physics_fall_2017;