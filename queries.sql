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