--create table ankit_students_highest
--(
--student_id int,
--student_name varchar(20)
--);
--insert into ankit_students_highest values
--(1,'Daniel'),(2,'Jade'),(3,'Stella'),(4,'Jonathan'),(5,'Will');

--create table ankit_exams_height
--(
--exam_id int,
--student_id int,
--score int);

--insert into ankit_exams_height values
--(10,1,70),(10,2,80),(10,3,90),(20,1,80),(30,1,70),(30,3,80),(30,4,90),(40,1,60)
--,(40,2,70),(40,4,80);

--select* from ankit_students_highest
--select * from ankit_exams_height

;with cte_1 as 
(
select exam_id,min(score) minimum,max(score) maximum from ankit_exams_height
group by exam_id
)
,cte_2 as 
(
select  a.*,b.student_id,b.score from cte_1 a join ankit_exams_height b on a.exam_id =b.exam_id
)
,cte_3 as
(
select student_id, max(case when score=minimum or score = maximum then 1 else 0 end )as mark from cte_2
group by student_id
)
select * from cte_3  where mark=0