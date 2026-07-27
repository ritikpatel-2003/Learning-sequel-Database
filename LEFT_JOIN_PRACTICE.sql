use school_join_db;

-- QUES-1
-- DISPLAY ALL STUDENTS AND THEIR MARKS USING LEFT JOIN
select s.student_name, 
m.marks
from student as s left join marks as m on 
s.student_id = m.student_id;

-- QUESTION-2
-- FIND STUDENTS WHO DONT HAVE ANY MARKS
select s.student_id,
s.student_name
from student as s left join marks as m on 
s.student_id = m. student_id where m.marks is null;

-- QUESTION-3
select
s.student_name,
s.class,
m.subject,
m.marks
from student as s left join marks as m on
s.student_id = m.student_id;

-- QUESTION-4
-- COUNT HOW MANY SRUDENTS DON'T HAVE ANY MARKS
select 
count(*)
from student as s left join marks as m on 
s.student_id = m.student_id
where m.marks is null;

-- QUESTION-5
select 
s.student_name,
t.teacher_name
from student as s left join teachers as t on 
s.class = t.class;

-- QUESTION-6
select 
s.student_name
from student as s left join marks as m on 
s.student_id = m.student_id 
where s.city = 'kanpur';

-- QUESTION-7
select 
s.student_name 
from student as s  left join marks as m 
on 
s.student_id = m.student_id 
where m.marks is null;
select * from student;

-- QUESTION -8 
select 
s.student_id,
s.student_name,
s.city,
m.marks,
m.subject
from student as s left join marks as m on 
s.student_id = m.student_id 
order by m.marks desc;









