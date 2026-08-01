create database newdb;

use newdb;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    location VARCHAR(50)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    gender CHAR(1),
    salary DECIMAL(10,2),
    dept_id INT,
    manager_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id)
);


INSERT INTO Department VALUES
(101, 'HR', 'Delhi'),
(102, 'IT', 'Bangalore'),
(103, 'Finance', 'Mumbai'),
(104, 'Sales', 'Pune'),
(105, 'Marketing', 'Hyderabad');



INSERT INTO Employee VALUES
(1, 'Amit',    'M', 55000, 101, NULL),
(2, 'Neha',    'F', 48000, 101, 1),
(3, 'Raj',     'M', 62000, 101, 1),
(4, 'Priya',   'F', 70000, 102, NULL),
(5, 'Arjun',   'M', 68000, 102, 4),
(6, 'Kiran',   'F', 72000, 102, 4),
(7, 'Rohit',   'M', 61000, 102, 4),
(8, 'Sneha',   'F', 80000, 103, NULL),
(9, 'Vikas',   'M', 75000, 103, 8),
(10,'Anjali',  'F', 78000, 103, 8),
(11,'Mohit',   'M', 50000, 104, NULL),
(12,'Pooja',   'F', 45000, 104, 11),
(13,'Deepak',  'M', 53000, 104, 11),
(14,'Riya',    'F', 60000, 104, 11),
(15,'Kunal',   'M', 65000, 105, NULL),
(16,'Nisha',   'F', 62000, 105, 15),
(17,'Varun',   'M', 59000, 105, 15),
(18,'Isha',    'F', 67000, 105, 15),
(19,'Manish',  'M', 64000, 105, 15),
(20,'Kavya',   'F', 52000, 101, 1);

select * from employee;



-- 1. Employees whose salary is greater than the average salary of their department
SELECT emp_name, salary, dept_id
FROM Employee e
WHERE salary >
(
    SELECT AVG(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

-- 2. Highest-paid employee in each department
SELECT emp_name, salary, dept_id
FROM Employee e
WHERE salary =
(
    SELECT MAX(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

-- 3. Lowest-paid employee in each department
SELECT emp_name, salary, dept_id
FROM Employee e
WHERE salary =
(
    SELECT MIN(salary)
    FROM Employee
    WHERE dept_id = e.dept_id
);

-- 4. Departments having at least one employee earning more than 70000
SELECT dept_name
FROM Department d
WHERE EXISTS
(
    SELECT *
    FROM Employee e
    WHERE e.dept_id = d.dept_id
    AND salary > 70000
);

-- 5. Second highest salary in each department
SELECT emp_name, salary, dept_id
FROM Employee e
WHERE 1 =
(
    SELECT COUNT(DISTINCT salary)
    FROM Employee
    WHERE dept_id = e.dept_id
    AND salary > e.salary
);