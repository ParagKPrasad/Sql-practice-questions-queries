use windows10db;

-- Q1. Use ROW_NUMBER() to assign a unique number to every sale ordered by sale_date.

SELECT employee_name, sale_date, sales_amount,
       ROW_NUMBER() OVER (ORDER BY sale_date) AS row_num
FROM employee_sales;


-- Q2. Use ROW_NUMBER() to number each employee's sales, starting from 1 for each employee.

SELECT employee_name, sale_date, sales_amount,
       ROW_NUMBER() OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS row_num
FROM employee_sales;


-- Q3. Use RANK() to rank all sales based on sales_amount from highest to lowest.

SELECT employee_name, sales_amount,
       RANK() OVER (ORDER BY sales_amount DESC) AS sale_rank
FROM employee_sales;


-- Q4. Use DENSE_RANK() to rank all sales based on sales_amount from highest to lowest.

SELECT employee_name, sales_amount,
       DENSE_RANK() OVER (ORDER BY sales_amount DESC) AS sale_rank
FROM employee_sales;


-- Q5. Use RANK() to rank sales separately within each department.

SELECT employee_name, department, sales_amount,
       RANK() OVER (
           PARTITION BY department
           ORDER BY sales_amount DESC
       ) AS sale_rank
FROM employee_sales;


-- Q6. Use LAG() to display the previous sale amount for each employee.

SELECT employee_name, sale_date, sales_amount,
       LAG(sales_amount) OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS previous_sale
FROM employee_sales;


-- Q7. Use LEAD() to display the next sale amount for each employee.

SELECT employee_name, sale_date, sales_amount,
       LEAD(sales_amount) OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS next_sale
FROM employee_sales;


-- Q8. Use SUM() as a window function to calculate the running total of sales for each employee.

SELECT employee_name, sale_date, sales_amount,
       SUM(sales_amount) OVER (
           PARTITION BY employee_name
           ORDER BY sale_date
       ) AS running_total
FROM employee_sales;


-- Q9. Use AVG() as a window function to display the average sales amount of each employee.

SELECT employee_name, sale_date, sales_amount,
       AVG(sales_amount) OVER (
           PARTITION BY employee_name
       ) AS average_sale
FROM employee_sales;


-- Q10. Use MAX() as a window function to display the highest sale amount in each department.

SELECT employee_name, department, sales_amount,
       MAX(sales_amount) OVER (
           PARTITION BY department
       ) AS highest_sale
FROM employee_sales;