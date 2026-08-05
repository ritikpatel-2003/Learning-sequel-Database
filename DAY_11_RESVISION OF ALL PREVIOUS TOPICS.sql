create database compny_master;
use  compny_master;
-- Step 1: Create the Employees table
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    manager_id INT
);

-- Step 2: Insert the dataset records
INSERT INTO Employees (emp_id, emp_name, department, salary, manager_id) VALUES
(101, 'Rahul', 'IT', 60000, NULL),
(102, 'Aman', 'HR', 45000, 101),
(103, 'Priya', 'IT', 70000, 101),
(104, 'Neha', 'Finance', 55000, 102),
(105, 'Karan', 'HR', 40000, 102),
(106, 'Riya', 'Sales', 65000, 103),
(107, 'Mohan', 'Finance', 80000, 103),
(108, 'Anjali', 'IT', 50000, 101);

-- Step 1: Create the Projects table
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100),
    emp_id INT
);

-- Step 2: Insert records
INSERT INTO Projects (project_id, project_name, emp_id) VALUES
(1, 'ERP System', 101),
(2, 'HR Portal', 102),
(3, 'Inventory', 103),
(4, 'Finance App', 104),
(5, 'CRM', 106),
(6, 'Website', 109);


-- Step 1: Create the Departments table
CREATE TABLE Departments (
    department VARCHAR(50) PRIMARY KEY,
    location VARCHAR(50)
);

-- Step 2: Insert records
INSERT INTO Departments (department, location) VALUES
('IT', 'Delhi'),
('HR', 'Mumbai'),
('Finance', 'Pune'),
('Marketing', 'Bangalore');

-- QUESTION-01
-- Display every employee along with the project they are working on.

select e.emp_id,
e.emp_name,
p.project_name
from Employees as e inner join Projects as p
on 
e.emp_id = p.emp_id;

-- QUESTION-02
-- Display all employees, even if they are not assigned to any project.
select e.emp_id,
e.emp_name,
e.department,
e.salary,
p.project_id,
p.project_name
from Employees as e left join Projects as p 
on 
e.emp_id = p.emp_id ;


-- QUESTION-03
-- Display all departments, even if no employee belongs to that department.
select 
e.emp_id,
e.emp_name,
e.salary,
d.department
from Employees as e right join Departments as d
on 
e.department = d.department;

-- QUESTION-4
-- Find the employee(s) who earn the highest salary.
select * from Employees where salary = (select max(salary) from Employees);

--  QUESTION-05
-- Display employees whose salary is greater than the company's average salary.

select * from Employees where salary > (select avg(salary) from Employees);

-- QUESTION-06
-- Display each employee along with the name of their manager.
select e1.emp_id,
 e1.emp_name as Employee_Name,
e2.emp_name as Mananger_Name
from Employees as e1  join  Employees as e2
on 
e1.manager_id = e2.emp_id;

-- QUESTION-07
-- Display employees who do not have any manager.
select * from Employees where manager_id is null;

-- QUESTION-08
-- Display the department name and the total salary paid in each department.
select department , sum(salary)	from Employees group by department;

-- QUESTION-09
-- Display only those departments where the average salary is greater than ₹55,000.
select department from Employees group by department having avg(salary) > 55000;

-- QUESTION-10
-- Find employees working in the same department as Rahul.
SELECT 
    emp_id, 
    emp_name, 
    department, 
    salary
FROM Employees
WHERE department = (
    SELECT department 
    FROM Employees 
    WHERE emp_name = 'Rahul'
 ) and emp_name <> 'Rahul';
 
 
 -- QUESTION-11
 -- Display the names of employees whose manager earns more than ₹65,000.
 select
e1.emp_id,
e1.emp_name,
e1.department
from Employees as e1 join Employees as e2
on
e1.manager_id = e2.emp_id where e2.salary > 65000;


-- QUESTION-12
-- Display every employee, their project (if any), and their department location in one result.
select e.emp_id,
e.emp_name,
e.department,
e.salary,
d.location,
p.project_name
from Employees as e left join Projects as p
on e.emp_id = p.emp_id
inner join Departments as d on
e.department = d.department;

-- QUESTION-13
-- Find employees who are not assigned to any project.
select 
e.emp_id,
e.emp_name,
e.department,
e.salary from Employees as e left join Projects as p 
on e.emp_id = p.emp_id 
where p.emp_id is null;

-- QUESSTION-14
-- Find project records that do not belong to any employee.
select 
e.emp_id,
e.emp_name,
e.department,
e.salary,
p.emp_id from Employees as e right join Projects as p 
on e.emp_id = p.emp_id 
where e.emp_id is null;

-- QUESTION-15
-- Display the top 3 highest-paid employees.

select * from Employees 
order by salary desc
limit 3;

-- QUESTION-16
-- Display the names of employees whose salary is between ₹50,000 and ₹70,000, sorted by salary in descending order.
select * from Employees where salary between 50000 and 70000 
order by salary desc;

-- QUESTION-17
SELECT 
    emp_id,
    emp_name,
    department,
    salary,
    CASE 
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary BETWEEN 50000 AND 69999 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS Salary_Status
FROM Employees;


























