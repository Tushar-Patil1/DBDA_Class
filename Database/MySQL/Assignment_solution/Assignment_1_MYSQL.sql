# 1. Create 'spj' database'.
create database spj;
use spj;

# 2. Create following tables in spj database. CREAT TABLE S (S# CHAR(5) NOT NULL, Sname CHAR(20), status SMALLINT, city CHAR(15)); TABLE S S# Sname status city

create table s(
sid char(5) NOT NULL,
sname char(20),
status smallint,
city char(20)
);

# CREATE TABLE P
-- (P# CHAR(6) NOT NULL, Pname CHAR(20), color CHAR(6), weight SMALLINT , city
-- CHAR(15));
-- TABLE P
-- P# Pname Color Weight City

create table p (
pid char(6) not null,
pname char(20),
color char(6),
weight smallint,
city char(15)
);

-- CREATE TABLE J (J# CHAR(4) NOT NULL, Jname CHAR(10), City CHAR(15));
-- TABLE J
-- J# Jname City

create table j (
jid char(4) not null,
jname char(10),
city char(15)
);

-- Database Technologies – Assignment 1

-- Sunbeam Institute of Information Technology Pune & Karad
-- CREATE TABLE sp (S# CHAR(4) NOT NULL, P# CHAR(4) NOT NULL, J# CHAR(4)
-- NOT NULL, QTY INT);






