--drop table if exists icc_world_cup;
--create table icc_world_cup
--(
--Team_1 Varchar(20),
--Team_2 Varchar(20),
--Winner Varchar(20)
--);
--INSERT INTO icc_world_cup values('India','SL','India');
--INSERT INTO icc_world_cup values('SL','Aus','Aus');
--INSERT INTO icc_world_cup values('SA','Eng','Eng');
--INSERT INTO icc_world_cup values('Eng','NZ','NZ');
--INSERT INTO icc_world_cup values('Aus','India','India');
------------------------------------------------------------------------------
--select * from icc_world_cup

;with cte_1 as 
(
select winner,team_1 team from icc_world_cup
union all
select winner,team_2 team from icc_world_cup
)
select team,count(*) match_played , sum(case when winner = team then 1 else 0 end) as match_winner,
sum(case when winner <> team then 1 else 0 end) as match_loss
from cte_1
group by team
order by match_winner desc