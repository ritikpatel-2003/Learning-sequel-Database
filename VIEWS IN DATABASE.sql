create database view_db;
use view_db;
create table Students (id int primary key, name varchar(50), department varchar(50),gpa int);
insert into Students values(101, 'Anuj','CSE',8.62),
(102, 'Prabal','IT',7.5),
(103, 'Priya', 'CSE', 9.10),
(104, 'Rahul', 'ME', 6.80),
(105, 'Neha', 'IT', 8.70),
(106, 'Arjun', 'CSE', 7.90),
(107, 'Sneha', 'ECE', 8.40),
(108, 'Vikas', 'ME', 7.20),
(109, 'Anjali', 'IT', 9.00),
(110, 'Karan', 'CSE', 6.90),
(111, 'Pooja', 'ECE', 8.60),
(112, 'Rohan', 'ME', 7.80),
(113, 'Meera', 'IT', 8.90),
(114, 'Deepak', 'CSE', 7.40),
(115, 'Nisha', 'ECE', 9.20),
(116, 'Mohit', 'IT', 6.70),
(117, 'Simran', 'ME', 8.10),
(118, 'Aditya', 'CSE', 8.50),
(119, 'Kavita', 'ECE', 7.60),
(120, 'Sahil', 'IT', 8.00),
(121, 'Komal', 'ME', 7.10),
(122, 'Yash', 'CSE', 9.30),
(123, 'Tanya', 'ECE', 8.30),
(124, 'Abhishek', 'IT', 7.70),
(125, 'Shreya', 'ME', 8.80),
(126, 'Harsh', 'CSE', 7.00),
(127, 'Divya', 'ECE', 8.90),
(128, 'Manish', 'IT', 7.50),
(129, 'Aditi', 'CSE', 9.40),
(130, 'Varun', 'ME', 6.90);


CREATE TABLE Student_Details (
    id INT PRIMARY KEY,
    Email VARCHAR(50),
    Phone VARCHAR(15),
    City VARCHAR(30),
    AdmissionYear INT
);

INSERT INTO Student_Details VALUES
(101, 'anuj@gmail.com', '9876543201', 'Delhi', 2023),
(102, 'prabal@gmail.com', '9876543202', 'Kanpur', 2022),
(103, 'priya@gmail.com', '9876543203', 'Lucknow', 2023),
(104, 'rahul@gmail.com', '9876543204', 'Gwalior', 2021),
(105, 'neha@gmail.com', '9876543205', 'Indore', 2022),
(106, 'arjun@gmail.com', '9876543206', 'Agra', 2023),
(107, 'sneha@gmail.com', '9876543207', 'Jaipur', 2022),
(108, 'vikas@gmail.com', '9876543208', 'Bhopal', 2021),
(109, 'anjali@gmail.com', '9876543209', 'Noida', 2023),
(110, 'karan@gmail.com', '9876543210', 'Jhansi', 2022),
(111, 'pooja@gmail.com', '9876543211', 'Meerut', 2021),
(112, 'rohan@gmail.com', '9876543212', 'Patna', 2022),
(113, 'meera@gmail.com', '9876543213', 'Varanasi', 2023),
(114, 'deepak@gmail.com', '9876543214', 'Prayagraj', 2022),
(115, 'nisha@gmail.com', '9876543215', 'Delhi', 2021),
(116, 'mohit@gmail.com', '9876543216', 'Kanpur', 2023),
(117, 'simran@gmail.com', '9876543217', 'Indore', 2022),
(118, 'aditya@gmail.com', '9876543218', 'Lucknow', 2023),
(119, 'kavita@gmail.com', '9876543219', 'Jaipur', 2021),
(120, 'sahil@gmail.com', '9876543220', 'Agra', 2022),
(121, 'komal@gmail.com', '9876543221', 'Bhopal', 2023),
(122, 'yash@gmail.com', '9876543222', 'Noida', 2021),
(123, 'tanya@gmail.com', '9876543223', 'Delhi', 2022),
(124, 'abhishek@gmail.com', '9876543124', 'Delhi',2022),
(125, 'shreya@gmail.com',    '9876543125', 'Mumbai',2021),
(126, 'harsh@gmail.com',     '9876543126', 'Lucknow',2023),
(127, 'divya@gmail.com',     '9876543127', 'Jaipur',2021),
(128, 'manish@gmail.com',    '9876543128', 'Bhopal',2024),
(129, 'aditi@gmail.com',     '9876543129', 'Kanpur',2025),
(130, 'varun@gmail.com',     '9876543130', 'Indore', 2025);

-- TASK-1
create view  students_names as 
select id,name from Students;

select * from students_names;

-- TASK-2
create view high_gpa_students as 
select * from Students where gpa >= 8.0;

select * from high_gpa_students;

-- TASK-3
create or replace view IT_Students as 
select id, name, gpa, department from Students 
where department = 'IT';
select * from IT_Students;

-- TASK-4
create or  replace view student_contact_info as
select s.id,
s.name,
sd.Email,
sd.Phone 
from Students as s inner join Student_Details as sd 
on s.id = sd.id;

select * from student_contact_info;

-- QUESTION-5
create or replace view Kanpur_Students as
select s.id,
s.name,
s.department,
sd.City
from Students as s inner join Student_Details as sd 
on s.id = sd.id where City = 'Kanpur';

select * from Kanpur_Students;

-- HRAD LEVEL VIEWS 

-- QUESTION-9
create view Department_Average_GPA as 
select department,  avg(gpa) from Students group by department;

select * from  Department_Average_GPA;

-- QUESTION-10
create or replace view Department_Student_Count as 
select department, count(id) as Total_Students from students group by department;

select * from Department_Student_Count;

-- QUESTION-11
create or replace view Large_Departments as 
select * from Department_Student_Count having Total_Students >7 ;

select * from Large_Departments;

-- QUESTION-12
create or replace view Average_Above_Students as
select  id, Name, gpa from Students where gpa > (select avg(gpa) from Students);

select * from Average_Above_Students;

-- QUESTION-13
create view Department_Toppers as
select id, name, department,gpa from Students s1 where gpa > (select  avg(gpa) from Students s2 where s1.department = s2.department);

 select * from  Department_Toppers;
 
 -- QUESTION-14
 create or replace view high_performer_contacts as
 select s.name,
 s.department,
 s.gpa,
 sd.Email,
 sd.Phone
 from Students as s inner join Student_Details as sd 
 on s.id = sd.id 
 where s.gpa = 9.0;

select * from high_performer_contacts ;


 