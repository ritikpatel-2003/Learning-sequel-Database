create database emyployee_compny;
use emyployee_compny;
create table emyployees (
emp_id int primary key,
emp_name varchar(30),
department varchar(20),
salary int,
manager_id int);

insert into emyployees values (101, 'Rohan','HR', 700000, null),
(102, 'Amit', 'IT', 50000,101),
(103, 'Neha' , 'Finance' , 55000, 101),
(104,'Priya', 'IT', 45000, 102 ),
(105,'Anuj','HR', 40000,102),
(106,'Karan','Sales',60000, 103),
(107, 'Riya' , 'IT', 42000, 103),
(108,'Mohan', 'Sales',39000,106);
select * from emyployees;

-- QUESTION-1
select e.emp_name as Employee,
m.emp_name as Manager
from emyployees as e inner join emyployees as m on 
e.manager_id =m.emp_id;

-- QUESTION-2
select 
e.emp_name as Emyployee,
m.emp_name as Manager,
e.department
from emyployees as e join emyployees as m 
on 
m.emp_id = e.manager_id;

-- QUESTION-3
select 
e.emp_name as Emyployee,
m.emp_name as Manager,
e.department
from emyployees as e inner join emyployees as m 
on 
m.emp_id = e.manager_id
where m.emp_name = 'Rohan';

-- QUESTION-4
select e.emp_id,
e.emp_name as Emyployee,
e.salary,
e.department,
m.emp_name as Manager
from emyployees as e inner join emyployees as m 
on 
m.emp_id = e.manager_id
where m.emp_name= 'Amit';

-- QUESTION-5
select 
m.emp_name as Manager,
count(e.emp_name) as No_of_Emyployee
from emyployees as e inner join emyployees as m 
on 
e.manager_id = m.emp_id
group by m.emp_name ;

-- QUESTION-6 
select 
count(*) as NO_of_Emyployee,
m.emp_name as Manager
from emyployees as e inner join emyployees as m
on 
m.emp_id = e.manager_id
group by m.emp_name ,m.emp_id
order by NO_of_Emyployee desc
limit 1 ;

-- QUESTION - 7
select 
e.emp_id,
e.emp_name as Emyployee,
e.salary,
e.department,
m.emp_name as Manager
from emyployees as e  join emyployees as m 
on 
e.manager_id  = m.emp_id
where e.salary > m.salary;

-- QUESTION-11
select
e.emp_name as Emyployee,
m.emp_name as Manager
from emyployees as e join emyployees as m 
on 
m.emp_id = e.manager_id
where m.salary - e.salary <= 10000;














