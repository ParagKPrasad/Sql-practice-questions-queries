-- Create database
CREATE DATABASE company_db;

USE company_db;


-- Table 1: Departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);


-- Table 2: Employees
CREATE TABLE employees (
    employee_name VARCHAR(50),
    department_id INT
);


-- Insert data into departments
INSERT INTO departments VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');


-- Insert data into employees
INSERT INTO employees VALUES
('Rahul', 2),
('Priya', 1),
('Amit', 3);


-- Perform JOIN
SELECT 
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;


-- Store JOIN result in a VIEW
CREATE VIEW employee_department_view AS
SELECT 
    employees.employee_name,
    departments.department_name
FROM employees
INNER JOIN departments
ON employees.department_id = departments.department_id;


-- Display data from the VIEW
SELECT * FROM employee_department_view;