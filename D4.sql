CREATE DATABASE company;
USE company;

CREATE TABLE CustomersAndSuppliers (
    cust_supp_id VARCHAR(6) PRIMARY KEY,
    name VARCHAR(50),
    sold_amnt DECIMAL(10,2) DEFAULT 0,
    proc_amnt DECIMAL(10,2) DEFAULT 0
);

CREATE TABLE Transactions (
    tran_id INT AUTO_INCREMENT PRIMARY KEY,
    cust_supp_id VARCHAR(6),
    tran_amount DECIMAL(10,2),
    tran_type CHAR(1),
    FOREIGN KEY (cust_supp_id)
    REFERENCES CustomersAndSuppliers(cust_supp_id)
);

INSERT INTO CustomersAndSuppliers 
(cust_supp_id, name, sold_amnt, proc_amnt)
VALUES 
('C001', 'ABC Traders', 30000.00, 10000.00),
('C002', 'XYZ Suppliers', 25000.00, 20000.00);

DELIMITER //

CREATE TRIGGER trg_update_customer_supplier
AFTER INSERT ON Transactions
FOR EACH ROW
BEGIN
    IF NEW.tran_type = 'S' THEN
        UPDATE CustomersAndSuppliers
        SET sold_amnt = sold_amnt + NEW.tran_amount
        WHERE cust_supp_id = NEW.cust_supp_id;

    ELSEIF NEW.tran_type = 'P' THEN
        UPDATE CustomersAndSuppliers
        SET proc_amnt = proc_amnt + NEW.tran_amount
        WHERE cust_supp_id = NEW.cust_supp_id;
    END IF;
END //

DELIMITER ;

INSERT INTO Transactions (cust_supp_id, tran_amount, tran_type)
VALUES 
('C001', 5000.00, 'S'),
('C002', 10000.00, 'P');

SELECT * FROM CustomersAndSuppliers;
SELECT * FROM Transactions;