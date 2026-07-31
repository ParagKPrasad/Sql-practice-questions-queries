create database orders;
use orders;

CREATE TABLE orders (
    order_id INT,
    name VARCHAR(10),
    amount INT
);

INSERT INTO orders VALUES
(1,'a',100),
(2,'a',200),
(3,'a',300),
(4,'b',400),
(5,'b',250);

-- 1. Find the highest amount for each name
SELECT order_id, name, amount
FROM orders o1
WHERE amount = (
    SELECT MAX(amount)
    FROM orders o2
    WHERE o1.name = o2.name
);

-- 2. Find the minimum amount for each name
SELECT order_id, name, amount
FROM orders o1
WHERE amount = (
    SELECT MIN(amount)
    FROM orders o2
    WHERE o1.name = o2.name
);