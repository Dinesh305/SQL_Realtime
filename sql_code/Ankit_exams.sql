--create table Ankit_exams (student_id int, subject varchar(20), marks int);
--delete from Ankit_exams;
--insert into Ankit_exams values (1,'Chemistry',91),(1,'Physics',91)
--,(2,'Chemistry',80),(2,'Physics',90)
--,(3,'Chemistry',80)
--,(4,'Chemistry',71),(4,'Physics',54);
---------------------------------------------------------------------
--select * from Ankit_exams

select student_id from ankit_exams 
where subject in ('chemistry','Physics')
group by student_id
having count( distinct subject) > 1 and count(distinct marks)=1
