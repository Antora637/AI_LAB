Consider the following employee database:                                                                               
employee (person_name, street, city) 
works (person_name, company_name, salary) 
company (company_name, city) 
Give an expression in the relational algebra to express each of the following queries: 
 
i. Find the name of each employee who lives in city “Pabna”.  
ii. Find the name of each employee who lives in “Pabna” and whose salary is greater than $100,000.  
iii. 
Find the name of each employee in square company with a salary between $90,000 and $100,000.  
iv. Show the name of all employees who lives in city either “Pabna” or “Natore”. 
Find the name of each employee who earns more than the employee whose name is Rahim. complete code deo mysql e .

-- =========================
-- DATABASE
-- =========================
CREATE DATABASE employee_db;
USE employee_db;

-- =========================
-- TABLES
-- =========================

CREATE TABLE employee (
    person_name VARCHAR(50) PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE company (
    company_name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE works (
    person_name VARCHAR(50),
    company_name VARCHAR(50),
    salary INT,
    PRIMARY KEY (person_name, company_name)
);

-- =========================
-- SAMPLE DATA
-- =========================

INSERT INTO employee VALUES
('Rahim','Road 1','Pabna'),
('Karim','Road 2','Pabna'),
('Sumi','Road 3','Natore'),
('Nadia','Road 4','Dhaka'),
('Hasan','Road 5','Pabna');

INSERT INTO company VALUES
('Square','Dhaka'),
('Beximco','Dhaka'),
('Tech Ltd','Chittagong');

INSERT INTO works VALUES
('Rahim','Square',95000),
('Karim','Square',100000),
('Sumi','Beximco',110000),
('Nadia','Square',85000),
('Hasan','Square',120000);

-- =========================
-- QUERIES (RELATIONAL ALGEBRA BASED)
-- =========================

-- (i) Employees who live in Pabna
SELECT person_name
FROM employee
WHERE city = 'Pabna';

-- =========================

-- (ii) Pabna + salary > 100000
SELECT e.person_name
FROM employee e
JOIN works w ON e.person_name = w.person_name
WHERE e.city = 'Pabna'
AND w.salary > 100000;

-- =========================

-- (iii) Square company + salary between 90000 and 100000
SELECT person_name
FROM works
WHERE company_name = 'Square'
AND salary BETWEEN 90000 AND 100000;

-- =========================

-- (iv) Employees who live in Pabna or Natore
SELECT person_name
FROM employee
WHERE city = 'Pabna'
OR city = 'Natore';

-- =========================

-- (v) Employees who earn more than Rahim
SELECT person_name
FROM works
WHERE salary >
(
    SELECT salary
    FROM works
    WHERE person_name = 'Rahim'
);