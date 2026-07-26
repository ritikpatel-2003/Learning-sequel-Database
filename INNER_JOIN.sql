 create database school_join_db ;
 use school_join_db;
 create table student (student_id int primary key, student_name varchar(50),class int, city varchar(50));
 insert into student values(101,'Rahul',10,'Kanpur'),
 (102,'Anuj',10,'Lucknow'),
 (103, 'Priya',9,'Delhi'),
 (104,'Neha',8,'Agra'),
 (105,'Karan',9,'Noida'),
 (106,'Aman',10,'Kanpur');
 
 create table marks (student_id int primary key, subject varchar(30), marks int);
 insert into marks values(101,'Maths', 95),
 (102,'Science',82),
 (103, 'English',88),
 (105,'Maths',90),
 (106,'Science',79);
 select * from marks ;
 
 -- INNER JOINS QUESTIONS 
 -- QUES 1
 select s.student_name ,
 m.subject,
 m.marks
 from student as s 
 inner join marks as m
 on s.student_id = m. student_id; 
 
 -- QUES_2
 select s.student_name,
 s.class,
 m.subject,
 m.marks
 from student as s inner join marks as m  on 
 s.student_id = m.student_id;
 
 -- QUES-3
 select 
 s.student_name,
 m.marks
 from student as s inner join marks as m on
 s.student_id = m.student_id where marks>85;
 
 -- QUES-3
 select 
 s.student_name,
 s.class
 from student as s inner join marks as m on
 s.student_id = m.student_id where class = 10;

-- QUES-4
select * from student where class =10;

-- QUES-5
-- DISPLAY STUDENT FROM KANPUR
select s.student_id,
s.student_name,
s.class,
s.city,
m.subject,
m.marks
from student as s inner join marks as m on
s.student_id = m.student_id where city = 'kanpur';

-- QUES-6
-- ARRANGE STUDENTS ACCORDING TO MARKS IN DESCENDING ORDER 
select s.student_id,
s.student_name,
s.class,
s.city,
m.subject,
m.marks
from student as s inner join marks as m on 
s.student_id = m.student_id
order by  m.marks desc;

-- QUES-7
-- DISPLAY ONLY STUDENT NAME AND MARKS USING ALIASES
select 
s.student_name as Name,
m.marks as Marks
from student as s  inner join marks as m on 
s.student_id = m.student_id;

-- QUESTION - 8
-- FIND THE AVERAGE MARKS
select
avg(m.marks) 
from student as s inner join marks as m on
s.student_id = m.student_id;

-- QUES-9
-- FIND THE STUDENT WITH HIGHEST MARKS 
select s.student_id,
s.student_name,
s.class,
s.city,
m.subject,
m.marks
from student as s inner join marks as m  on 
s.student_id = m.student_id 
order by m.marks desc 
limit 1 ;

-- QUES-10
-- COUNT HOW MANY STUDENTSHAVE RECORDS AFTER THE INNER JOIN 
select
count(*)
from student as s inner join marks as m on 
s.student_id = m.student_id;

-- CHALLANGE LEVEL 

create table teachers (class int , teacher_name varchar(50));
insert into teachers values (8, 'Meena' ),
(9,'Rajesh'), (10,'Anil');
 

-- QUESTION 11
-- DISPLAY STUDENT NAME AND TEACHERS NAME 
select s.student_name,
t.teacher_name
from student as s inner join teachers as t on 
s.class = t.class;

-- QUESTION 12
-- DISPLAY ALL THE ATTRIBUTES OF THE THREE TABLES
select
s.student_name,
s.city,
t.teacher_name,
m.subject,
m.marks
from student as s inner join marks as m on 
s.student_id = m.student_id 
inner join teachers as t on 
s.class = t.class ;

-- QUESTION 13
-- FIND TRHE AVERAGE MARKS CLASS WISE 
select 
s.class,
avg(m.marks)
from student as s inner join marks as m on  
s.student_id = m.student_id group by s.class;

-- QUESTION-14
-- WHICH TEACHER TEACHES THE STUDENT WHO SCORED THE HIGHEST MARKS
select
s.student_name,
s.city,
t.teacher_name,
m.subject,
m.marks
from student as s inner join marks as m on 
s.student_id = m.student_id 
inner join teachers as t on 
s.class = t.class
order by m.marks desc
limit 1 ;

-- QUESTION 15

select s.student_id,
s.student_name,
s.class,
s.city,
m.marks,
m.subject,
t.teacher_name
from student as s inner join marks as m on
s.student_id = m.student_id
inner join teachers as t on 
s.class = t.class 
where s.class = 10 and m.marks > 85
order by m.marks desc;





































