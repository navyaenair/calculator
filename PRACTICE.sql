CREATE DATABASE PYTHON_DJANGO_NAVYA;
USE PYTHON_DJANGO_NAVYA;

CREATE TABLE  department(
dept_id int primary key,
dept_name varchar(20),
location varchar(20));

create table employee(
emp_id int primary key,
emp_name varchar (30),
dept_id int,hire_date DATE,salary decimal(10,2),
foreign key (dept_id) references department(dept_id));

create table project(
proj_id int primary key,
proj_name varchar(200),
emp_id int,budget decimal(10,2),
start_date date,foreign key (emp_id) references employee(emp_id));




-- Insert into department
INSERT INTO department (dept_id, dept_name, location) VALUES
(1, 'HR', 'New York'),
(2, 'IT', 'London'),
(3, 'Finance', 'Berlin'),
(4, 'Marketing', 'Paris');

-- Insert into employee
INSERT INTO employee (emp_id, emp_name, dept_id, hire_date, salary) VALUES
(101, 'Alice Brown', 1, '2018-05-10', 50000),
(102, 'Bob Smith', 2, '2020-08-21', 42000),
(103, 'Carol Jones', 1, '2019-03-15', 60000),
(104, 'David Lee', 3, '2021-01-10', 35000),
(105, 'Emma White', 2, '2017-11-05', 70000);

-- Insert into project
INSERT INTO project (proj_id, proj_name, emp_id, budget, start_date) VALUES
(201, 'Website Revamp', 102, 15000, '2022-04-01'),
(202, 'Hiring Drive', 101, 5000, '2021-10-15'),
(203, 'Payroll System', 104, 20000, '2022-01-05'),
(204, 'Cloud Migration', 103, 25000, '2023-03-10'),
(205, 'Security Audit', 105, 12000, '2021-06-20');


select * from department;
select * from employee;
select * from project;


select emp_name,salary from employee;

select employee.emp_name,department.dept_name from employee 
join department on employee.dept_id = department.dept_id
where department.dept_name="IT";

select * from department where location in ('London','paris');
select * from  project where budget>10000;

select * from employee where year(hire_date)=2019;

select count(*) from employee ;

select proj_name,budget 
from project order by budget desc;

select * from employee where salary between 40000 and 60000;

select * from employee where emp_name LIKE 'A%';
select * from employee where emp_name LIKE '%N';
select employee.emp_name,department.dept_name from employee join  department  on employee.dept_id = department.dept_id where department.dept_name in("HR","Finance");
UPDATE employee set salary=50000
where emp_id=102;

alter table employee ADD email varchar(100);
select * from employee;

select e.emp_name,d.dept_name ,d.location from employee e join department d on e.dept_id = d.dept_id;
select p.proj_name ,e.emp_name from project p join employee e on e.emp_id = p.emp_id;

