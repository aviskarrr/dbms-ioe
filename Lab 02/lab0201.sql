create database library;
use library;
create table student(sid int, sname varchar (20), rn int, batch int);
create table teacher(tid int, tname varchar (20), doj date, salary float);
create table employee(eid int, ename varchar (20), doe date, salary float);
create table booklist(isbn int, name varchar (20), pub varchar(20));
create table book(bid int, bname varchar (20), author varchar(20), price float);
create table issue(iid int, iname varchar (20), doi date);

-- setting promary key as not null i.e sid to not null
-- task to do is Modify the relation teacher and student
		--1. Set sid as primary key
			--1. set not null sid as primary key cant be empty
		--2. set tid as foreign key refrence to sid

ALTER TABLE student ALTER COLUMN sid int NOT NULL; -- setting primary key as not null
ALTER TABLE student ADD primary key(sid)  -- setting primary key 

ALTER TABLE teacher ALTER COLUMN tid int NOT NULL; -- setting foreign key as not null