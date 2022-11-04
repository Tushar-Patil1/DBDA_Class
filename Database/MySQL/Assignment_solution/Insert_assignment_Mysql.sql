use insertdb;

create table countries(
country_id varchar(2),
country_name varchar(40),
region_id decimal(10,0)
);

select * from countries;
desc countries;

# 1. Write a SQL statement to insert a record with your own value into the table countries against each columns.

insert into countries values('A1','Austrelia',101);
insert into countries values('I1','India',102);
insert into countries values('J1','Japan',103);
insert into countries values('R1','Russia',104);

# 2.Write a SQL statement to insert one row into the table countries against the column country_id and country_name.

insert into countries (country_id, country_name) values ("C1","China");

# 3. Write a SQL statement to create a duplicate of countries table named country_new with all structure and data.

create table country_new select * from countries;

select * from country_new;

# 4. Write a SQL statement to insert NULL values against the region_id column for a row of countries table.

insert into countries (country_id, country_name) values('F1','France');

select * from countries;
desc countries;

# 5. Write a SQL statement to insert 3 rows by a single insert statement.

insert into countries values('G1','Germany',107),('S1','Switzerland',108),('S2','South_Africa',109);

#  7. Write a SQL statement to insert one row in the jobs table to ensure that no duplicate value will be entered in the job_id column.

create table jobs(
job_id int not null,
job_title varchar(50),
min_salary int,
max_salary int check(max_salary < 25000),
primary key(job_id)
);

select * from jobs;

insert into jobs values(1,"j1",5000,20000);

# 9. Write a SQL statement to insert a record into the table countries to ensure that a country_id and region_id combination will be entered once in the table.

create table countries_9(
country_id varchar(2) not null,
country_name varchar(40) not null,
region_id decimal(10,0) not null,
primary key(country_id, region_id)
);

insert into countries_9 values("I1","India",501);

select * from countries_9;

# 10. Write a SQL statement to insert rows into the table countries in which the value of the country_id column will be unique and auto incremented.

create table countries_10(
country_id int not null auto_increment,
country_name varchar(40) not null,
region_id decimal(10,0) not null,
primary key(country_id)
);

select * from countries_10;

insert into countries_10 values (1,"India",501);
insert into countries_10 (country_name, region_id) values ("Japan",601);

# 11. Write a SQL statement to insert records into the table countries to ensure that the country_id column will not contain any duplicate data and this will be automatically incremented and the column country_name will be filled up by 'N/A' if no value assigned for that column.

create table countries_11(
country_id int not null auto_increment,
country_name varchar(40) not null default 'N/A',
region_id decimal(10,0) not null,
primary key(country_id)
);

select * from countries_11;

insert into countries_11 values (1,"India",501);
insert into countries_11(region_id) values(600);

# 12. Write a SQL statement to insert rows in the job_history table in which one column job_id is containing those values which exist in the job_id column of the jobs table.

create table jobs_12(
job_id int not null,
job_title varchar(50),
min_salary int ,
max_salary int check(max_salary < 25000),
primary key(job_id)
);

select * from jobs_12;

insert into jobs_12 values(1,"t1",5000,20000),(2,"t2",6000,18000);

