create database hospital_db;
use hospital_db;
create table patients (
patient_id int primary key,
patient_name varchar (100),
age int,
disease varchar(100));

insert into patients values (201, "Amit" , 25, "Fever" ),
(202, "Neha", 32, "Malaria"),
(203,"Ravi" , 40, "Diabties"),
(204,"Priya", 28, "Dengue"),
(205,"Mohan",36, "Typhoid");
update patients set city = "Kanpur" where patient_id = 204;



select * from patients;


