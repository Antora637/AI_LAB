✅ Question 2 (Rewritten in Clear English)

Design a database named GoldenBasket for a shopping system.

The database should include the following entities:

🔹 Customers

Each customer must have:

A unique Customer ID that starts with "CU"
Full name of the customer
Phone number (must follow a valid format like 01X-XXXXXXXXX)
Gender (either M or F)
🔹 Products

Each product must have:

A unique Product ID that starts with "PR"
Name of the product
Unit price
Available quantity in stock
🔹 Purchases

Each purchase record must include:

A unique Purchase ID
The Customer ID (referencing a customer)
The Product ID (referencing a product)
Date and time of purchase (default should be the current date and time)
🔹 Additional Requirements
Insert at least 3 records into each entity (Customers, Products, Purchases).
Update the phone number of a customer.
Create a trigger such that whenever a product is purchased, the available quantity of that product is automatically reduced.

-- Create Database
CREATE DATABASE GoldenBasket;
USE GoldenBasket;

-- =========================
-- 1. Customers Table
-- =========================
CREATE TABLE Customers (
    Customer_ID CHAR(6) PRIMARY KEY CHECK (Customer_ID LIKE 'CU____'),
    Name VARCHAR(20),
    Phone_Number VARCHAR(15),
    Gender CHAR(1) CHECK (Gender IN ('M','F'))
);

-- =========================
-- 2. Products Table
-- =========================
CREATE TABLE Products (
    Product_ID CHAR(10) PRIMARY KEY CHECK (Product_ID LIKE 'PR____'),
    Product_Name VARCHAR(20),
    Price FLOAT,
    Quantity_available INT
);

-- =========================
-- 3. Purchases Table
-- =========================
CREATE TABLE Purchases (
    Purchase_ID INT PRIMARY KEY AUTO_INCREMENT,
    Customer_ID CHAR(6),
    Product_ID CHAR(10),
    Enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- =========================
-- Insert 3 entries in Customers
-- =========================
INSERT INTO Customers VALUES
('CU0001', 'Rahim', '01712345678', 'M'),
('CU0002', 'Karim', '01812345678', 'M'),
('CU0003', 'Ayesha', '01912345678', 'F');

-- =========================
-- Insert 3 entries in Products
-- =========================
INSERT INTO Products VALUES
('PR0001', 'Rice', 50.5, 100),
('PR0002', 'Oil', 120.0, 50),
('PR0003', 'Sugar', 70.0, 80);

-- =========================
-- Insert 3 entries in Purchases
-- =========================
INSERT INTO Purchases (Customer_ID, Product_ID) VALUES
('CU0001', 'PR0001'),
('CU0002', 'PR0002'),
('CU0003', 'PR0003');

-- =========================
-- ii. Update phone number
-- =========================
UPDATE Customers
SET Phone_Number = '01699999999'
WHERE Customer_ID = 'CU0001';

-- =========================
-- iii. Trigger: Update Quantity after Purchase
-- =========================
DELIMITER $$

CREATE TRIGGER update_quantity_after_purchase
AFTER INSERT ON Purchases
FOR EACH ROW
BEGIN
    UPDATE Products
    SET Quantity_available = Quantity_available - 1
    WHERE Product_ID = NEW.Product_ID;
END$$

DELIMITER ;

-- =========================
-- Test Trigger
-- =========================
INSERT INTO Purchases (Customer_ID, Product_ID)
VALUES ('CU0001', 'PR0001');

-- Check result
SELECT * FROM Products;




-- =========================
-- Create Database
-- =========================
CREATE DATABASE GoldenBasket;
USE GoldenBasket;

-- =========================
-- Customers Table
-- =========================
CREATE TABLE Customers (
    Customer_ID CHAR(6) PRIMARY KEY CHECK (Customer_ID LIKE 'CU____'),
    Name VARCHAR(20),
    Phone_Number VARCHAR(15),
    Gender CHAR(1) CHECK (Gender IN ('M','F'))
);

-- =========================
-- Products Table
-- =========================
CREATE TABLE Products (
    Product_ID CHAR(6) PRIMARY KEY CHECK (Product_ID LIKE 'PR____'),
    Product_Name VARCHAR(20),
    Price FLOAT,
    Quantity_available INT
);

-- =========================
-- Purchases Table
-- =========================
CREATE TABLE Purchases (
    Purchase_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID CHAR(6),
    Product_ID CHAR(6),
    Quantity INT DEFAULT 1,
    Purchase_Time DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- =========================
-- Sales Table (History)
-- =========================
CREATE TABLE Sales (
    Sale_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID CHAR(6),
    Product_ID CHAR(6),
    Quantity INT,
    Sale_Time DATETIME
);

-- =========================
-- Insert Data (Customers)
-- =========================
INSERT INTO Customers VALUES
('CU0001','Rahim','01711111111','M'),
('CU0002','Karim','01822222222','M'),
('CU0003','Ayesha','01933333333','F');

-- =========================
-- Insert Data (Products)
-- =========================
INSERT INTO Products VALUES
('PR0001','Rice',50,100),
('PR0002','Oil',120,50),
('PR0003','Sugar',70,80);

-- =========================
-- Insert Data (Purchases - 3 records REQUIRED)
-- =========================
INSERT INTO Purchases (Customer_ID, Product_ID, Quantity)
VALUES 
('CU0001','PR0001',2),
('CU0002','PR0002',1),
('CU0003','PR0003',3);

-- =========================
-- Update Customer Phone Number (REQUIRED)
-- =========================
UPDATE Customers
SET Phone_Number = '01799999999'
WHERE Customer_ID = 'CU0001';

-- =========================
-- Trigger: After Purchase
-- =========================
DELIMITER $$

CREATE TRIGGER after_purchase_trigger
AFTER INSERT ON Purchases
FOR EACH ROW
BEGIN
    -- Reduce product stock
    UPDATE Products
    SET Quantity_available = Quantity_available - NEW.Quantity
    WHERE Product_ID = NEW.Product_ID;

    -- Insert into Sales history
    INSERT INTO Sales(Customer_ID, Product_ID, Quantity, Sale_Time)
    VALUES (NEW.Customer_ID, NEW.Product_ID, NEW.Quantity, NOW());
END$$

DELIMITER ;

INSERT INTO Purchases (Customer_ID, Product_ID)
VALUES ('CU0001', 'PR0001');

-- =========================
-- Test Output
-- =========================
SELECT * FROM Customers;
SELECT * FROM Products;
SELECT * FROM Purchases;
SELECT * FROM Sales;