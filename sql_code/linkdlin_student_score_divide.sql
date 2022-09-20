--create table linkdlin_student_marks(name varchar(20), score int, value int);
--insert into linkdlin_student_marks values('ajith',100,2),('bala',90,3);


select * from linkdlin_student_marks


;with cte_1 as 
(
select name,score,(score/value) val, 1 as count,value from linkdlin_student_marks

union all

select name,score, val,count+1 as count,value from cte_1
where [value]>count)
select * from cte_1


----------------------------------
