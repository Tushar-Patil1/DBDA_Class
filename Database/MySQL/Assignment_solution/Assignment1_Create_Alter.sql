create database assignment;

use assignmet;

# 1. Write a SQL statement to create a simple table of countries including columns country_id,country_name and region_id.

create table countries(
country_id int not null,
country_name varchar(50),
region_id int,
primary key (country_id)
);

#2. Write a SQL statement to create a simple table of countries including columns country_id,country_name and region_id which already exists.

create table if not exists countries_2(
country_id int ,
country_name varchar(50),
region_id int
);

create table if not exists countries_2(
country_id int ,
country_name varchar(50),
region_id int
);

# 3. Write a SQL statement to create the structure of a table dup_countries similar to countries.

create table if not exists dup_countries like countries;

# 4. 4. Write a SQL statement to create a duplicate copy of countries table including structure and data by name dup_countries

create table if not exists dup_countries as select * from countries;
desc dup_countries;

#5 Write a SQL statement to create a table where countries set a constraint NULL.
 
create table countries_5(
country_id int not null,
country_name varchar(50) not null,
region_id int not null
);

# 6 Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary, max_salary and check whether the max_salary amount exceeds the upper limit 25000.

create table jobs(
job_id int,
job_title varchar(50),
min_salary int,
max_salary int check(max_salary < 25000)
);

insert into jobs values ( 1,"t1",10000,20000 );
insert into jobs values ( 2,"t2",10000,10000 );

# 7 Write a SQL statement to create a table named countries including columns country_id, country_name and region_id and make sure that no countries except Italy, India and China will be entered in the table.

create table countries_7(
country_id int not null,
country_name varchar(50) check (country_name in ('Italy','India','china')),
region_id int not null
);

create table countries_7_1(
country_id int not null,
country_name enum ('Italy','India','china'),
region_id int not null
);

# 8 Write a SQL statement to create a table named job_histry including columns employee_id, start_date, end_date, job_id and department_id and make sure that the value against column end_date will be entered at the time of insertion to the format like '--/--/----'.

create table job_histry(
employee_id int,
start_date date,
end_date date check (end_date like '--/--/----'),
job_id varchar(40),
department_id int
);

# 9. Write a SQL statement to create a table named countries including columns country_id,country_name and region_id and make sure that no duplicate data against column country_id will be allowed at the time of insertion.

create table countries_9 (
country_id varchar(40),
country_name varchar(40),
region_id int not null , 
unique (country_id)
);

# 10. Write a SQL statement to create a table named jobs including columns job_id, job_title, min_salary and max_salary, and make sure that, the default value for job_title is blank and min_salary is 8000 and max_salary is NULL will be entered automatically at the time of insertion if no value assigned for the specified columns.

create table jobs_10 (
job_id varchar(40),
job_title varchar(40),
min_salary int default 8000,
max_salary int default null
);

# drop table jobs_10;

# ALter commands

# 1.Write a SQL statement to rename the table countries to country_new.

alter table countries rename country_new;

# 2.Write a SQL statement to add a column region_id to the table locations.

alter table jobs add column region_id varchar(40);

# 3. Write a SQL statement to add a column ID as the first column of the table locations.

alter table jobs add column_id int first;

# 4. 4. Write a SQL statement to add a column region_id after state_province to the table locations.

# alter table jobs add region_id int after max_salary;





