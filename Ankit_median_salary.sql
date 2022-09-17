--create table ankit_employee 
--(
--emp_id int,
--company varchar(10),
--salary int
--);

--insert into ankit_employee values (1,'A',2341)
--insert into ankit_employee values (2,'A',341)
--insert into ankit_employee values (3,'A',15)
--insert into ankit_employee values (4,'A',15314)
--insert into ankit_employee values (5,'A',451)
--insert into ankit_employee values (6,'A',513)
--insert into ankit_employee values (7,'B',15)
--insert into ankit_employee values (8,'B',13)
--insert into ankit_employee values (9,'B',1154)
--insert into ankit_employee values (10,'B',1345)
--insert into ankit_employee values (11,'B',1221)
--insert into ankit_employee values (12,'B',234)
--insert into ankit_employee values (13,'C',2345)
--insert into ankit_employee values (14,'C',2645)
--insert into ankit_employee values (15,'C',2645)
--insert into ankit_employee values (16,'C',2652)
--insert into ankit_employee values (17,'C',65);
---------------------------------------------------------------
SELECT * FROM ankit_employee;

;with cte_1 as 
(
select *, row_number() over (partition by company order by salary) res,
count(*) over (partition by company) res1
from ankit_employee
)
,cte_2 as 
(
select *,res1/2*1.0 as tot, (res1/2 + 1 * 1.0) as tot1 from cte_1
)
,cte_3 as 
(
select * from cte_2 where res  between tot and tot1
)
select company,avg(salary) average from cte_3
group by company