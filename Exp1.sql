CREATE DATABASE Exp1;
use Exp1;

create table students(
id int primary key,
name varchar(50),
age int,
cgpa float
);

insert into students(id,name,age,cgpa)
values
(1,'Mim',22,3.56),
(2,'Anto',22,3.89),
(3,'Umme',23,3.85),
(4,'Habiba',24,3.88);

select * from students;

update students
set age=20 where id=2;

select* from students;

delete from students
where id=4;

alter table students
add batch int ;

describe students;

alter table students 
modify batch varchar(50);

describe students;

alter table students 
drop column batch;

select* from students;

 select id, name from students;
 select * from students 
 where id=2;
 
 select * from students where cgpa>3.80;
 
 select * from students where age>21 and cgpa>3.80;
 
 select * from students where name like 'A%';
 
 select * from students where name like '%a%';
 
 insert into students(id,name,age,cgpa)
 values
 (4,'umme',25,3.82),
 (5,'Ratri',23,3.81),
 (6,'Shakha',27,3.41),
 (7,'Vabna',24,3.53),
 (8,'Liya',26,3.91);
 
 select * from students
 order by cgpa ASC;
 
 select age, count(*) as total_students
 from students
 group by age;

update students
set age=20
where id=4;

select age, count(*) as total_students
 from students
 group by age
 having count(*) >=2;
 
 create view good_students as
 select id,name,age,cgpa 
 from students
 where cgpa>=3.80;
 
 select * from good_students;
 
 create index idx_name
 on students (name);
 
 show index from students;
 
 select * from students 
 where name='Anto';
 
  explain select * from students 
 where name='Anto';
 
 drop index idx_name on students;
 
 DELIMITER //
 create procedure show_all_students()
 begin
 select * from students;
 end //
 DELIMITER ;
  call show_all_students();
 
 DELIMITER //
CREATE PROCEDURE show_by_cgpa(IN min_cgpa FLOAT)
BEGIN
    SELECT * FROM students
    WHERE cgpa >= min_cgpa;
END //
DELIMITER ;
CALL show_by_cgpa(3.85);

SHOW PROCEDURE STATUS WHERE db = 'Exp1';
DROP PROCEDURE show_by_cgpa;

-- cgpa koto gulo
select count(cgpa) as total_cgpa
from students;

-- সবচেয়ে বেশি cgpa কত
SELECT MAX(cgpa) AS highest_cgpa
FROM students;

-- সবচেয়ে কম cgpa কত
SELECT MIN(cgpa) AS lowest_cgpa
FROM students;

-- সব student এর cgpa এর গড়
SELECT round(AVG(cgpa),2) AS average_cgpa
FROM students;

-- সব student এর cgpa এর যোগফল
SELECT SUM(cgpa) AS total_cgpa
FROM students;

SELECT age, AVG(cgpa) AS avg_cgpa     --  age group kore pore avg cgpa ber kore
FROM students
GROUP BY age;