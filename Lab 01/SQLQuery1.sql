create database aviskar;
use aviskar;
create table student(sid int, sname varchar(20), age int);
create table teacher(tid int, sname varchar(20), age int);

insert into student values(1,'biraj', 30), (2, 'happy', 33), (3, 'd', 32), (4, 'e', 500), (5, 'f', 322);
EXEC sp_help student;


select * from student;
SELECT * 
from teacher;


insert into teacher values (1,'biraj', 30), (2, 'happy', 33), (3, 'd', 32), (4, 'e', 500), (5, 'f', 322);


drop table student;


ALTER TABLE	student DROP COLUMN sid;

ALTER TABLE	student ADD marks float;


SELECT sname, age into info_student from student;

delete from info_student where  age = 30; -- delete from table


select * from info_student;

update student set marks = 80.55 where sid = 2; -- for single update

update student set marks = 75.55 ; 
update student set marks = 40.55 where sid in (3,4,5) ; -- for multi update

truncate table student;
select * from student;




