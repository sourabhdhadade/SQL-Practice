-- Practice 2 --

create database if not exists mydatabase02;
use mydatabase02;

drop table if exists company;
create table company(
     product_name varchar(100),
     price int not null,
     manufacture_code int primary key
);

insert into company 
( product_name, price, manufacture_code ) values
("peanut butter", 350, 10),
("oats", 350, 11),
("creatine", 500, 16),
("chavanprash", 600, 14),
("ghee", 1000, 19);


-- Question 1 --
-- Find all products with price between 200/- and 600/-
select product_name
from company
where price between 200 and 600;

-- Question 2 --
-- Calculate average price of all products for manufacturer code 14 and 16
select manufacture_code, avg(price) as avg_price
from company
where manufacture_code in (14, 16)
group by manufacture_code;

-- Question 3 --
-- Name and price of items with price >= 250, ordered by price DESC then name ASC
select product_name, price
from company
where price >= 250 
order by price desc, product_name asc;

-- Question 4 --
-- Name and price of the cheapest item
select product_name, price
from company
where price = (select min(price) from company);

-- Question 5 --
-- Find the data of employees whose last name is 'Snares'
drop table if exists employee_data;
create table employee_data(
     name varchar(50),
     salary int
);

insert into employee_data 
(name, salary) values
("Jack Snares", 24000),
("Scott Snares", 25000),
("Jack Jones", 29000),
("Nick Ley", 34000),
("Pee Cott", 20000);

-- Correct approach: check last name without modifying data
select *
from employee_data
where substring_index(name, ' ', -1) = 'Snares';

-- Question 6 --
-- Find the last names of employees, without duplicates
select distinct substring_index(name, ' ', -1) as last_name
from employee_data;
