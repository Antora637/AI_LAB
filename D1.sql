-- Database and Table Creation
CREATE DATABASE pubs;

USE pubs;

CREATE TABLE authors (
    au_id    INT PRIMARY KEY AUTO_INCREMENT,
    au_fname VARCHAR(20) ,
    au_lname VARCHAR(20),
    city     VARCHAR(20) ,
    state    VARCHAR(5) ,
    phone    VARCHAR(15) 
);

CREATE TABLE titles (
    title_id  INT PRIMARY KEY AUTO_INCREMENT,
    title     VARCHAR(50),
    type      VARCHAR(20),
    price     DECIMAL(5,2),
    royalty   INT,
    ytd_sales INT
);

CREATE TABLE publishers (
    pub_id   INT PRIMARY KEY AUTO_INCREMENT,
    pub_name VARCHAR(40),
    city     VARCHAR(20),
    state    VARCHAR(5),
    country  VARCHAR(20)
);

CREATE TABLE titleauthor (
    au_id    INT,
    title_id INT,
    au_ord   TINYINT,
    PRIMARY KEY (au_id, title_id)
);
/* Explanation: CREATE DATABASE creates a new database named pubs. USE pubs selects it as the active database. 
Four tables are created — authors, titles, publishers, and titleauthor. AUTO_INCREMENT automatically generates 
a unique id for each new row. The titleauthor table links authors and titles using a composite primary key (au_id, title_id).*/

-- Insert Sample Data
INSERT INTO authors (au_fname, au_lname, city, state, phone) VALUES
('John',  'White',   'Los Angeles',   'CA', '01711111111'),
('Mary',  'Smith',   'New York',      'NY', '01822222222'),
('David', 'Johnson', 'San Francisco', 'CA', '01933333333'),
('Lisa',  'Brown',   'Chicago',       'IL', '01644444444'),
('James', 'Wilson',  'Houston',       'TX', '01555555555');

INSERT INTO titles (title, type, price, royalty, ytd_sales) VALUES
('Java Programming',  'Programming', 25.00, 15, 9000),
('Database Systems',  'Database',    30.00, 20, 7000),
('Web Development',   'Programming', 22.50, 18, 8500),
('Digital Logic',     'Electronics', 18.00, 12, 6000),
('Computer Networks', 'Networking',  28.00, 22, 9500),
('Python Basics',     'Programming', 20.00, 14, 10000);
select* from titles;
/*Explanation: INSERT INTO adds rows to the tables. Since au_id and title_id are AUTO_INCREMENT,
 we do not insert them manually — MySQL generates them automatically starting from 1. Each row of
 values must match the column order listed after the table name.*/
 
 -- 1.  Listing All Table Names
SHOW TABLES;

-- 2.  SELECT — All Records, All Fields
SELECT * FROM authors;

-- 3.  SELECT — Specific Fields Only
SELECT au_lname, state FROM authors;

-- 4.  WHERE — Single Condition
SELECT * FROM authors WHERE state = 'CA';

-- 5.  WHERE — Multiple Conditions Using AND
SELECT * FROM authors
WHERE au_lname = 'White' AND state    = 'CA';

-- Task 1 — Books where ytd_sales > 8000
SELECT title_id,title FROM titles
WHERE ytd_sales > 8000;

-- Task 2 — Books where royalty is between 12 and 24
sELECT title FROM titles
WHERE royalty BETWEEN 12 AND 24;

-- 6.  ORDER BY — Ascending and Descending
-- Ascending: lowest price first
SELECT * FROM titles ORDER BY price ASC;

-- Descending: highest price first
SELECT * FROM titles ORDER BY price DESC;

-- 7.  Aggregate Functions
SELECT MAX(price) FROM titles;
SELECT AVG(price) FROM titles;
SELECT MIN(price) FROM titles;
SELECT COUNT(*) FROM titles;
select* from titles;
-- 8.  GROUP BY — Max Price per Type
SELECT type, MAX(price)
FROM titles
GROUP BY type;

-- 9.  GROUP BY — Average Price per Type
SELECT type, AVG(price)
FROM titles
GROUP BY type;

-- Task 3 — Average Price and Total ytd_sales per Type
SELECT type, AVG(price), SUM(ytd_sales)
FROM titles
GROUP BY type;

-- 10.  HAVING — Show types where AVG(price) > 15
SELECT type, AVG(price)
FROM titles
GROUP BY type
HAVING AVG(price) > 15;

-- 11.  Formatted Name with Custom Column Header
SELECT
    CONCAT(SUBSTRING(au_fname, 1, 2), '. ', au_lname) AS Name,
    phone
FROM authors;

