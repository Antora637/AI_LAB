
-- Consider the following employee database where primary keys are underlined. Give an SQL DDL 
definition of this database then write SQL expression for each of the queries given bellow. 
employee (employee_name, street, city) 
works (employee_name, company_name, salary) 
company (company_name, city) 
manages (employee_name, manager_name) 
Fig: Employee database. 
i. 
Find the names and cities of all employees who work in abc bank ltd. 
Find the names, street address and cities of all employees who work in abc bank ltd and earn more than 
BDT 50000.mysql complete code

-- =========================
-- DATABASE CREATE
-- =========================
CREATE DATABASE employee_db;
USE employee_db;

-- =========================
-- TABLES (DDL)
-- =========================

CREATE TABLE employee (
    employee_name VARCHAR(50) PRIMARY KEY,
    street VARCHAR(100),
    city VARCHAR(50)
);

CREATE TABLE company (
    company_name VARCHAR(100) PRIMARY KEY,
    city VARCHAR(50)
);

CREATE TABLE works (
    employee_name VARCHAR(50),
    company_name VARCHAR(100),
    salary INT,
    PRIMARY KEY (employee_name, company_name),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);

CREATE TABLE manages (
    employee_name VARCHAR(50),
    manager_name VARCHAR(50),
    PRIMARY KEY (employee_name),
    FOREIGN KEY (employee_name) REFERENCES employee(employee_name)
);

-- =========================
-- SAMPLE DATA
-- =========================

INSERT INTO employee VALUES
('Rahim','Road 1','Pabna'),
('Karim','Road 2','Dhaka'),
('Sumi','Road 3','Natore'),
('Nadia','Road 4','Dhaka'),
('Hasan','Road 5','Chittagong');

INSERT INTO company VALUES
('ABC Bank Ltd','Dhaka'),
('Tech Ltd','Dhaka'),
('SoftTech','Chittagong');

INSERT INTO works VALUES
('Rahim','ABC Bank Ltd',60000),
('Karim','ABC Bank Ltd',45000),
('Sumi','Tech Ltd',70000),
('Nadia','ABC Bank Ltd',80000),
('Hasan','SoftTech',55000);

INSERT INTO manages VALUES
('Rahim','Karim'),
('Karim','Hasan'),
('Sumi','Nadia');

-- =========================
-- QUERIES
-- =========================

-- (i) Names and cities of employees who work in ABC Bank Ltd
SELECT e.employee_name, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'ABC Bank Ltd';

-- =========================

-- (ii) Names, street, city of employees who work in ABC Bank Ltd AND salary > 50000
SELECT e.employee_name, e.street, e.city
FROM employee e
JOIN works w ON e.employee_name = w.employee_name
WHERE w.company_name = 'ABC Bank Ltd'
AND w.salary > 50000;