create database foreigndb;

use foreigndb;


CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);

INSERT INTO customers VALUES
(101,'John'),
(102,'Alice'),
(103,'David');


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);

INSERT INTO products VALUES
(1,'Laptop'),
(2,'Mouse'),
(3,'Keyboard');



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT
);

INSERT INTO orders
VALUES
(1,101,1,2);

INSERT INTO orders
VALUES
(2,999,1,1);



-- we do join. [Wrong name]
SELECT *
FROM orders o
LEFT JOIN customers c
ON o.customer_id=c.customer_id;



INSERT INTO orders
VALUES
(3,101,500,1);

-- wrong can't order if the product is not listed
SELECT *
FROM orders o
LEFT JOIN products p
ON o.product_id=p.product_id;




CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(50)
);


CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50)
);