-- Practice 4 --

-- Step 1: Create database and use it
create database if not exists mydatabase06;
use mydatabase06;

-- Step 2: Create table salesmen
drop table if exists salesmen;
create table salesmen(
     sale_id int primary key,
     sale_name varchar(50),
     city varchar(50),
     commission float not null
);

insert into salesmen 
(sale_id, sale_name, city, commission) values
(501, 'Andy', 'Nashik', 0.20),
(502, 'Adam', 'Nashik', 0.40),
(503, 'Sourabh', 'Nagpur', 0.40),
(504, 'Danny', 'Nashik', 0.30),
(505, 'Nova', 'Mumbai', 0.20);

-- Step 3: Create table customer
drop table if exists customer;
create table customer(
     cust_id int primary key,
     cust_name varchar(50),
     city varchar(50),
     grade int,
     sale_id int
);

insert into customer 
(cust_id, cust_name, city, grade, sale_id) values
(101, 'A', 'Mumbai', 200, 501),
(102, 'B', 'Pune', 250, 502),
(103, 'C', 'Nagpur', 300, 503),
(104, 'D', 'Nagpur', 500, 504),
(105, 'F', 'Mumbai', 150, 505);

-- Step 4: Create table orders
drop table if exists orders;
create table orders(
     order_no int primary key,
     purchase_amt int not null,
     order_date date not null,
     cust_name varchar(50),
     sale_id int
);

insert into orders 
(order_no, purchase_amt, order_date, cust_name, sale_id) values
(5501, 2300, '2023-12-12', 'Aman', 501),
(5502, 2500, '2024-01-04', 'Baman', 502),
(5503, 3000, '2024-03-07', 'Chaman', 503),
(5504, 1500, '2024-07-12', 'Daman', 504),
(5505, 1000, '2024-04-03', 'Faman', 505);

-- Question 1 --
-- Salesmen & customers from the same city
select s.sale_name as 'Salesman', c.cust_name as 'Customer', c.city as 'City'
from salesmen s
inner join customer c
on s.city = c.city;

-- Question 2 --
-- Orders between 500 and 2000 with customer & city
select o.order_no as 'Order No.', o.purchase_amt as 'Amount', 
       c.cust_name as 'Customer', c.city as 'City'
from orders o
inner join customer c
on c.cust_name = o.cust_name
where o.purchase_amt between 500 and 2000;

-- Question 3 --
-- Customers whose salesmen commission > 35%
select c.cust_name as 'Customer', s.sale_name as 'Salesman', s.commission
from salesmen s
inner join customer c
on s.sale_id = c.sale_id 
where s.commission > 0.35;

-- Question 4 --
-- Customers working through salesmen or by own
select c.cust_name as 'Customer', c.city, 
       s.sale_name as 'Salesman', s.city as 'Salesman City'
from customer c
left join salesmen s
on c.sale_id = s.sale_id 
order by c.cust_id;

-- Question 5 --
-- Order details with customer, salesman, and commission amount
select o.order_no as 'Order No.', o.order_date as 'Order Date', 
       o.purchase_amt as 'Amount', c.cust_name as 'Customer Name',
       s.sale_name as 'Salesman Name', 
       round(o.purchase_amt * s.commission, 2) as 'Commission Amount'
from orders o
inner join customer c
on o.cust_name = c.cust_name
inner join salesmen s
on c.sale_id = s.sale_id;

-- Question 6 --
-- Salesmen who work for one/more customers or none
select c.cust_name as 'Customer Name', c.city, c.grade,
       s.sale_name as 'Salesman Name'
from salesmen s
left join customer c
on s.sale_id = c.sale_id
order by s.sale_id;

-- Question 7 --
-- Customers with one/more orders or orders from non-listed customers
select c.cust_name as 'Customer Name', c.city,
       o.order_no as 'Order No.', o.order_date as 'Order Date', 
       o.purchase_amt as 'Amount'
from customer c
left join orders o
on c.cust_name = o.cust_name
union
select c.cust_name as 'Customer Name', c.city,
       o.order_no as 'Order No.', o.order_date as 'Order Date', 
       o.purchase_amt as 'Amount'
from customer c
right join orders o
on c.cust_name = o.cust_name;

-- Question 8 --
-- Cartesian product between salesmen and customers (non-null city)
select *
from salesmen s
cross join customer c
where c.city is not null;
