-- Practice 3 --

-- Step 1: Create database and use it
create database if not exists mydatabase04;
use mydatabase04;

-- Step 2: Create table my_order
drop table if exists my_order;
create table my_order (
     order_no int not null,
     purchase_amt int not null,
     order_date date not null
);

-- Step 3: Insert data with correct date format
insert into my_order 
(order_no, purchase_amt, order_date) values
(101, 1000, '2024-02-12'),
(102, 1300, '2024-03-15'),
(103, 1250, '2024-02-12'),
(104, 500, '2024-03-15'),
(105, 800, '2024-03-15');

-- Question 1 --
-- Orders exceeding 50% of target (1000), show Achieved % & Unachieved %
select order_no, purchase_amt,
       round((purchase_amt * 100.0) / 1000, 2) as 'Achieved %',
       round(((1000 - purchase_amt) * 100.0) / 1000, 2) as 'Unachieved %'
from my_order
where (purchase_amt * 100.0) / 1000 > 50;

-- Question 2 --
-- Commission with % sign along with salesman id, name and city
drop table if exists salesmen;
create table salesmen(
     sale_id int primary key,
     name varchar(50),
     city varchar(50),
     commission float
);

insert into salesmen
(sale_id, name, city, commission) values
(100, "Sourabh", "Nagpur", 0.10),
(101, "Ayush", "Nashik", 0.30),
(102, "Shubham", "Mumbai", 0.10),
(103, "Vishal", "Pune", 0.40),
(104, "Yash", "Kolhapur", 0.70);

select sale_id, 
       name, 
       city, 
       concat(commission * 100, '%') as "Commission %"
from salesmen;

-- Question 3 --
-- Report with latest order date first, total purchase amt & total commission (15%)
select order_date, 
       sum(purchase_amt) as Total_Purchase_Amount, 
       round(sum(purchase_amt) * 0.15, 2) as Commission
from my_order
group by order_date
order by order_date desc;
