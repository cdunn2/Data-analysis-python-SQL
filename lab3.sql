-- Q 2.1
insert into student(s_email, s_name, major) 
values  ('s1@jmu.edu', 's1', 'IA'),
        ('s2@jmu.edu', 's2', 'IA'),
        ('s3@jmu.edu', 's3', 'ISAT'),
        ('s4@jmu.edu', 's4', 'ISAT') ;

select * from student;

-- Q 2.2
insert into professor(p_email, p_name, office) 
values  ('p1@jmu.edu', 'p1', 'o1'),
        ('p2@jmu.edu', 'p2', 'o2');

select * from professor;

-- Q 2.3
insert into course(c_number, c_name, room, p_email)
values  ('c1', 'postgresql', 'r1', 'p1@jmu.edu'),
        ('c2', 'mongodb', 'r2', 'p2@jmu.edu'),
        ('c3', 'twitter', 'r1', 'p1@jmu.edu');

select * from course;

-- Q 2.4
insert into enroll(s_email, c_number)
values  ('s1@jmu.edu', 'c1'),
 	('s2@jmu.edu', 'c1'),
 	('s3@jmu.edu', 'c1'),
 	('s4@jmu.edu', 'c2'),
 	('s2@jmu.edu', 'c3'),
	('s3@jmu.edu', 'c3');

select * from enroll;

-- Q 2.5
-- Added the new professor first because his email is incorperated into the course table,
-- so it needs to exist first.
insert into professor(p_email, p_name, office) 
values  ('p3@jmu.edu', 'p3', 'o3');

select * from professor;

insert into course(c_number, c_name, room, p_email)
values  ('c4', 'facebook', 'r1', 'p3@jmu.edu');

select * from course;

-- Q 2.6
-- We have to update the course table first, otherwise it will not work.
-- Update p3 to take over p1 courses.
update course
set p_email = 'p3@jmu.edu'
where c_number = 'c1';

update course
set p_email = 'p3@jmu.edu'
where c_number = 'c3';

select * from course;

-- Now delete the professor from the professor table
delete from professor
where p_email = 'p1@jmu.edu';

select * from professor;

-- Q 2.7
select * from enroll;

-- Q 2.8
select c_number, count(*) as num_student
from enroll
group by c_number

order by num_student desc
limit 1;

-- Q 2.9
create view p_name_c_name as

select 	professor.p_name,
		course.c_name,
		course.room
from professor

inner join course
on professor.p_email = course.p_email;

-- Q 2.10

