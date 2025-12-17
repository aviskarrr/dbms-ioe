create database aviskar;
use aviskar;
create table student(sid int, sname varchar(20), age int);
create table teacher(tid int, sname varchar(20), age int);

insert into student values(1,'biraj', 30), (2, 'happy', 33), (3, 'd', 32), (4, 'e', 500), (5, 'f', 322);


select * from student;
SELECT tid, sname 
from teacher;


insert into teacher values (1,'biraj', 30), (2, 'happy', 33), (3, 'd', 32), (4, 'e', 500), (5, 'f', 322);


drop table student;

