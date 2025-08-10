-- Practice 5 --

-- Create database
CREATE DATABASE mydatabase07;
USE mydatabase07;

-- Salesmen table
CREATE TABLE salesmen (
    sale_id INT PRIMARY KEY,
    sale_name VARCHAR(50),
    city VARCHAR(50),
    commission FLOAT NOT NULL
);

INSERT INTO salesmen (sale_id, sale_name, city, commission) VALUES
(501, 'Andy', 'Nashik', 0.20),
(502, 'Adam', 'Nashik', 0.40),
(503, 'Sourabh', 'Nagpur', 0.40),
(504, 'Danny', 'Nashik', 0.30),
(505, 'Nova', 'Mumbai', 0.20);

-- Customer table
CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    sale_id INT,
    FOREIGN KEY (sale_id) REFERENCES salesmen(sale_id)
);

INSERT INTO customer (cust_id, cust_name, city, grade, sale_id) VALUES
(101, 'A', 'Mumbai', 200, 501),
(102, 'B', 'Pune', 250, 502),
(103, 'C', 'Nagpur', 300, 503),
(104, 'D', 'Nagpur', 500, 504),
(105, 'F', 'Mumbai', 150, 505);

-- Orders table
CREATE TABLE orders (
    order_no INT PRIMARY KEY,
    purchase_amt INT NOT NULL,
    order_date DATE NOT NULL,
    cust_id INT,
    sale_id INT,
    FOREIGN KEY (cust_id) REFERENCES customer(cust_id),
    FOREIGN KEY (sale_id) REFERENCES salesmen(sale_id)
);

INSERT INTO orders (order_no, purchase_amt, order_date, cust_id, sale_id) VALUES
(5501, 2300, '2023-12-12', 101, 501),
(5502, 2500, '2024-01-04', 102, 502),
(5503, 3000, '2024-03-07', 103, 503),
(5504, 1500, '2024-07-12', 104, 504),
(5505, 1000, '2024-04-03', 105, 505);

SET sql_safe_updates = 0;

UPDATE orders
SET order_date = '2023-12-12'
WHERE order_date = '2024-01-04';

-- Question 1 --
/*
Display all the customers whose cust_id is less than
the salesman ID of 'Scott'
*/
SELECT *
FROM customer
WHERE cust_id < (
    SELECT sale_id FROM salesmen
    WHERE sale_name = 'Scott'
);

-- Question 2 --
/*
Display all the orders whose values are greater than the average
order value for 12th Dec 2023
*/
SELECT *
FROM orders
WHERE purchase_amt > (
    SELECT AVG(purchase_amt)
    FROM orders
    WHERE order_date = '2023-12-12'
);

-- Question 3 --
/*
Find the name and numbers of all salesmen who had more than one customer
*/
SELECT sale_name AS 'Salesman', sale_id AS 'Salesman ID'
FROM salesmen s
WHERE (SELECT COUNT(*) FROM customer c WHERE s.sale_id = c.sale_id) > 1;

-- Question 4 --
/*
Find all orders with order amounts above the average
amount for their respective customers
*/
SELECT *
FROM orders o1
WHERE purchase_amt > (
    SELECT AVG(purchase_amt)
    FROM orders o2
    WHERE o1.cust_id = o2.cust_id
);
