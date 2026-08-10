USE windows10db;

CREATE TABLE employee_performance (
    employee_id INT,
    employee_name VARCHAR(50),
    department VARCHAR(30),
    location VARCHAR(30),
    performance_year INT,
    performance_month INT,
    salary DECIMAL(10,2),
    sales_amount DECIMAL(12,2),
    rating DECIMAL(3,1)
);

INSERT INTO employee_performance
(employee_id, employee_name, department, location, performance_year, performance_month, salary, sales_amount, rating)
VALUES
(101, 'Amit', 'Sales', 'Jaipur', 2025, 1, 45000, 120000, 4.2),
(102, 'Priya', 'Sales', 'Delhi', 2025, 1, 48000, 135000, 4.5),
(103, 'Rahul', 'Sales', 'Jaipur', 2025, 1, 42000, 110000, 3.9),
(104, 'Neha', 'Sales', 'Mumbai', 2025, 1, 52000, 150000, 4.7),

(101, 'Amit', 'Sales', 'Jaipur', 2025, 2, 45000, 140000, 4.4),
(102, 'Priya', 'Sales', 'Delhi', 2025, 2, 48000, 125000, 4.1),
(103, 'Rahul', 'Sales', 'Jaipur', 2025, 2, 42000, 130000, 4.2),
(104, 'Neha', 'Sales', 'Mumbai', 2025, 2, 52000, 160000, 4.8),

(101, 'Amit', 'Sales', 'Jaipur', 2025, 3, 45000, 155000, 4.6),
(102, 'Priya', 'Sales', 'Delhi', 2025, 3, 48000, 145000, 4.4),
(103, 'Rahul', 'Sales', 'Jaipur', 2025, 3, 42000, 135000, 4.3),
(104, 'Neha', 'Sales', 'Mumbai', 2025, 3, 52000, 155000, 4.6),

(105, 'Karan', 'IT', 'Jaipur', 2025, 1, 65000, 90000, 4.1),
(106, 'Sneha', 'IT', 'Delhi', 2025, 1, 70000, 95000, 4.4),
(107, 'Vikas', 'IT', 'Mumbai', 2025, 1, 62000, 85000, 3.8),
(108, 'Pooja', 'IT', 'Jaipur', 2025, 1, 68000, 100000, 4.6),

(105, 'Karan', 'IT', 'Jaipur', 2025, 2, 65000, 105000, 4.3),
(106, 'Sneha', 'IT', 'Delhi', 2025, 2, 70000, 110000, 4.5),
(107, 'Vikas', 'IT', 'Mumbai', 2025, 2, 62000, 98000, 4.0),
(108, 'Pooja', 'IT', 'Jaipur', 2025, 2, 68000, 120000, 4.7),

(105, 'Karan', 'IT', 'Jaipur', 2025, 3, 65000, 115000, 4.5),
(106, 'Sneha', 'IT', 'Delhi', 2025, 3, 70000, 125000, 4.7),
(107, 'Vikas', 'IT', 'Mumbai', 2025, 3, 62000, 105000, 4.2),
(108, 'Pooja', 'IT', 'Jaipur', 2025, 3, 68000, 130000, 4.8),

(109, 'Ravi', 'HR', 'Delhi', 2025, 1, 40000, 60000, 3.9),
(110, 'Anjali', 'HR', 'Jaipur', 2025, 1, 43000, 65000, 4.2),
(111, 'Manish', 'HR', 'Mumbai', 2025, 1, 41000, 58000, 3.7),

(109, 'Ravi', 'HR', 'Delhi', 2025, 2, 40000, 70000, 4.1),
(110, 'Anjali', 'HR', 'Jaipur', 2025, 2, 43000, 72000, 4.4),
(111, 'Manish', 'HR', 'Mumbai', 2025, 2, 41000, 68000, 3.9),

(109, 'Ravi', 'HR', 'Delhi', 2025, 3, 40000, 75000, 4.3),
(110, 'Anjali', 'HR', 'Jaipur', 2025, 3, 43000, 78000, 4.5),
(111, 'Manish', 'HR', 'Mumbai', 2025, 3, 41000, 73000, 4.1);

SELECT * FROM employee_performance;


-- Q1. Display each employee's sales and the total sales of their department.
SELECT employee_name, department, sales_amount,
       SUM(sales_amount) OVER(PARTITION BY department) AS department_total
FROM employee_performance;


-- Q2. Display each employee's rating and the average rating of their department.
SELECT employee_name, department, rating,
       AVG(rating) OVER(PARTITION BY department) AS department_avg_rating
FROM employee_performance;


-- Q3. Assign a row number to each employee's monthly records.
SELECT employee_name, performance_month, sales_amount,
       ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY performance_month) AS row_num
FROM employee_performance;


-- Q4. Rank employees' sales within each department from highest to lowest.
SELECT employee_name, department, sales_amount,
       RANK() OVER(PARTITION BY department ORDER BY sales_amount DESC) AS sale_rank
FROM employee_performance;


-- Q5. Display each employee's salary and the highest salary in their department.
SELECT employee_name, department, salary,
       MAX(salary) OVER(PARTITION BY department) AS highest_salary
FROM employee_performance;


-- Q6. Display each employee's sales and the lowest sales amount in their department.
SELECT employee_name, department, sales_amount,
       MIN(sales_amount) OVER(PARTITION BY department) AS lowest_sales
FROM employee_performance;


-- Q7. Calculate the running total of sales for each employee by month.
SELECT employee_name, performance_month, sales_amount,
       SUM(sales_amount) OVER(PARTITION BY employee_id ORDER BY performance_month) AS running_total
FROM employee_performance;


-- Q8. Display each employee's sales and the average sales of their location.
SELECT employee_name, location, sales_amount,
       AVG(sales_amount) OVER(PARTITION BY location) AS location_avg_sales
FROM employee_performance;


-- Q9. Count the number of performance records in each department.
SELECT employee_name, department,
       COUNT(*) OVER(PARTITION BY department) AS department_count
FROM employee_performance;


-- Q10. Display each employee's sales and the highest sales amount recorded by that employee.
SELECT employee_name, performance_month, sales_amount,
       MAX(sales_amount) OVER(PARTITION BY employee_id) AS employee_highest_sales
FROM employee_performance;