USE windows10db;

-- Q1. Assign a unique row number to all employees based on sales_amount from highest to lowest.
SELECT employee_name, sales_amount,
       ROW_NUMBER() OVER(ORDER BY sales_amount DESC) AS row_num
FROM employee_performance;


-- Q2. Assign a row number to each employee's monthly performance based on performance_month.
SELECT employee_name, performance_month, sales_amount,
       ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY performance_month) AS row_num
FROM employee_performance;


-- Q3. Rank all employees based on sales_amount from highest to lowest.
SELECT employee_name, sales_amount,
       RANK() OVER(ORDER BY sales_amount DESC) AS sale_rank
FROM employee_performance;


-- Q4. Rank employees separately within each department based on sales_amount.
SELECT employee_name, department, sales_amount,
       RANK() OVER(PARTITION BY department ORDER BY sales_amount DESC) AS dept_rank
FROM employee_performance;


-- Q5. Use DENSE_RANK() to rank all employees based on sales_amount from highest to lowest.
SELECT employee_name, sales_amount,
       DENSE_RANK() OVER(ORDER BY sales_amount DESC) AS dense_rank
FROM employee_performance;


-- Q6. Use DENSE_RANK() to rank employees separately within each department based on rating.
SELECT employee_name, department, rating,
       DENSE_RANK() OVER(PARTITION BY department ORDER BY rating DESC) AS rating_rank
FROM employee_performance;


-- Q7. Find the top 3 sales records using ROW_NUMBER().
SELECT employee_name, sales_amount
FROM (
    SELECT employee_name, sales_amount,
           ROW_NUMBER() OVER(ORDER BY sales_amount DESC) AS row_num
    FROM employee_performance
) AS x
WHERE row_num <= 3;


-- Q8. Find the employees who have the highest sales in each department using RANK().
SELECT employee_name, department, sales_amount
FROM (
    SELECT employee_name, department, sales_amount,
           RANK() OVER(PARTITION BY department ORDER BY sales_amount DESC) AS rnk
    FROM employee_performance
) AS x
WHERE rnk = 1;


-- Q9. Find the second-highest sales amount in each department using DENSE_RANK().
SELECT employee_name, department, sales_amount
FROM (
    SELECT employee_name, department, sales_amount,
           DENSE_RANK() OVER(PARTITION BY department ORDER BY sales_amount DESC) AS rnk
    FROM employee_performance
) AS x
WHERE rnk = 2;


-- Q10. Rank employees within each location based on their rating using RANK().
SELECT employee_name, location, rating,
       RANK() OVER(PARTITION BY location ORDER BY rating DESC) AS location_rank
FROM employee_performance;
