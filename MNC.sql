create database MNC;
use MNC;
CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50),
location VARCHAR(50)
);
INSERT INTO departments VALUES
(10,'HR','Jaipur'),
(20,'IT','Bangalore'),
(30,'Finance','Mumbai'),
(40,'Marketing','Delhi'),
(50,'Legal','Pune');
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
dept_id INT,
salary INT,
city VARCHAR(50)
);
INSERT INTO employees VALUES
(101,'Amit',10,45000,'Jaipur'),
(102,'Bhavna',20,72000,'Bangalore'),
(103,'Chirag',20,68000,'Bangalore'),
(104,'Divya',30,55000,'Mumbai'),
(105,'Esha',NULL,39000,'Delhi'),
(106,'Farhan',40,61000,'Delhi'),
(107,'Gaurav',60,50000,'Kolkata'),
(108,'Hina',30,83000,'Mumbai');
CREATE TABLE projects (
proj_id INT PRIMARY KEY,
proj_name VARCHAR(50),
dept_id INT,
budget INT
);
INSERT INTO projects VALUES
(1,'Payroll Revamp',10,120000),
(2,'Cloud Migration',20,500000),
(3,'Mobile App',20,300000),
(4,'Audit Automation',30,250000),
(5,'Brand Refresh',40,180000),
(6,'Data Lake',70,400000);

select * from departments;
select * from employees;
select * from projects;

-- 1
SELECT e.emp_id, e.emp_name, d.dept_name, d.location
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- 2
SELECT p.proj_id, p.proj_name, d.dept_name, p.budget
FROM projects p
INNER JOIN departments d
ON p.dept_id = d.dept_id;

-- 3
SELECT e.emp_name, d.dept_name, p.proj_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;

-- 4
SELECT e.emp_id, e.emp_name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- 5
SELECT d.dept_id, d.dept_name, p.proj_name, p.budget
FROM departments d
LEFT JOIN projects p
ON d.dept_id = p.dept_id;

-- 6
SELECT e.emp_id, e.emp_name, e.dept_id
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
WHERE d.dept_id IS NULL;

-- 7
SELECT e.emp_name, d.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

-- 8
SELECT d.dept_name, p.proj_id, p.proj_name, p.dept_id
FROM departments d
RIGHT JOIN projects p
ON d.dept_id = p.dept_id;

-- 9
SELECT d.dept_id, d.dept_name, d.location
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
WHERE e.emp_id IS NULL;

-- 10
SELECT e.emp_name, e.salary, d.dept_name
FROM employees e
CROSS JOIN departments d
WHERE e.salary > 70000
AND d.dept_name IN ('Finance', 'Legal');

-- 11
SELECT p.proj_name, p.budget, d.dept_name, d.location
FROM projects p
CROSS JOIN departments d
WHERE p.budget >= 400000
AND d.location IN ('Mumbai', 'Pune');

-- 12
SELECT COUNT(*) AS total_combinations
FROM employees
CROSS JOIN departments;

-- 13
SELECT *
FROM employees
WHERE salary > 60000;

-- 14
SELECT emp_id, emp_name, salary, city
FROM employees
WHERE city IN ('Delhi', 'Mumbai');

-- 15
SELECT emp_id, emp_name, dept_id, salary
FROM employees
WHERE dept_id IS NULL;

-- 16
SELECT *
FROM departments
WHERE location IN ('Bangalore', 'Delhi');

-- 17
SELECT *
FROM departments
WHERE dept_id >= 30;

-- 18
SELECT *
FROM departments
WHERE dept_name LIKE 'F%'
OR dept_name LIKE 'L%';

-- 19
SELECT *
FROM projects
WHERE budget BETWEEN 200000 AND 400000;

-- 20
SELECT *
FROM projects
WHERE dept_id = 20;

-- 21
SELECT proj_id, proj_name, budget
FROM projects
WHERE proj_name LIKE '%a%'
AND budget < 300000;

-- 22
SELECT e.emp_name,
       d.dept_name,
       d.location,
       p.proj_name,
       p.budget
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id;

-- 23
SELECT e.emp_id,
       e.emp_name,
       d.dept_name,
       p.proj_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
LEFT JOIN projects p
ON d.dept_id = p.dept_id;

-- 24
SELECT e.emp_name,
       e.salary,
       d.dept_name,
       p.proj_name,
       p.budget
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id
WHERE e.salary > 60000
AND p.budget > 250000;

-- 25
SELECT d.dept_id,
       d.dept_name,
       e.emp_name,
       p.proj_name
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
LEFT JOIN projects p
ON d.dept_id = p.dept_id;

-- 26
SELECT e.emp_name,
       d.location,
       p.proj_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id
INNER JOIN projects p
ON d.dept_id = p.dept_id
WHERE d.location IN ('Bangalore', 'Mumbai');

-- 27
SELECT e1.emp_name AS employee_1,
       e2.emp_name AS employee_2,
       e1.city
FROM employees e1
INNER JOIN employees e2
ON e1.city = e2.city
AND e1.emp_id < e2.emp_id;

-- 28
SELECT p.proj_name,
       p.dept_id,
       e.emp_name
FROM projects p
LEFT JOIN employees e
ON p.dept_id = e.dept_id;