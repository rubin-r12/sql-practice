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

--- class2
CREATE database class2_db;
use class2_db;

CREATE table if NOT EXISTS employee(
id int,
name VARCHAR(50),
address VARCHAR(50),
city VARCHAR(50)
);

INSERT into employee values(1,'Rubin','TNABR','Dewas');
select * FROM employee;

--- add new column to the table
ALTER table employee add DOB DATE;

--- modify column
ALTER table employee modify address VARCHAR(100);

show CREATE table employee;

CREATE TABLE `employee` (
  `id` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `DOB` date DEFAULT NULL
);

--- drop column
ALTER table employee DROP column city;

--- rename column
alter table employee rename column name to full_name;

--- drop employee table
drop table employee;

create table if not exists employee(
	id int,
    name varchar(50),
    age int,
    hiring_date date,
    salary int,
    city varchar(50)
);

insert into employee values(1,'A',28,'2018-06-18',83000,'Dewas');
insert into employee values(2,'B',27,'2019-05-19',73000,'Indore');
insert into employee values(3,'C',26,'2020-04-20',97000,'Ujjain');
insert into employee values(4,'D',25,'2021-07-21',65000,'Dhar');
insert into employee values(5,'E',24,'2022-02-23',53000,'Mhow');

select * from employee;

--- make id column unique
alter table employee add constraint id_unique unique(id);

show create table employee;

--- delete constraint
alter table employee drop constraint id_unique;

--- primary key
create table persons(
	id int,
    name varchar(50),
    age int,
    Primary Key(id)
);

insert into persons values(1,'Rubin',28);
insert into persons values(null,'Rahul',27);

--- foreign key
create table customer(
	cust_id int,
    name varchar(50),
    age int,
    constraint pk primary key(cust_id)
);

create table orders(
	order_id int,
    order_num int,
    customer_id int,
    constraint pk primary key(order_id),
    constraint fk foreign key(customer_id) references customer(cust_id)
);

insert into customer values(1,'Rubin',29);
insert into customer values(2,'Rahul',30);

select * from customer;

insert into orders values(1001,20, 1);
insert into orders values(1002,30, 2);
insert into orders values(1004,35, 5);
select * from orders;

select * from persons;

--- difference between drop and truncate
truncate table persons;
drop table persons;

create table if not exists employee(
	id int,
    name varchar(50),
    age int,
    hiring_date date,
    salary int,
    city varchar(50)
);
select * from employee;

--- count
select count(*) from employee;
select count(1000) from employee;

--- alias
select count(*) as total_row_count from employee;

--- selected columns
select name, salary from employee;

select name as employee_name,
		salary as employee_salary
from employee;

--- distinct
select count(distinct(hiring_date)) as count_of_hiring_date from employee;

select	id,
		name,
        salary as old_salary,
        salary*1.2 as new_salary
from employee;
        
select * from employee;

--- update
update employee set age=20 where name='B';

update employee set age=25, salary = 1.2 * salary;

--- selective update
select * from employee where hiring_date='2018-06-18';

update employee set salary=80000 where hiring_date='2018-06-18';

--- selective delete
delete from employee where hiring_date='2022-02-23';

--- auto increment
create table auto_inc_emp(
	id int auto_increment,
    name varchar(50),
    primary key(id)
);

insert into auto_inc_emp(name) values('Rubin');
insert into auto_inc_emp(name) values('Rahul');

select * from auto_inc_emp;

--- limit
select * from employee limit 3;

--- order by
select * from employee order by salary desc;


--- multi level ordering
insert into employee values(6,'F',28,'2020-02-20',97000,'Shajapur');
select * from employee order by salary desc, name asc;


--- max salary
select * from employee order by salary desc limit 1;


--- conditional operator
select * from employee where salary>=65000;

select * from employee where salary<70000;

select * from employee where age=26;

--- != or <>
select * from employee where age!=26;
select * from employee where age<>26;

select * from employee where salary=83000 and hiring_date='2018-06-18';

--- between
select * from employee where hiring_date between '2018-01-01' and '2020-01-01';

select * from employee where salary between 80000 and 100000;

select * from auto_inc_emp where name like '____%';










































































































































