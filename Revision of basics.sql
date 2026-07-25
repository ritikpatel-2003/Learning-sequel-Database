create database collage_db;
use  collage_db;

create table students (
student_id int primary key,
student_name varchar(50),
age int,
course varchar(50),
city varchar(50),
marks int);

insert into students values
(101,"Rahul",20,"BCA","Kanpur",82),
(102,"Priya",22,"BCA","Agra",91),
(103,"Aman",19,"MBA","Delhi",76),
(104,"Neha",22,"B.Tech","Ajmer",88),
(105,"Karan",20,"BBA","Jodhpur",68),
(106,"Riya",21,"BCA","Lucknow",83),
(107,"Rohit",23,"B.Tech","Unnao",74),
(108,"Anjali",19,"B.SC","Orai",59);

-- SHOW ALL STUDENTS
select* from students;

-- SHOW ONLY ONE STUDENT  NAME
select * from students 
limit 1;

-- SHOW STUDENTS NAME AND MARKS
select student_name, marks from students;

-- PART B
-- STUDENTS WHOSE MARKS ARE ABOVE THAN 80
select * from students where marks >80; 

-- STUDENTS WHOSE AGE IS 20;
 select * from students where age =20;
 
 --  STUDENTS FROM KANPUR
  select * from students where city = 'Kanpur';
  
  -- UPDATE
  -- CHANGE RAHUL'S MARKS TO 90
  update students set marks = 86 where student_id = 101 ; 
  
  -- CHANGE KARAN CITY TO NOIDA 
  update students set city = "Noida" where student_id =105;
 
-- DELETE
-- DELETE STUDENT ID 107

delete from students where student_id = 107;

-- DISTINCT
-- SHOW ALL UNIQUE COURSES
select distinct course from students;

select distinct city from students;

-- ORDER BY
-- ARRANGE ALL STUDENTS BY MARKS IN ASCENDING ORDER
select * from students order by marks asc;

-- ARRANGE ALL THE STUDENTS BY MARKS IN DESCENDING
select * from students order by marks desc;

-- LIMIT 
-- SHOW TOP 3 STUDENTS
select * from students order by marks desc limit 3;

select * from students limit 5; 

-- PART H
-- STUDENTS WHOSE MARKS ARE BEWEEN 70 AND 90
select * from students where marks between 70 and 90;

-- STUDENTS WHOSE AGE BETWEEN 20 AND 22
select * from students where age between 20 and 22;

-- PART I
-- STUDENTS FROM DELHI OR AGRA
select * from students where city in ('Delhi','Agra');

-- STUDENT STUDYING IN BCA OR BBA
select * from students where course in ('BCA','BBA');

-- PART J
-- NAME STARTS WITH R
select * from students where student_name like 'R%';

-- NAME ENDS WITH a
select * from students where student_name like '%a';

-- NAME CONTAIN an
select * from students where student_name like '%an%';

-- PART K
-- COUNT TOTAL STUDENT
select count(*) from students; 

-- FIND HIGHEST MARKS
select max(marks) from students;

-- FIND LOWEST MARKS 
select min(marks) from students; 

-- FIND AVERAGE MARKS
select avg(marks) from students;

-- FIND TOTAL MARKS OF ALL STUDENTS
select sum(marks) from students;

-- PART L 
-- COUNT STUDENTS IN EACH COURSE
select course, count(*) from students group by course;

-- AVERAGE MARKS OF EACH COURSE 
select course, avg(marks) from students group by course;

-- HIGHEST MARKS IN EACH COURSE 
select course, max(marks) from students group by course;

-- PART M
-- SHOWS COURSES HAVING MORE THAN TWO STUDENTS
select course, count(*) from students  group by course having count(*)>2;

-- SHOW COURSES WHOSE AVERAGE MARKS IS GREATER THAN 80
select course, avg(marks) from students group by course having avg(marks)>80;

-- PART N 
-- ADD A COLUMN NAMED PHONE_NUMBER
alter table students add(phone_number varchar(10) unique);
update students set phone_number = 7898658945 where student_id = 101;
update students set phone_number = 9565689874 where student_id = 102;
update students set phone_number = 7565896541 where student_id = 103;
update students set phone_number = 9563215478 where student_id = 104;
update students set phone_number = 9512479635 where student_id = 105;
update students set phone_number = 7545658521 where student_id = 106;
update students set phone_number = 8545659878 where student_id = 108;

-- DELETE THE PHONE NUMBER COLUMN 
alter table students drop column phone_number;

-- PART O
-- ADD A NEW STUDENT
insert into students values (107, 'Mohan',24,'M.SC','Etwah',85);

-- DISPLAY ONLY NAME AND CITIES USING ALIASES
select student_name as Name, city as City from students  ;

-- DELETE THE ENTIRE STUDENTS TABLE 
 -- drop table students; 

