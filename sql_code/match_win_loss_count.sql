--create table it_junction_Match_result
--(
--id int,
--Team1 varchar(100),
--Team2 Varchar(100),
--Result Varchar(100)
--);

--insert into it_junction_Match_result Values (1,'India','Australia','India');
--insert into it_junction_Match_result Values (2,'India','England','England');
--insert into it_junction_Match_result Values (3,'SuthAfrica','India','India');
--insert into it_junction_Match_result Values (4,'Australia','England',NULL);
--insert into it_junction_Match_result Values (5,'England','SuthAfrica','SuthAfrica');
--insert into it_junction_Match_result Values (6,'Australia','India','Australia');

----------------------------------------------------------------------------

--select * from it_junction_Match_result

----------------------------------------------------------------------


;with cte_1 as
(
select team1  as Team , Result from it_junction_Match_result
union all select  Team2 as Team ,Result from it_junction_Match_result
)
  
select Team,count(*) match_played,
       sum(case when Result= Team then 1 else 0 end) Wins,
       sum(case when Result!= Team then 1 else 0 end) Loss,
       sum(case when Result is null then 1 else 0 end) Ties
       from cte_1
group by  Team
;