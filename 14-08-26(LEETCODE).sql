-- LEETCODE 175: COMBINE TWO TABLES
-- Question: Write a solution to report the first name, last name, city, and state of each person. If a person's address is not present, report NULL.

SELECT 
    p.firstName,
    p.lastName,
    a.city,
    a.state
FROM Person p
LEFT JOIN Address a
    ON p.personId = a.personId;


-- LEETCODE 181: EMPLOYEES EARNING MORE THAN THEIR MANAGERS
-- Question: Write a solution to find the employees who earn more than their managers. Return the employee names.

SELECT 
    e.name AS Employee
FROM Employee e
JOIN Employee m
    ON e.managerId = m.id
WHERE e.salary > m.salary;


-- LEETCODE 183: CUSTOMERS WHO NEVER ORDER
-- Question: Write a solution to find all customers who never order anything. Return the customer names.

SELECT 
    c.name AS Customers
FROM Customers c
LEFT JOIN Orders o
    ON c.id = o.customerId
WHERE o.id IS NULL;