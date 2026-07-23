create database emyployee_db;

use emyployee_db;

-- CREATING A TABLE 

create table emyployees ( emp_id  INT PRIMARY KEY,
Emp_name varchar(100),
Age int,
Deapartment varchar(50),
Salary int);

-- INSERTING THE DATA
insert into emyployees values (101, "Rohan", 25, "HR", 30000),
(102,"Sneha", 28, "IT",45000),
(103, "Aman", 24, "Sales", 35000),
(104, "Priya", 30, "IT", 50000),
(105,"Karan", 27, "HR", 32000),
(106,"Neha", 29, "Finanace",55000);

-- DISPLAY ALL THE EMYPLOYEES
 select * from emyployees; 
 
 -- DISPLAY ONLY EMP_NAME AND SALARY
 select emp_name, salary from emyployees;
 
 -- DIAPLAY EMYPLOYEES WHERE AGE IS GREATER THE 26
 select * from emyployees where Age > 26; 
 
 -- DISPLAY EMPLOYEES WORKING IN THE IT DEPARTMENT
 select * from emyployees where Deapartment = "It";
 
 -- CHANGE KARAN'S SALARY TO 40000
 update emyployees set salary = 40000 where emp_id = 105;
 
-- CHANGE NEHA DEPARTMENTS TO ACCOUNTS.
update emyployees set Deapartment = "Accounts" where emp_id = 106;

-- DELETE THE EMP_ID = 103
delete from emyployees where emp_id =103; 

-- DISPLAY THE EMPLOYEES IN ASCENDING ORDER 
select * from emyployees 
order by Age ASC;

-- DISPLAY EMYPLOYEES IN DESCENDING ORDER
select * from emyployees
order by Age DESC;

-- FIND THE TOTAL NUMBER OF EMYPLOYEES
select count(*) from emyployees;

-- FIND THE HIGHEST SALARY
select max(Salary) from emyployees; 

-- FIND THE LOWEST SALARY
select min(salary) from emyployees; 

-- FIND THE AVERAGE SALARY
select avg(salary) from emyployees; 

-- FIND TOTAL SALARY OF EMYPLOYEES
select sum(salary) from emyployees; 

-- ADD A NEW COLUMN NAMED CITY
alter table emyployees add city varchar(50) ;
update emyployees set city = "Hyderabad" where emp_id =101;
update emyployees set city = "Chennai" where emp_id =102;
update emyployees set city = "Deharadun" where emp_id =103;
update emyployees set city = "Delhi" where emp_id =104;
update emyployees set city = "Noida" where emp_id =105;
update emyployees set city = "Gurugram" where emp_id =106;

select* from emyployees; 

-- INCREASE THE SALARY OF THE EVERY EMYPLOYEE IN THE IT DEPARTMENT BY 5000
update emyployees set salary= salary+5000 where Deapartment = "IT";

-- DISPLAY THE NAME WHOSE NAME STARTS WITH P
select * from emyployees where Emp_name like 'P%';
select * from emyployees where Emp_name like '%a';




