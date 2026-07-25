use emyployee_db;
select * from emyployees;
-- DISTINCT
select distinct Deapartment from emyployees;

select distinct Age from emyployees;

-- LIMIT
select * from emyployees
limit 3;

select * from emyployees 
order by salary desc 
limit 3;

select * from emyployees 
order by age asc
limit 1;

-- BETWEEN 
select * from emyployees
where salary between 30000 and 50000;

select * from emyployees 
where age between 25 and 28;
-- IN 
select * from emyployees where deapartment in ('IT','HR') ;

select * from emyployees where emp_id in (101,102,104);

-- UPDATE 
update emyployees set Salary = Salary+5000 where emp_id = 104;

update emyployees set deapartment = 'Marketing' where emp_id = 101;

-- AGGREAGATE FUNCTION 
select count(*) from emyployees;

select max(salary) from emyployees; 

select avg(salary) from emyployees;

select sum(salary) from emyployees;

-- GROUP BY
select deapartment, count(*)  from emyployees group by deapartment;

select deapartment, avg(salary) from emyployees group by deapartment;

-- HAVING 

select deapartment, count(*) from emyployees group by deapartment having count(*) >1;
select deapartment,avg(salary) from emyployees group by deapartment having avg(salary)>40000;
