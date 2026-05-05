create database Exp1_2;

use Exp1_2;
-- Table 1: students
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT
);

INSERT INTO students VALUES
(1, 'Mim', 101),
(2, 'Anto', 102),
(3, 'Umme', 101),
(4, 'Habiba', 103),
(5, 'Rafi', NULL);

-- Table 2: departments
CREATE TABLE departments (
    dept_id INT primary key ,
    dept_name VARCHAR(50)
);

INSERT INTO departments VALUES
(101, 'CSE'),
(102, 'EEE'),
(104, 'BBA');

SELECT * FROM students
CROSS JOIN departments;     -- cartesian product

SELECT s.id, s.name, s.dept_id, d.dept_name   -- column bad disi
FROM students s
CROSS JOIN departments d;

-- natural join
SELECT * FROM students
NATURAL JOIN departments;

-- inner join 
SELECT s.name, d.dept_name
FROM students s
INNER JOIN departments d
ON s.dept_id = d.dept_id;

-- left join
select s.name,d.dept_name
from students s
left join departments d
on s.dept_id=d.dept_id;

-- right join
select s.name,d.dept_name
from students s
right join departments d
on s.dept_id=d.dept_id;

-- full join
select s.name,d.dept_name
from students s
left join departments d
on s.dept_id=d.dept_id
union
select s.name,d.dept_name
from students s
right join departments d
on s.dept_id=d.dept_id;

-- exp6
select * from students;

select count(*) as total_student  -- count
from students;


