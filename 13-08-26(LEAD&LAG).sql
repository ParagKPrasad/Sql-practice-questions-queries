use windowsdb;

-- Q1. Display each customer's current order amount and their previous order amount using LAG().
SELECT customer_name, order_date, amount,
       LAG(amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS previous_amount
FROM orders;


-- Q2. Display each customer's current order amount and their next order amount using LEAD().
SELECT customer_name, order_date, amount,
       LEAD(amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS next_amount
FROM orders;


-- Q3. Find the difference between the current order amount and the previous order amount for each customer.
SELECT customer_name, order_date, amount,
       amount - LAG(amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS difference
FROM orders;


-- Q4. Find the difference between the next order amount and the current order amount for each customer.
SELECT customer_name, order_date, amount,
       LEAD(amount) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) - amount AS difference
FROM orders;


-- Q5. Display each order along with the previous order date of the same customer.
SELECT customer_name, order_date,
       LAG(order_date) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS previous_order_date
FROM orders;


-- Q6. Display each order along with the next order date of the same customer.
SELECT customer_name, order_date,
       LEAD(order_date) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS next_order_date
FROM orders;


-- Q7. Compare each order amount with the previous order amount within the same category.
SELECT category, product, order_date, amount,
       LAG(amount) OVER (
           PARTITION BY category
           ORDER BY order_date
       ) AS previous_category_amount
FROM orders;


-- Q8. Compare each order amount with the next order amount within the same city.
SELECT city, customer_name, order_date, amount,
       LEAD(amount) OVER (
           PARTITION BY city
           ORDER BY order_date
       ) AS next_city_amount
FROM orders;


-- Q9. Display the previous product purchased by each customer.
SELECT customer_name, order_date, product,
       LAG(product) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS previous_product
FROM orders;


-- Q10. Display the next product purchased by each customer.
SELECT customer_name, order_date, product,
       LEAD(product) OVER (
           PARTITION BY customer_id
           ORDER BY order_date
       ) AS next_product
FROM orders;