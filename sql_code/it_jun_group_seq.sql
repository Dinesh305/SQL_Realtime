--drop table if exists it_junction_Emp
--CREATE TABLE it_junction_Emp(
--[Group]  varchar(20),
--[Sequence]  int )

--INSERT INTO it_junction_Emp VALUES('A',1)
--INSERT INTO it_junction_Emp VALUES('A',2)
--INSERT INTO it_junction_Emp VALUES('A',3)
--INSERT INTO it_junction_Emp VALUES('A',5)
--INSERT INTO it_junction_Emp VALUES('A',6)
--INSERT INTO it_junction_Emp VALUES('A',8)
--INSERT INTO it_junction_Emp VALUES('A',9)
--INSERT INTO it_junction_Emp VALUES('B',11)
--INSERT INTO it_junction_Emp VALUES('C',1)
--INSERT INTO it_junction_Emp VALUES('C',2)
--INSERT INTO it_junction_Emp VALUES('C',3)


----------------------------------------------------------------

--select * from it_junction_Emp


;with cte_1 as 
(
select [group], sequence ,
sequence - row_number() over (partition by [group] order by [group]) result2
from it_junction_Emp
)
select [group], min(sequence) start_num,max(sequence) end_num from cte_1
group by [group],result2
order by [group]
