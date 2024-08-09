--- See the list of databases
Show databases;
--- Create a database
create database noob_db;
--- Drop database
drop database noob_db;
--- Command to get inside a database
use noob_db;

--- Create a table
create table if not exists employee
(
	id int,
    emp_name varchar(20)
);

--- Alternate to use a db and create a table
create database tmp_db;
create table if not exists tmp_db.employee
(
	id int,
    emp_name varchar(20)
);
show tables;
--- Create a new table inside noob_db with new columns
create table if not exists employee_v1
(
	id int,
    name varchar(50),
    salary double,
    hiring_date date
);

--- show create table 
show create table employee_v1;
CREATE TABLE `employee_v1` (
  `id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `salary` double DEFAULT NULL,
  `hiring_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--- DML
insert into employee_v1 values(1, 'Rubin', 1000, '2024-08-09');

--- insert into table only for selected columns
insert into employee_v1(salary, name, id) values(2000, 'Rahul', 2);

--- insert multiple records into a table
insert into employee_v1 values
(3, 'Amit', 3000, '2024-08-08'),
(4, 'Nitin', 3500, '2024-08-07'),
(5, 'Kajal', 4000, '2024-08-06');


--- DQL
--- Query/Fetch the data
select * from employee_v1;
select name, salary from employee_v1;

--- create table with constraints
create table if not exists employee_with_constraints
(
	id int,
    name varchar(50) not null,
    salary double,
    hiring_date date default '2024-01-01',
    unique (id),
    check (salary > 1000)
);

--- insert records into the table
insert into employee_with_constraints values
(1, 'Rubin', 3000, '2024-01-03');

insert into employee_with_constraints values
(1, 'Rahul', 5000, '2024-02-03');

insert into employee_with_constraints values
(null, 'Rahul', 5000, '2024-02-03');

insert into employee_with_constraints values
(null, 'Rajat', 5000, '2024-02-03');

insert into employee_with_constraints values
(null, 'Amit', 500, '2024-02-03');
--- Error Code: 3819. Check constraint 'employee_with_constraints_chk_1' is violated.

insert into employee_with_constraints(id, name, salary)
values(3,'Neeraj',4000);

select * from employee_with_constraints;

create table if not exists employee_with_constraints_tmp
(
	id int,
    name varchar(50) not null,
    salary double,
    hiring_date date default '2024-01-01',
    constraint unique_emp_id unique (id),
    constraint salary_check check (salary > 1000)
);

insert into employee_with_constraints_tmp values
(1, 'Arjun', 500,'2024-02-02');
--- Error Code: 3819. Check constraint 'salary_check' is violated.




