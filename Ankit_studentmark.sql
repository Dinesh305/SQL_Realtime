--drop table if exists Ankit_students;
--CREATE TABLE Ankit_students(
-- [studentid] [int] NULL,
-- [studentname] [nvarchar](255) NULL,
-- [subject] [nvarchar](255) NULL,
-- [marks] [int] NULL,
-- [testid] [int] NULL,
-- [testdate] [date] NULL
--)
--data:
--insert into Ankit_students values (2,'Max Ruin','Subject1',63,1,'2022-01-02');
--insert into Ankit_students values (3,'Arnold','Subject1',95,1,'2022-01-02');
--insert into Ankit_students values (4,'Krish Star','Subject1',61,1,'2022-01-02');
--insert into Ankit_students values (5,'John Mike','Subject1',91,1,'2022-01-02');
--insert into Ankit_students values (4,'Krish Star','Subject2',71,1,'2022-01-02');
--insert into Ankit_students values (3,'Arnold','Subject2',32,1,'2022-01-02');
--insert into Ankit_students values (5,'John Mike','Subject2',61,2,'2022-11-02');
--insert into Ankit_students values (1,'John Deo','Subject2',60,1,'2022-01-02');
--insert into Ankit_students values (2,'Max Ruin','Subject2',84,1,'2022-01-02');
--insert into Ankit_students values (2,'Max Ruin','Subject3',29,3,'2022-01-03');
--insert into Ankit_students values (5,'John Mike','Subject3',98,2,'2022-11-02');
-------------------------------------------------


--;with cte_1 as 
--(
--select * ,avg(marks)  over(partition by subject order by subject) average from ankit_students a
----join ankit_students b on a.subject=b.subject
--)
--select * from cte_1 where marks >average

-------------------------------------------------------------

--select count(distinct case when marks >90 then studentid else null end) *1.0*100/ 
--count(distinct studentid) as cnt1 from ankit_students

-----------------------------------------------------------------

----select * from ankit_students
--;with cte_1 as 
--(
--select *, rank() over ( partition by subject order by marks desc) highest,
--rank() over ( partition by subject order by marks asc) lowest
--from ankit_students 
--)
--select subject,sum(case when highest = 2 then marks end )as highest,
--sum(case when lowest = 2 then marks end ) as lowest from cte_1 where highest = 2 or lowest = 2
--group by subject
--order by subject

----------------------------------------------------------------------

----select * from ankit_students 

--;with cte_1 as 
--(
--select *, lag(marks) over (partition by studentid order by testdate ,subject) prev_mark
----lead(marks) over (partition by subject order by marks) nextyear_mark
--from ankit_students
--)
--select *, case when marks > prev_mark then 'inc' else 'desc' end as res from cte_1

----------------------------------------------------