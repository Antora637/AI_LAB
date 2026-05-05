-- Consider the following employee database  
employee(employee_name, street, city) 
works(employee_name, company_name, salary) 
company(company_name, city) 
manages(employee_name, manager_name) 
Figure: A-1 
Consider the employee database of Figure A-1, where the primary keys are underlined. Give an 
expression in SQL for each of the following queries. 
i) Find the company that has the most employees. 
ii) Find those companies whose companies earn a higher salary, on average, than the average salary at 
“First Bank Corporation”.  full complete mysql code deo

CREATE DATABASE employee_db;
USE employee_db;

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
('Rahim','First Bank Corporation',90000),
('Karim','First Bank Corporation',85000),
('Sumi','Tech Ltd',95000),
('Nadia','Tech Ltd',92000),
('Hasan','SoftTech',88000);

INSERT INTO manages VALUES
('Rahim','Karim'),
('Karim','Hasan'),
('Sumi','Nadia');

-- =========================
-- QUERIES
-- =========================

-- (i) Company with most employees
SELECT company_name
FROM works
GROUP BY company_name
ORDER BY COUNT(employee_name) DESC
LIMIT 1;

-- (ii) Companies with avg salary > First Bank Corporation
SELECT company_name
FROM works
GROUP BY company_name
HAVING AVG(salary) >
(
    SELECT AVG(salary)
    FROM works
    WHERE company_name = 'First Bank Corporation'
);