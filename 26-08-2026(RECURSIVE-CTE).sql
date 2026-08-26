USE newdb2;


CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id)
VALUES
    (1, 'John', NULL),
    (2, 'Alice', 1),
    (3, 'Bob', 1),
    (4, 'David', 2),
    (5, 'Sarah', 2),
    (6, 'Mike', 3),
    (7, 'Tom', 4);

SELECT * FROM employees;

-- 1: Display the complete employee hierarchy starting from the top-level manager.

WITH RECURSIVE employee_hierarchy AS (
    SELECT emp_id, emp_name, manager_id, 1 AS level
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id, eh.level + 1
    FROM employees e
    JOIN employee_hierarchy eh ON e.manager_id = eh.emp_id
)
SELECT * FROM employee_hierarchy;


-- 2: Find all direct and indirect employees under Alice.

WITH RECURSIVE alice_team AS (
    SELECT emp_id, emp_name, manager_id
    FROM employees
    WHERE emp_name = 'Alice'

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM employees e
    JOIN alice_team a ON e.manager_id = a.emp_id
)
SELECT * FROM alice_team;


-- 3: Find the complete reporting path for every employee.

WITH RECURSIVE employee_path AS (
    SELECT emp_id, emp_name, manager_id, CAST(emp_name AS CHAR(500)) AS path
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id, CONCAT(ep.path, ' -> ', e.emp_name)
    FROM employees e
    JOIN employee_path ep ON e.manager_id = ep.emp_id
)
SELECT * FROM employee_path;


-- 4: Starting from Tom, find all managers above him.

WITH RECURSIVE manager_chain AS (
    SELECT emp_id, emp_name, manager_id
    FROM employees
    WHERE emp_name = 'Tom'

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM employees e
    JOIN manager_chain mc ON e.emp_id = mc.manager_id
)
SELECT * FROM manager_chain;


-- 5: Find all employees who do not manage any other employee.

WITH RECURSIVE hierarchy AS (
    SELECT emp_id, emp_name, manager_id
    FROM employees
    WHERE manager_id IS NULL

    UNION ALL

    SELECT e.emp_id, e.emp_name, e.manager_id
    FROM employees e
    JOIN hierarchy h ON e.manager_id = h.emp_id
)
SELECT h.emp_id, h.emp_name
FROM hierarchy h
LEFT JOIN employees e ON h.emp_id = e.manager_id
WHERE e.emp_id IS NULL;