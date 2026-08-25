-- 1. Write a CTE to display all employees with a salary greater than 50000.

WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 50000
)
SELECT *
FROM high_salary;


-- 2. Write a CTE to find employees working in the IT department.

WITH it_employees AS (
    SELECT *
    FROM employees
    WHERE department = 'IT'
)
SELECT *
FROM it_employees;


-- 3. Write a CTE to calculate the average salary of all employees.

WITH avg_salary_cte AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT *
FROM avg_salary_cte;


-- 4. Using a CTE, find employees whose salary is greater than
--    the average salary.

WITH avg_salary_cte AS (
    SELECT AVG(salary) AS average_salary
    FROM employees
)
SELECT e.*
FROM employees e
JOIN avg_salary_cte a
ON e.salary > a.average_salary;


-- 5. Write a CTE to calculate the total salary for each department.

WITH department_salary AS (
    SELECT department, SUM(salary) AS total_salary
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_salary;


-- 6. Using a CTE, find the highest salary in the employees table.

WITH max_salary_cte AS (
    SELECT MAX(salary) AS highest_salary
    FROM employees
)
SELECT *
FROM max_salary_cte;


-- 7. Write a CTE to find the employee(s) with the highest salary.

WITH max_salary_cte AS (
    SELECT MAX(salary) AS highest_salary
    FROM employees
)
SELECT *
FROM employees
WHERE salary = (
    SELECT highest_salary
    FROM max_salary_cte
);


-- 8. Create a CTE to count the number of employees in each department.

WITH department_count AS (
    SELECT department, COUNT(*) AS employee_count
    FROM employees
    GROUP BY department
)
SELECT *
FROM department_count;


-- 9. Using a CTE, find employees whose salary is between
--    40000 and 80000.

WITH salary_range AS (
    SELECT *
    FROM employees
    WHERE salary BETWEEN 40000 AND 80000
)
SELECT *
FROM salary_range;


-- 10. Write a CTE to find the second-highest salary in the employees table.

WITH ranked_salaries AS (
    SELECT salary,
           DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
    FROM employees
)
SELECT DISTINCT salary AS second_highest_salary
FROM ranked_salaries
WHERE salary_rank = 2;