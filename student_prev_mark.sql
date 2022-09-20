--CREATE TABLE it_jun_Student(
--[Student_Name]  varchar(30),
--[Total_Marks]  int ,
--[Year]  int)

--INSERT INTO it_jun_Student VALUES('Rahul',90,2010)
--INSERT INTO it_jun_Student VALUES('Sanjay',80,2010)
--INSERT INTO it_jun_Student VALUES('Mohan',70,2010)
--INSERT INTO it_jun_Student VALUES('Rahul',90,2011)
--INSERT INTO it_jun_Student VALUES('Sanjay',85,2011)
--INSERT INTO it_jun_Student VALUES('Mohan',65,2011)
--INSERT INTO it_jun_Student VALUES('Rahul',80,2012)
--INSERT INTO it_jun_Student VALUES('Sanjay',80,2012)
--INSERT INTO it_jun_Student VALUES('Mohan',90,2012)

--------------------------------------------------------

--select * from it_jun_Student

;with cte_1 as
(
select *, lag([total_marks]) over (partition by student_name order by year) pre_mark from it_jun_Student
)
select * from cte_1 where total_marks>=pre_mark