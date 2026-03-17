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
INSERT INTO student (sid, sname, batch) VALUES
(1, 'Suresh', 81),
(2, 'Rita', 78),
(3, 'Arjun', 80),
(4, 'Apil', 79);

-- Insert into teacher
INSERT INTO teacher (tid, tname, doj, salary) VALUES
(1, 'Sudan', '2022-01-15', 45000),
(2, 'Mohan', '2021-03-10', 50000),
(3, 'Miraj', '2020-07-20', 47000),
(4, 'Prachanda', '2019-11-05', 52000);

-- Insert into employee
INSERT INTO employee (eid, ename, doe, salary) VALUES
(1, 'Ravi', '2022-06-01', 30000),
(2, 'Swarnim', '2021-09-12', 32000),
(3, 'Raj', '2020-02-28', 31000);
insert into employee(eid, ename, salary) values (1,'ram', 2500)

-- if you want to set default value then:

-- Insert into booklist
INSERT INTO booklist (isbn, name, pub) VALUES
(1001, 'Maths', 'NepalPub'),
(1002, 'Science Lab', 'KathmanduBooks'),
(1003, 'English Writing', 'HimalayaPub'),
(1004, 'Social Studies', 'EverestBooks');

-- Insert into book
INSERT INTO book (bid, bname, author, price) VALUES
(1001, 'Maths', 'Prakash', 500),
(1002, 'Science Lab', 'Sunita', 600),
(1003, 'English Writing', 'Mohan', 4500),
(1004, 'Social Studies', 'Kumari', 450);

-- Insert into issue
INSERT INTO issue (iid, iname, doi) VALUES
(1001, 'Maths', '2025-12-01'),
(1002, 'Science Lab', '2025-12-05'),
(1003, 'English Writing', '2025-12-10'),
(1004, 'Social Studies', '2025-12-15');


select * from student;
select * from teacher;
select * from booklist;
select * from employee;
select * from teacher;
select * from book;
select * from issue;


select eid,ename from employee where salary<=2500;
select * from book where price between 1000 and 3000;

DROP table book;
delete from employee where ename = 'ram';


-----------------lab03------------------------
--is lab 2 contd...


--Task 11: display all the records from book relation whose  publication name starts with 'e' eg: "ekta"
select * from booklist where lower(RTRIM(pub)) like 'E%';
-- we can also do this like s____ if we know how many words are there

--Task 12: display all the records from book relation whose  publication name ends with 'a' eg: "ekta"
select * from book where lower(RTRIM(bname)) like '%s';

--Task 13: display sid name from student table whose name consists of 5 characcters
select sid,sname from student where len(sname)=4;
--Taks 14: Task 14: Display all record from employee table where name starts with p and salary greater than 25000
select * from employee where ename like 'r%' and salary>500;

-- task 15: Task 15: display all records from books table where either bid lies in the range 2003 to 2004 or price range in 350 to 450
SELECT *
FROM book
WHERE bid BETWEEN 1001 AND 1002
   OR price BETWEEN 300 AND 600;


--Task 16: display bid number and bookname where records must not contain bid no 2003
select bid, bname from book where bid != 2;


--LAB 03-------LAB 03--------LAB 03-------LAB 03-----------LAB 03-----------LAB 03--------------LAB 03---------LAB 03---------------LAB 03-----LAB 03---------

-- Task 1: find all the book  name, publication name and author name where publication name is 'Ekta'
select book.bname, booklist.isbn, book.author from booklist,book where book.bid=booklist.isbn and booklist.pub = 'NepalPub';


-- use of placeholder
--select b.bname, ..... from book.b;;;;;;;;;;;;here we can use b instead of book; as a placeholder
-- Task 2: Find the teachers name and faculty who issued book on jan1, 2010

select book.author, issue.iname, issue.doi from book,issue where issue.iid=book.bid and issue.doi = '2025-12-01';


