use coaching4;


CREATE TABLE employee (
    emp_id INT,
    emp_name VARCHAR(30),
    dept VARCHAR(20),
    salary INT
);

INSERT INTO employee VALUES
(1,'Ram','HR',500),
(2,'Shyam','HR',400),
(3,'Neeraj','HR',250),
(4,'Shravan','DSA',300),
(5,'Aluni','DSA',600);

-- Q1. Find highest salary employee in each department.
SELECT *
FROM employee e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- Q2. Find lowest salary employee in each department.
SELECT *
FROM employee e1
WHERE salary = (
    SELECT MIN(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- Q3. Find employees earning above department average.
SELECT *
FROM employee e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- Q4. Find employees earning below department average.
SELECT *
FROM employee e1
WHERE salary < (
    SELECT AVG(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- Q5. Find employees who are not highest paid in their department.
SELECT *
FROM employee e1
WHERE salary < (
    SELECT MAX(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- Q6. Find employees who are not lowest paid in their department.
SELECT *
FROM employee e1
WHERE salary > (
    SELECT MIN(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- Q7. Find second highest salary employee in each department.
SELECT *
FROM employee e1
WHERE 1 = (
    SELECT COUNT(DISTINCT e2.salary)
    FROM employee e2
    WHERE e2.dept = e1.dept
      AND e2.salary > e1.salary
);

-- Q8. Find employees earning department average salary.
SELECT *
FROM employee e1
WHERE salary = (
    SELECT AVG(salary)
    FROM employee e2
    WHERE e1.dept = e2.dept
);

-- Q9. Find departments with total salary below 900.
SELECT dept
FROM employee
GROUP BY dept
HAVING SUM(salary) < 900;

-- Q10. Find departments with average salary above 400.
SELECT dept
FROM employee
GROUP BY dept
HAVING AVG(salary) > 400;