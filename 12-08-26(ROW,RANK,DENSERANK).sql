create database windowsdb;

use windowsdb;

CREATE TABLE orders (
    order_id INT,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(50),
    city VARCHAR(30),
    category VARCHAR(30),
    product VARCHAR(50),
    quantity INT,
    amount DECIMAL(10,2)
);


INSERT INTO orders
(order_id, order_date, customer_id, customer_name, city, category, product, quantity, amount)
VALUES
(1001, '2026-01-05', 201, 'Amit',   'Jaipur',  'Electronics', 'Laptop',       1, 65000),
(1002, '2026-01-10', 202, 'Neha',   'Delhi',   'Electronics', 'Mobile',       2, 50000),
(1003, '2026-01-15', 201, 'Amit',   'Jaipur',  'Furniture',   'Chair',        4, 12000),
(1004, '2026-01-20', 203, 'Rahul',  'Mumbai',  'Electronics', 'Headphones',   3, 9000),
(1005, '2026-01-25', 204, 'Priya',  'Delhi',   'Clothing',    'Jacket',       2, 8000),

(1006, '2026-02-03', 201, 'Amit',   'Jaipur',  'Electronics', 'Mobile',       1, 28000),
(1007, '2026-02-08', 202, 'Neha',   'Delhi',   'Furniture',   'Table',        1, 15000),
(1008, '2026-02-12', 203, 'Rahul',  'Mumbai',  'Clothing',    'Shoes',        2, 10000),
(1009, '2026-02-18', 205, 'Vikas',  'Pune',    'Electronics', 'Laptop',       1, 70000),
(1010, '2026-02-25', 204, 'Priya',  'Delhi',   'Furniture',   'Sofa',         1, 35000),

(1011, '2026-03-02', 201, 'Amit',   'Jaipur',  'Clothing',    'Shirt',        5, 7500),
(1012, '2026-03-07', 202, 'Neha',   'Delhi',   'Electronics', 'Headphones',   2, 6000),
(1013, '2026-03-11', 203, 'Rahul',  'Mumbai',  'Electronics', 'Laptop',       1, 68000),
(1014, '2026-03-16', 205, 'Vikas',  'Pune',    'Furniture',   'Chair',        6, 18000),
(1015, '2026-03-21', 204, 'Priya',  'Delhi',   'Clothing',    'Shoes',        1, 5500),

(1016, '2026-04-04', 201, 'Amit',   'Jaipur',  'Electronics', 'Tablet',       1, 22000),
(1017, '2026-04-09', 202, 'Neha',   'Delhi',   'Clothing',    'Jacket',       1, 4500),
(1018, '2026-04-14', 203, 'Rahul',  'Mumbai',  'Furniture',   'Table',        2, 30000),
(1019, '2026-04-20', 205, 'Vikas',  'Pune',    'Electronics', 'Mobile',       2, 52000),
(1020, '2026-04-27', 204, 'Priya',  'Delhi',   'Electronics', 'Laptop',       1, 72000);

select * from orders;

-- Q1. Assign a unique row number to all orders based on amount from highest to lowest.
SELECT order_id, customer_name, amount,
       ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
FROM orders;


-- Q2. Assign a row number to the orders of each customer based on order_date.
SELECT customer_name, order_date, amount,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) AS row_num
FROM orders;


-- Q3. Rank all orders based on amount from highest to lowest.
SELECT order_id, customer_name, amount,
       RANK() OVER (ORDER BY amount DESC) AS order_rank
FROM orders;


-- Q4. Rank orders within each category based on amount from highest to lowest.
SELECT order_id, category, product, amount,
       RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS category_rank
FROM orders;


-- Q5. Use DENSE_RANK() to rank all orders based on amount from highest to lowest.
SELECT order_id, customer_name, amount,
       DENSE_RANK() OVER (ORDER BY amount DESC) AS dense_rank
FROM orders;


-- Q6. Use DENSE_RANK() to rank orders within each city based on amount from highest to lowest.
SELECT order_id, customer_name, city, amount,
       DENSE_RANK() OVER (PARTITION BY city ORDER BY amount DESC) AS city_rank
FROM orders;


-- Q7. Find the top 3 orders based on amount using ROW_NUMBER().
SELECT order_id, customer_name, amount
FROM (
    SELECT order_id, customer_name, amount,
           ROW_NUMBER() OVER (ORDER BY amount DESC) AS row_num
    FROM orders
) AS x
WHERE row_num <= 3;


-- Q8. Find the highest-value order from each category using RANK().
SELECT order_id, category, product, amount
FROM (
    SELECT order_id, category, product, amount,
           RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS rnk
    FROM orders
) AS x
WHERE rnk = 1;


-- Q9. Find the second-highest order amount in each category using DENSE_RANK().
SELECT order_id, category, product, amount
FROM (
    SELECT order_id, category, product, amount,
           DENSE_RANK() OVER (PARTITION BY category ORDER BY amount DESC) AS rnk
    FROM orders
) AS x
WHERE rnk = 2;


-- Q10. Rank each customer's orders based on amount from highest to lowest using RANK().
SELECT customer_name, order_date, amount,
       RANK() OVER (PARTITION BY customer_id ORDER BY amount DESC) AS customer_rank
FROM orders;