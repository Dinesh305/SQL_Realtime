--create table Ankit_movie(
--seat varchar(50),occupancy int
--);
--insert into Ankit_movie values('a1',1),('a2',1),('a3',0),('a4',0),('a5',0),('a6',0),('a7',1),('a8',1),('a9',0),('a10',0),
--('b1',0),('b2',0),('b3',0),('b4',1),('b5',1),('b6',1),('b7',1),('b8',0),('b9',0),('b10',0),
--('c1',0),('c2',1),('c3',0),('c4',1),('c5',1),('c6',0),('c7',1),('c8',0),('c9',0),('c10',1);

----------------------------------------------------------------------------------------------

--select * from ankit_movie
--------------------------------------------------------------------------------

;with cte_1 
as
(
select *,SUBSTRING(seat,1,1) row_num, substring(seat,2,2) as row_id from ankit_movie where occupancy =0
)
,cte_2 as 
(
select *, row_id - row_number() over (partition by row_num order by row_id) A from cte_1
)
,cte_3 as 
(
select *, count(*) over (partition by row_num order by A) cnt from cte_2
)
select * from cte_3 where cnt = 4