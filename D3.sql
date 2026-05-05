CREATE DATABASE IF NOT EXISTS DBMS_LAB;
USE DBMS_LAB;

DROP TABLE IF EXISTS Item;

CREATE TABLE Item (
    item_id CHAR(5) PRIMARY KEY,
    item_name VARCHAR(30),
    item_catagory VARCHAR(20),
    item_price FLOAT CHECK (item_price >= 0),
    item_qoh INT CHECK (item_qoh >= 0),
    item_last_sold DATETIME DEFAULT CURRENT_TIMESTAMP,
    
    -- MySQL Regex constraint for P0000 format
    CONSTRAINT chk_item_id_format CHECK (item_id REGEXP '^P[0-9]{4}$')
);

-- 2. Data Insertion
INSERT INTO Item (item_id, item_name, item_catagory, item_price, item_qoh) VALUES
('P0001','Laptop A','laptop', 800, 10),
('P0002','Laptop B','laptop', 900, 8),
('P0003','Phone A','phone', 300, 20),
('P0004','Phone B','phone', 350, 15),
('P0005','Tab A','tab', 200, 12),
('P0006','Tab B','tab', 180, 9),
('P0007','Headphone','electro', 50, 30),
('P0008','Charger','electro', 20, 40);

-- Check Initial Data
SELECT * FROM Item;

-- 3. Procedure: Category Summary
DROP PROCEDURE IF EXISTS sp_category_summary;

DELIMITER //
CREATE PROCEDURE sp_category_summary()
BEGIN
    SELECT 
        item_catagory AS Category, 
        COUNT(*) AS `Total number of items`, 
        ROUND(AVG(item_price), 2) AS `Average Price`
    FROM Item
    GROUP BY item_catagory;
END //
DELIMITER ;

-- Call Task 1
CALL sp_category_summary();

-- 4. Procedure: Filter Items by Price
DROP PROCEDURE IF EXISTS sp_filter_items_by_price;

DELIMITER //
CREATE PROCEDURE sp_filter_items_by_price(
    IN p_catagory_name VARCHAR(20),
    IN p_price_value FLOAT
)
BEGIN
    SELECT * FROM Item 
    WHERE item_catagory = p_catagory_name 
      AND item_price < p_price_value;
END //
DELIMITER ;

-- Call Task 2
CALL sp_filter_items_by_price('phone', 320);

-- 5. Procedure: Increase Price Until Average Reached
DROP PROCEDURE IF EXISTS sp_increase_price_until_avg;

DELIMITER //
CREATE PROCEDURE sp_increase_price_until_avg(
    IN p_catagory_name VARCHAR(20),
    IN p_desired_avg FLOAT
)
BEGIN
    DECLARE v_current_avg FLOAT DEFAULT 0;

    -- Disable safe updates for this session
    SET SQL_SAFE_UPDATES = 0;

    -- Get initial average
    SELECT AVG(item_price) INTO v_current_avg
    FROM Item
    WHERE item_catagory = p_catagory_name;

    -- Loop logic: Increase price by 10% until desired average is met
    WHILE v_current_avg < p_desired_avg DO
        UPDATE Item
        SET item_price = item_price * 1.10
        WHERE item_catagory = p_catagory_name;

        -- Re-check average for the loop condition
        SELECT AVG(item_price) INTO v_current_avg
        FROM Item
        WHERE item_catagory = p_catagory_name;
    END WHILE;

    -- Re-enable safe updates
    SET SQL_SAFE_UPDATES = 1;
    
    -- Show updated results for the category
    SELECT * FROM Item WHERE item_catagory = p_catagory_name;
END //
DELIMITER ;

-- Call Task 3
CALL sp_increase_price_until_avg('phone', 400);
