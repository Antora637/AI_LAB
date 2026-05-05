-- Consider the following employee database  
employee(employee_name, street, city) 
works(employee_name, company_name, salary) 
company(company_name, city)  
manages(employee_name, manager_name) 
Figure: A-1 
Give an expression in the relational algebra to express each of the following queries: 
i)   Find the names of all employees who work for “First Bank Corporation”. 
ii) Find the names and cities of residence of all employees who work for “First   
Corporation”. 
Bank 
iii) Find the names, street address and cities of residence of all employees who work for “First 
Bank Corporation” and earn more than BDT 10,000. 

CREATE DATABASE employee_db;
USE employee_db;

-- =========================
-- TABLES CREATE
-- =========================

CREATE TABLE employee (
    employee_name VARCHAR(50) PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE company (
    company_name VARCHAR(50) PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE works (
    employee_name VARCHAR(50),
    company_name VARCHAR(50),
    salary INT,
    PRIMARY KEY (employee_name, company_name)
);

CREATE TABLE manages (
    employee_name VARCHAR(50),
    manager_name VARCHAR(50),
    PRIMARY KEY (employee_name)
);

-- =========================
-- INSERT DATA
-- =========================

INSERT INTO employee VALUES
('Rahim','Road 1','Dhaka'),
('Karim','Road 2','Dhaka'),
('Sumi','Road 3','Chittagong'),
('Nadia','Road 4','Dhaka'),
('Hasan','Road 5','Dhaka');

INSERT INTO company VALUES
('First Bank Corporation','Dhaka'),
('Tech Ltd','Dhaka'),
('SoftTech','Chittagong');

INSERT INTO works VALUES
('Rahim','First Bank Corporation',9000),
('Karim','First Bank Corporation',12000),
('Sumi','Tech Ltd',15000),
('Nadia','First Bank Corporation',11000),
('Hasan','SoftTech',8000);

INSERT INTO manages VALUES
('Rahim','Karim'),
('Karim','Hasan'),
('Sumi','Nadia');

-- =========================
-- QUERIES (RELATIONAL ALGEBRA BASED)
-- =========================

-- (i) Employees who work for First Bank Corporation
SELECT employee_name
FROM works
WHERE company_name = 'First Bank Corporation';

-- (ii) Names and cities of employees who work for First Bank Corporation
SELECT e.employee_name, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation';

-- (iii) Names, street, city of employees who work for First Bank Corporation
-- AND earn more than 10000
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'First Bank Corporation'
AND w.salary > 10000;