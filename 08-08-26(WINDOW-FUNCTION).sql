use windows10db;

CREATE TABLE employee_sales (
    sale_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    sale_date DATE,
    sales_amount DECIMAL(10,2)
);



INSERT INTO employee_sales
(sale_id, employee_name, department, sale_date, sales_amount)
VALUES
    (1,  'Alice', 'Electronics', '2026-01-05', 1200.00),
    (2,  'Bob',   'Electronics', '2026-01-08', 1800.00),
    (3,  'Alice', 'Electronics', '2026-01-15', 1500.00),
    (4,  'Charlie','Electronics','2026-01-20', 1800.00),
    (5,  'Bob',   'Electronics', '2026-01-25', 2200.00),
    (6,  'David', 'Furniture',   '2026-01-03', 2500.00),
    (7,  'Emma',  'Furniture',   '2026-01-10', 1800.00),
    (8,  'David', 'Furniture',   '2026-01-18', 3000.00),
    (9,  'Frank', 'Furniture',   '2026-01-22', 1800.00),
    (10, 'Emma',  'Furniture',   '2026-01-28', 3200.00),
    (11, 'George','Clothing',    '2026-01-04', 900.00),
    (12, 'Helen', 'Clothing',    '2026-01-09', 1400.00),
    (13, 'George','Clothing',    '2026-01-16', 1100.00),
    (14, 'Helen', 'Clothing',    '2026-01-21', 1400.00),
    (15, 'Ian',   'Clothing',    '2026-01-27', 2000.00);
    
    select * from employee_sales;
    
    -- Q1. Assign a unique row number to every sale, ordered by sales_amount from highest to lowest.
SELECT *,
       ROW_NUMBER() OVER (ORDER BY sales_amount DESC) AS row_num
FROM employee_sales;


-- Q2. Rank sales within each department based on sales_amount from highest to lowest.
SELECT *,
       RANK() OVER (PARTITION BY department ORDER BY sales_amount DESC) AS sale_rank
FROM employee_sales;


-- Q3. For each employee, show their current sale and their previous sale amount.
SELECT employee_name,
       sale_date,
       sales_amount,
       LAG(sales_amount) OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS previous_sale
FROM employee_sales;


-- Q4. Calculate the running total of sales for each employee ordered by sale_date.
SELECT employee_name,
       sale_date,
       sales_amount,
       SUM(sales_amount) OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS running_total
FROM employee_sales;


-- Q5. Display the total sales made by each employee beside every sale.
SELECT employee_name,
       sale_date,
       sales_amount,
       SUM(sales_amount) OVER (
           PARTITION BY employee_name
       ) AS employee_total
FROM employee_sales;


-- Q6. Display the average sales amount of each department beside every sale.
SELECT employee_name,
       department,
       sales_amount,
       AVG(sales_amount) OVER (
           PARTITION BY department
       ) AS department_average
FROM employee_sales;


-- Q7. Find the top 2 highest sales in each department.
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (
               PARTITION BY department
               ORDER BY sales_amount DESC
           ) AS rn
    FROM employee_sales
) AS x
WHERE rn <= 2;


-- Q8. For each employee, show their first sale amount.
SELECT employee_name,
       sale_date,
       sales_amount,
       FIRST_VALUE(sales_amount) OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS first_sale
FROM employee_sales;


-- Q9. Compare each sale with the next sale made by the same employee.
SELECT employee_name,
       sale_date,
       sales_amount,
       LEAD(sales_amount) OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS next_sale
FROM employee_sales;


-- Q10. Find the employee with the highest total sales in each department.
SELECT department,
       employee_name,
       total_sales
FROM (
    SELECT department,
           employee_name,
           SUM(sales_amount) AS total_sales,
           RANK() OVER (
               PARTITION BY department
               ORDER BY SUM(sales_amount) DESC
           ) AS rnk
    FROM employee_sales
    GROUP BY department, employee_name
) AS x
WHERE rnk = 1;