--task 3 : Task 3: update a few records in teacher and employee teacher to make tname= ename
		--find the employees name whose salary is greater than 30000 and doj is "2021-09-12"
UPDATE employee
SET ename = 'Mohan', salary = 50000
WHERE eid = 2;

select employee.ename from employee, teacher where ename = tname AND employee.salary > 30000 AND doe = '2021-09-12';

--task 4: add attribute bid on issue relation
ALTER TABLE issue ADD bid int;

-- task 5: insert the data in bid column of issues

update issue set bid = 1 where iid = 1001;
 select * from issue;


 --task 6: inclrease employee and teacher sal by 10%
 
update teacher set salary = 1.1*salary
update employee set salary = 1.1*salary


--task 7:increase the salary of all employees by 20% whose salary is less than 50000.

update employee set salary = 1.2*salary where salary < 50000;
update teacher set salary = 1.2*salary where salary < 50000;

-- task 8:update the bookname 'Maths' with 'Database'
UPDATE book
SET bname  = 'Database'
WHERE bname  = 'Maths';

select * from book;

-- task 9 : provide 5% increment to all salaries whose salary is greater than 20k and 20% increment in rest of slaaries.
UPDATE employee
SET salary = CASE
    WHEN salary > 20000 THEN salary * 1.05
    ELSE salary * 1.20
END;


--task 10: delete the records from employee table whose eid is 11.

select * from employee;

delete from employee where eid =1 ;



-- task 11: use sub query to find all teachers name and salary whose data of employee is 2022-01-15

select * from teacher;
select * from employee;
 update teacher set doj = '2021-09-12' where tid = 2;

 -- we did this because for this to run; we need to have a same record in both employee and teacher table so we made our target as mohan.
SELECT t.tname, t.salary
FROM teacher t
WHERE t.tid = (
    SELECT e.eid
    FROM employee e
    WHERE e.doe = '2021-09-12'
);



-- task 12: use sub query to find all book names and author name whose publication is ekta

select * from book;
select * from booklist;

SELECT b.bname, b.author
FROM book b
WHERE b.bid in (
    SELECT bl.isbn
    FROM booklist bl
    WHERE bl.pub = 'NepalPub'
);


select * from student;
select * from teacher;
select * from booklist;
select * from employee;
select * from teacher;
select * from book;
select * from issue;

----lab04---------lab04---------lab04---------lab04---------lab04---------lab04---------lab04-----

-- Task 1: Sort the employee records in descending order.


SELECT *
FROM employee
ORDER BY salary DESC;



-- Task 2: Sort name and publication name in ascending order.
select * from booklist;
SELECT name, pub
FROM booklist
ORDER BY name ASC, pub ASC;


select ename from employee order by ename asc;

--Task 3: Display atop three records from teachers relation
SELECT TOP 3 *
FROM teacher;


-- Task 4: Display the sum of salaries all employees.
SELECT SUM(salary) as tot
FROM employee;



---lab05....------

--Task 5: Display min salary of employee
select MIN(salary) as min_sal from employee;
;


-- Task 6: Display avg price of book written by same author

SELECT author, AVG(price) AS avg_price
FROM book
GROUP BY author;



-- Task 7: Display publication name and number of books published by it from book list relation publication wise.

SELECT pub, COUNT(*) AS total_books
FROM booklist
GROUP BY pub;


-- Task 8: Display the bid and bname of books whose price is greater than avg price of books.
SELECT bid, bname
FROM book
WHERE price > (
    SELECT AVG(price)
    FROM book
);




select bid, bname from book where price > (select avg(price) from book)

-- Task 9: Find the bid, bname and author in ascending order where author name is started by 's'
SELECT bid, bname, author
FROM book
WHERE author LIKE 'S%'
ORDER BY author ASC;


select bid, bname, author from book where author like 's%' order by author asc 


---lab06
select * from teacher;
select * from book;

-- 10. Find the teachers name and book taken by him. The teacher’s salary who takes the book
--should be the maximum salary.

