use windows10db;

-- TOPIC 1: CREATE TABLE
-- Create a new table called employee_backup with the same basic columns.
CREATE TABLE employee_backup (
    sale_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sale_date DATE,
    sales_amount DECIMAL(10,2)
);


-- TOPIC 2: ALTER TABLE - ADD COLUMN
-- Add a new column called employee_id to the employee_sales table.
ALTER TABLE employee_sales
ADD employee_id INT;


-- TOPIC 3: ALTER TABLE - MODIFY COLUMN
-- Change the size of the employee_name column to VARCHAR(100).
ALTER TABLE employee_sales
MODIFY employee_name VARCHAR(100);


-- TOPIC 4: ALTER TABLE - RENAME COLUMN
-- Rename the sales_amount column to total_sales.
ALTER TABLE employee_sales
RENAME COLUMN sales_amount TO total_sales;


-- TOPIC 5: ALTER TABLE - DROP COLUMN
-- Remove the employee_id column from the employee_sales table.
ALTER TABLE employee_sales
DROP COLUMN employee_id;


-- TOPIC 6: RENAME TABLE
-- Rename employee_backup table to employee_sales_backup.
RENAME TABLE employee_backup
TO employee_sales_backup;


-- TOPIC 7: TRUNCATE TABLE
-- Remove all records from employee_sales but keep the table structure.
TRUNCATE TABLE employee_sales;


-- TOPIC 8: DROP TABLE
-- Delete the employee_sales_backup table completely.
DROP TABLE employee_sales_backup;


-- TOPIC 9: CREATE TABLE WITH PRIMARY KEY
-- Create a new table with sale_id as the primary key.
CREATE TABLE sales_summary (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    total_sales DECIMAL(10,2)
);


-- TOPIC 10: CREATE TABLE WITH DEFAULT VALUE
-- Create a table where the department has a default value of 'Unknown'.
CREATE TABLE employee_test (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(50) DEFAULT 'Unknown'
);