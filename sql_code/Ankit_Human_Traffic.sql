--create table Ankit_stadium (
--id int,
--visit_date date,
--no_of_people int
--);

--insert into Ankit_stadium
--values (1,'2017-07-01',10)
--,(2,'2017-07-02',109)
--,(3,'2017-07-03',150)
--,(4,'2017-07-04',99)
--,(5,'2017-07-05',145)
--,(6,'2017-07-06',1455)
--,(7,'2017-07-07',199)
--,(8,'2017-07-08',188);
--------------------------------------------------------

;with cte_1 as 
(
select *,
row_number() over (order by id) res,id - ROW_NUMBER() over (order by id ) res1
from Ankit_stadium where no_of_people >100
)
select * from cte_1 where res1 in (
select res1 from cte_1
group by res1
having count(res) >3 
)