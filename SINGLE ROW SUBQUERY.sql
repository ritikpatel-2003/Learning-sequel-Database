create database subqueries_db;
use subqueries_db;

create table customers (customer_id int primary key, Name varchar (30), Country varchar(20));
insert into customers values (101, 'Tech Corp', 'USA' ),
(102, 'Bio Health', 'UK'),
(103, 'Fin Data' , 'USA' ),
(104, 'Eco Green', 'Germany');

create table Orders (orderId int unique , customer_id int , OrderAmount int , OrderDate Date);
INSERT INTO Orders 
VALUES
(1, 101, 500, '2024-01-15'),
(2, 101, 1200, '2024-02-10'),
(3, 102, 300, '2024-02-12'),
(4, 103, 2500, '2024-03-01'),
(5, 103, 1500, '2024-03-15');

-- SINGLE ROW SUBQUERY
select * from Orders where OrderAmount > (select avg(OrderAmount) from Orders);

-- QUESTION-1
select* from Orders where OrderAmount = (select max(OrderAmount) from Orders);

-- QUESTION-3
select customer_id , OrderAmount from Orders where OrderDate = ( select min(OrderDate) from Orders);

-- QUESTION-5
select * from Orders where OrderAmount >  (select avg(OrderAmount) from Orders where customer_id =101);

-- QUESTION-4
select * from Orders where OrderAmount  < (select max(OrderAmount) from Orders);

