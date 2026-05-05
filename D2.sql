
-- =========================
-- DATABASE
-- =========================
CREATE DATABASE IF NOT EXISTS PubsDB;
USE PubsDB;

-- =========================
-- 1. AUTHORS TABLE
-- =========================
CREATE TABLE authors (
    au_id CHAR(4) PRIMARY KEY,
    au_fname VARCHAR(20),
    au_lname VARCHAR(20),
    city VARCHAR(20)
);

-- =========================
-- 2. PUBLISHERS TABLE
-- =========================
CREATE TABLE publishers (
    pub_id CHAR(4) PRIMARY KEY,
    pub_name VARCHAR(50),
    city VARCHAR(20)
);

-- =========================
-- 3. TITLES TABLE
-- =========================
CREATE TABLE titles (
    title_id CHAR(6) PRIMARY KEY,
    title VARCHAR(100),
    pub_id CHAR(4),
    royalty INT,
    FOREIGN KEY (pub_id) REFERENCES publishers(pub_id)
);

-- =========================
-- 4. TITLEAUTHOR TABLE
-- =========================
CREATE TABLE titleauthor (
    au_id CHAR(4),
    title_id CHAR(6),
    PRIMARY KEY (au_id, title_id),
    FOREIGN KEY (au_id) REFERENCES authors(au_id),
    FOREIGN KEY (title_id) REFERENCES titles(title_id)
);

-- =========================
-- SAMPLE DATA
-- =========================

INSERT INTO authors VALUES
('A001','Rafid','Hasan','Dhaka'),
('A002','Sadia','Rahman','Rajshahi'),
('A003','Karim','Uddin','Dhaka');

INSERT INTO publishers VALUES
('P001','Tech Books','Dhaka'),
('P002','Knowledge Hub','Rajshahi'),
('P003','Cambridge','Dhaka');

INSERT INTO titles VALUES
('T00001','Database System','P001',80),
('T00002','C Programming','P002',90),
('T00003','AI Basics','P003',95);

INSERT INTO titleauthor VALUES
('A001','T00001'),
('A002','T00002'),
('A003','T00003'),
('A001','T00003');

-- =========================
-- TASK 1: INNER JOIN
-- =========================

-- (i) Book title + author
SELECT t.title, a.au_fname, a.au_lname
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id;

-- (ii) Book + author + publisher
SELECT t.title, a.au_fname, a.au_lname, p.pub_name
FROM titles t
JOIN titleauthor ta ON t.title_id = ta.title_id
JOIN authors a ON ta.au_id = a.au_id
JOIN publishers p ON t.pub_id = p.pub_id;

-- =========================
-- TASK 2: CARTESIAN PRODUCT
-- =========================

-- (iii) Same city author & publisher
SELECT a.au_lname, a.city AS author_city,
       p.pub_name, p.city AS publisher_city
FROM authors a, publishers p
WHERE a.city = p.city;

-- =========================
-- TASK 3: NESTED QUERY
-- =========================

-- (iv) Author(s) of max royalty book
SELECT DISTINCT a.au_fname, a.au_lname
FROM authors a
JOIN titleauthor ta ON a.au_id = ta.au_id
WHERE ta.title_id IN (
    SELECT title_id
    FROM titles
    WHERE royalty = (SELECT MAX(royalty) FROM titles)
);

-- =========================
-- TASK 4: CUSTOMER & SUPPLIERS
-- =========================

CREATE TABLE CustomerAndSuppliers (
    cusl_id CHAR(6) PRIMARY KEY,
    cusl_fname CHAR(15) NOT NULL,
    cusl_lname VARCHAR(15),
    cusl_address TEXT,
    cusl_telno CHAR(12),
    cusl_city CHAR(12) DEFAULT 'Rajshahi',
    sales_amnt DECIMAL(10,2),
    proc_amnt DECIMAL(10,2)
);

INSERT INTO CustomerAndSuppliers VALUES
('C00001','Iqbal','Hossain','221/B Dhanmondi','017000000000','Dhaka',0,0);

-- =========================
-- TASK 5: ITEM TABLE (FIXED)
-- =========================

CREATE TABLE Item (
    item_id CHAR(6) PRIMARY KEY,
    item_name VARCHAR(20),
    item_category VARCHAR(15),
    item_price DECIMAL(10,2),
    item_qoh INT,
    item_last_sold DATE
);

INSERT INTO Item VALUES
('P00001','Keyboard','Electrical',1200,10,'2026-02-15'),
('P00002','Mouse','Electrical',600,20,'2026-02-14'),
('P00003','Book','Books',350,15,'2026-02-13');

-- =========================
-- TASK 6: TRANSACTIONS TABLE
-- =========================

CREATE TABLE TransactionsTbl (
    tran_id CHAR(10) PRIMARY KEY,
    item_id CHAR(6),
    cust_id CHAR(6),
    tran_type CHAR(1),
    tran_quantity INT,
    tran_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (item_id) REFERENCES Item(item_id),
    FOREIGN KEY (cust_id) REFERENCES CustomerAndSuppliers(cusl_id)
);

INSERT INTO TransactionsTbl VALUES
('T000000001','P00001','C00001','S',2,NOW()),
('T000000002','P00002','C00001','O',5,NOW()),
('T000000003','P00003','C00001','S',1,NOW());

-- =========================
-- FINAL CHECK QUERIES
-- =========================

SELECT * FROM authors;
SELECT * FROM publishers;
SELECT * FROM titles;
SELECT * FROM titleauthor;

SELECT * FROM Item;
SELECT * FROM CustomerAndSuppliers;
SELECT * FROM TransactionsTbl;

-- JOIN EXAMPLE
SELECT i.item_name, t.tran_type, t.tran_quantity, t.tran_date
FROM Item i
JOIN TransactionsTbl t ON i.item_id = t.item_id;