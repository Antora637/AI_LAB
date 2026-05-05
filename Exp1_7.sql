CREATE DATABASE school_db;
USE school_db;

-- =========================
-- TABLE
-- =========================
CREATE TABLE students (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    cgpa FLOAT
);

-- =========================
-- LOG TABLE
-- =========================
CREATE TABLE log_table (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    message VARCHAR(100)
);

-- =====================================================
-- 🔷 1. BEFORE INSERT TRIGGER
-- =====================================================
DELIMITER //

CREATE TRIGGER before_insert_student
BEFORE INSERT ON students
FOR EACH ROW
BEGIN
    IF NEW.cgpa > 4.00 THEN
        SET NEW.cgpa = 4.00;
    END IF;
END //

DELIMITER ;

-- TEST 1
INSERT INTO students VALUES (1, 'Rahim', 5.00);

-- CHECK RESULT
SELECT * FROM students;
-- 👉 Expected: cgpa = 4.00

-- =====================================================
-- 🔷 2. AFTER INSERT TRIGGER
-- =====================================================
DELIMITER //

CREATE TRIGGER after_insert_student
AFTER INSERT ON students
FOR EACH ROW
BEGIN
    INSERT INTO log_table(student_id, message)
    VALUES (NEW.id, 'Inserted');
END //

DELIMITER ;

-- TEST 2
INSERT INTO students VALUES (2, 'Karim', 3.5);

-- CHECK RESULT
SELECT * FROM students;
SELECT * FROM log_table;
-- 👉 log_table will show insert log

-- =====================================================
-- 🔷 3. BEFORE UPDATE TRIGGER
-- =====================================================
DELIMITER //

CREATE TRIGGER before_update_student
BEFORE UPDATE ON students
FOR EACH ROW
BEGIN
    IF NEW.cgpa > 4.00 THEN
        SET NEW.cgpa = 4.00;
    END IF;
END //

DELIMITER ;

-- TEST 3
UPDATE students
SET cgpa = 4.9
WHERE id = 2;

-- CHECK RESULT
SELECT * FROM students;
-- 👉 cgpa auto 4.00 হবে

-- =====================================================
-- 🔷 4. AFTER UPDATE TRIGGER
-- =====================================================
DELIMITER //

CREATE TRIGGER after_update_student
AFTER UPDATE ON students
FOR EACH ROW
BEGIN
    INSERT INTO log_table(student_id, message)
    VALUES (NEW.id, 'Updated');
END //

DELIMITER ;

-- TEST 4
UPDATE students
SET cgpa = 3.8
WHERE id = 2;

-- CHECK RESULT
SELECT * FROM log_table;

-- =====================================================
-- 🔷 5. BEFORE DELETE TRIGGER
-- =====================================================
DELIMITER //

CREATE TRIGGER before_delete_student
BEFORE DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO log_table(student_id, message)
    VALUES (OLD.id, 'Will be deleted');
END //

DELIMITER ;

-- TEST 5
DELETE FROM students WHERE id = 1;

-- CHECK RESULT
SELECT * FROM log_table;

-- =====================================================
-- 🔷 6. AFTER DELETE TRIGGER
-- =====================================================
DELIMITER //

CREATE TRIGGER after_delete_student
AFTER DELETE ON students
FOR EACH ROW
BEGIN
    INSERT INTO log_table(student_id, message)
    VALUES (OLD.id, 'Deleted');
END //

DELIMITER ;

-- TEST 6
DELETE FROM students WHERE id = 2;

-- FINAL CHECK
SELECT * FROM students;
SELECT * FROM log_table;