SELECT t.tname, b.bname
FROM teacher t
JOIN book b ON b.author = t.tname
WHERE t.salary = (SELECT MAX(salary) FROM teacher);

select * from book join teacher on book.author = teacher.tname;
-- 11. Find the authors name who have written more than one book.
insert into book (bid, bname, author, price) values (1005,'AI', 'Mohan', 5000);

WHERE bid = 1005;
select author from book group by author having COUNT(*) > 1;
 select * from book


 --lab05 questions
 --1 Perform join operation on teacher and employee table and display the Ename , Faculty and salary
 select * from employee join teacher on employee.eid = teacher.tid;
select ename, employee.salary from employee join teacher on employee.eid= teacher.tid;


--2. Perform left join on table book list and book table.
select * from booklist left join book on booklist.isbn = book.bid;

select * from booklist
select * from book
-- 3 Perform right join on booklist and book table
select * from booklist right join book on booklist.isbn = book.bid;


-- 4. Perform Full join on book and booklist table
select * from student
select * from issue

select * from booklist full JOIN book on booklist.isbn = book.bid;

--5. Display those employees name and salary whose name starts with ‘s’ and whose name consist ‘a’ as sub string
SELECT ename, salary FROM employee WHERE ename LIKE 'M%' AND ename LIKE '%a%';


-- 6. Display name of the employee who is also a teacher.
select ename from employee full join teacher on teacher.tid = employee.eid where teacher.tname = employee.ename;

-- 7. Display all employees name except the name who are teachers
select ename from employee full join teacher on teacher.tid  = employee.eid where teacher.tname != employee.ename;

select ename from employee where ename not in  (select tname from teacher);
select * from employee
select * from teacher


-- 8. Create a view Employee-view which consist of eid, ename , salary as attributes.
create view teast as 
select eid, ename, salary from employee;

select * from teast

-- 9. Insert a new record in recently created view. And also display the contents of primary table.
INSERT INTO teast (eid, ename, salary)
VALUES (3, 'Ramesh', 45000);

select * from employee;

-- 10. selete the information from view where salary are less than 29000.
DELETE FROM teast
WHERE salary = 45000;


-- procedure
CREATE PROCEDURE okk
AS
BEGIN
    SELECT * FROM book;
END
GO


EXEC okk;

drop procedure okk;



-- Create first table
CREATE TABLE tab1 (
    id INT,
    name VARCHAR(20),
    dept VARCHAR(20)
);

-- Create second table
CREATE TABLE tab2 (
    id INT,
    dept_name VARCHAR(20)
);

-- Insert sample data into tab1
INSERT INTO tab1 (id, name, dept) VALUES
(1, 'Alice', 'HR'),
(2, 'Bob', 'Sales'),
(3, 'Carol', 'IT');

-- Insert sample data into tab2
INSERT INTO tab2 (id, dept_name) VALUES
(1, 'HR'),
(2, 'Sales'),
(4, 'Finance');

-- LEFT JOIN visualization
SELECT *
FROM tab1
LEFT JOIN tab2
ON tab1.dept = tab2.dept_name;

-- RIGHT JOIN visualization
SELECT *
FROM tab1
RIGHT JOIN tab2
ON tab1.dept = tab2.dept_name;


select * from tab1 t1 join tab2 t2 on



select * from teacher;

select MAX(salary) from teacher where salary < (
select MAX(salary) from teacher
);


select * from book;


select * from book where price > 
(select AVG(price) from book
);


select * from book;


select author from book group by author having count(*)>1

select ename from employee where ename in (
select tname from teacher
)


create view vie1 as 
select * from tab1


select * from vie1


create procedure p1 as
begin 
select * from vie1
end
go 

exec p1


select MAX(salary) from employee where salary < 
(select MAX(salary) from employee);


select salary, ename  from employee where salary = (select max(salary) from employee)



select * from employee where salary> any(
select salary from teacher
)