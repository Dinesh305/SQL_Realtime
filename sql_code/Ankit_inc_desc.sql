--CREATE TABLE anlit_students(
-- [studentid] [int] NULL,
-- [studentname] [nvarchar](255) NULL,
-- [subject] [nvarchar](255) NULL,
-- [marks] [int] NULL,
-- [testid] [int] NULL,
-- [testdate] [date] NULL
--)
--data:
--insert into anlit_students values (2,'Max Ruin','Subject1',63,1,'2022-01-02');
--insert into anlit_students values (3,'Arnold','Subject1',95,1,'2022-01-02');
--insert into anlit_students values (4,'Krish Star','Subject1',61,1,'2022-01-02');
--insert into anlit_students values (5,'John Mike','Subject1',91,1,'2022-01-02');
--insert into anlit_students values (4,'Krish Star','Subject2',71,1,'2022-01-02');
--insert into anlit_students values (3,'Arnold','Subject2',32,1,'2022-01-02');
--insert into anlit_students values (5,'John Mike','Subject2',61,2,'2022-11-02');
--insert into anlit_students values (1,'John Deo','Subject2',60,1,'2022-01-02');
--insert into anlit_students values (2,'Max Ruin','Subject2',84,1,'2022-01-02');
--insert into anlit_students values (2,'Max Ruin','Subject3',29,3,'2022-01-03');
--insert into anlit_students values (5,'John Mike','Subject3',98,2,'2022-11-02');
-----------------------------------------------------------------------------------
;with cte_1 as 
(
select subject,avg(marks) average from anlit_students
group by subject
)
select * from cte_1 a join anlit_students b on a.subject=b.subject
where a.average < b.marks

;with cte_1 as 
(
select *, avg(marks) over (partition by subject order by subject) average from anlit_students
)
select * from cte_1 where marks > average 
------------------------------------------------------------------------
select * from anlit_students

SELECT COUNT(DISTINCT studentid)*1.0*100/(SELECT COUNT(DISTINCT studentid) FROM anlit_students)
FROM anlit_students
WHERE marks>90;

-------------------------------------------------------------------------------

;with cte_1 as 
(
select *, ROW_NUMBER() OVER (PARTITION BY subject order by marks desc) res,
ROW_NUMBER() OVER (PARTITION BY subject order by marks ) res1
from anlit_students 
)
select subject ,max(case when res = 2 then marks end )second_highest,
max(case when res1 = 2 then marks end)second_lowest 
from cte_1 where res=2 or res1 =2
group by subject

------------------------------------------------------------------------
--select * from anlit_studentswith 

select *, case when marks < prev_marks then 'inc' else 'dec' end stay from 

(

SELECT *,LAG(marks)OVER(PARTITION BY studentname ORDER BY testdate) AS prev_marks
FROM anlit_students) A
order by testid,studentid