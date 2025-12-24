create database library;
use library;
create table student(sid int, sname varchar (20) NOT NULL, rn int, batch int);
create table teacher(tid int, tname varchar (20) NOT NULL, doj date, salary float);
create table employee(eid int, ename varchar (20) NOT NULL, doe date, salary float);
create table booklist(isbn int, name varchar (20) NOT NULL, pub varchar(20));
create table book(bid int, bname varchar (20) NOT NULL, author varchar(20), price float);
create table issue(iid int, iname varchar (20) NOT NULL, doi date);

-- setting promary key as not null i.e sid to not null
-- task to do is Modify the relation teacher and student
		--1. Set sid as primary key
			--1. set not null sid as primary key cant be empty
		--2. set tid as foreign key refrence to sid

ALTER TABLE student ALTER COLUMN sid int NOT NULL; -- setting primary key as not null
ALTER TABLE student ADD primary key(sid)  -- setting primary key 

ALTER TABLE teacher ALTER COLUMN tid int NOT NULL; -- setting foreign key as not null

ALTER TABLE teacher ADD FOREIGN KEY (tid) REFERENCES student(sid);

ALTER TABLE student DROP COLUMN rn;


-- or we can also write 
-- alter table table name add constraint fk_tid [constrain name] foreign key column_Name refrences table_name(column_name);


--setting value
ALTER TABLE employee ADD CONSTRAINT doe_123 DEFAULT '2010-01-01' FOR doe;


-- Set iid as foreign key refrenceing bid:
ALTER TABLE book ALTER COLUMN bid int NOT NULL; -- setting primary key as not null
ALTER TABLE book ADD primary key(bid)  -- setting primary key 

ALTER TABLE issue ALTER COLUMN iid int NOT NULL; -- setting foreign key as not null
ALTER TABLE issue ADD FOREIGN KEY (iid) REFERENCES book(bid);



-- Task 5: Specify data entry criteria on price of book that it must be less than 5000.

ALTER TABLE book
ADD CONSTRAINT chk_price_limit CHECK (price < 5000);

-- Task 6: The name attirbute of each table must contain some value
-----------------------------------------------------------------------
-- we can also declare not null like:
-- create table booklist(isbn int, name varchar (20) NOT NULL, pub varchar(20));
-- or we can do:
ALTER TABLE student ALTER COLUMN sname varchar(20) NOT NULL; -- setting name attribute have some value compulsion
ALTER TABLE teacher ALTER COLUMN tname varchar(20) NOT NULL; -- setting name attribute have some value compulsion
ALTER TABLE employee ALTER COLUMN ename varchar(20) NOT NULL; -- setting name attribute have some value compulsion
ALTER TABLE book ALTER COLUMN bname varchar(20) NOT NULL; -- setting name attribute have some value compulsion
ALTER TABLE issue ALTER COLUMN iname varchar(20) NOT NULL; -- setting name attribute have some value compulsion





-- inserting into tables
-- Insert into student
INSERT INTO student (sid, sname, rn, batch) VALUES
(1, 'Suresh', 101, 1),
(2, 'Rita', 102, 1),
(3, 'Arjun', 103, 2),
(4, 'Apil', 104, 2);

-- Insert into teacher
INSERT INTO teacher (tid, tname, doj, salary) VALUES
(1, 'Prakash', '2022-01-15', 45000),
(2, 'Sunita', '2021-03-10', 50000),
(3, 'Mohan', '2020-07-20', 47000),
(4, 'Kumari', '2019-11-05', 52000);

-- Insert into employee
INSERT INTO employee (eid, ename, doe, salary) VALUES
(1, 'Ramesh', '2022-06-01', 30000),
(2, 'Anita', '2021-09-12', 32000),
(3, 'Bikash', '2020-02-28', 31000),
(4, 'Laxmi', '2019-12-15', 33000);

-- Insert into booklist
INSERT INTO booklist (isbn, name, pub) VALUES
(1001, 'Math Basics', 'NepalPub'),
(1002, 'Science Lab', 'KathmanduBooks'),
(1003, 'English Writing', 'HimalayaPub'),
(1004, 'Social Studies', 'EverestBooks');

-- Insert into book
INSERT INTO book (bid, bname, author, price) VALUES
(1, 'Math Basics', 'Prakash', 500),
(2, 'Science Lab', 'Sunita', 600),
(3, 'English Writing', 'Mohan', 550),
(4, 'Social Studies', 'Kumari', 450);

-- Insert into issue
INSERT INTO issue (iid, iname, doi) VALUES
(1, 'Math Basics', '2025-12-01'),
(2, 'Science Lab', '2025-12-05'),
(3, 'English Writing', '2025-12-10'),
(4, 'Social Studies', '2025-12-15');





