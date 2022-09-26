--CREATE TABLE linkdlin_w_l_w_matches(
--match_date date,
--team_name varchar(20),
--team_opponent varchar(20),
--match_status varchar(10),
--);
--INSERT INTO linkdlin_w_l_w_matches VALUES('2004-02-13','New Zealand','South Africa','Lost'),
--('2004-02-17','New Zealand','South Africa','Won'),
--('2004-02-22','Sri Lanka','Australia','Won'),
--('2004-02-25','Sri Lanka','Australia','Lost'),
--('2004-02-25','New Zealand','South Africa','Won'),
--('2004-02-27','Sri Lanka','Australia','Lost'),
--('2004-02-29','Sri Lanka','Australia','Won'),
--('2004-02-29','New Zealand','South Africa','Won'),
--('2004-03-13','Pakistan','India','Lost'),
--('2004-07-08','New Zealand','West Indies','No Result'),
--('2004-07-21','Sri Lanka','Pakistan','Won');

----------------------------------------------------------------------------------------

--select * from linkdlin_w_l_w_matches

;with cte as(
select *,row_number() over (partition by Team_name order by Match_date desc) as rw 
from (
   select match_date ,team_name,case when match_status='lost' then 'L' when match_status ='no result' then 'N' else 'W' end as match_status
   from linkdlin_w_l_w_matches
	union all
   select match_Date,team_opponent as team_name,case when match_status='lost' then 'W'
   when match_status ='no result' then 'N' else 'L' end as match_status 
   from linkdlin_w_l_w_matches

   ) X ) 
   --select * from cte
select Team_name,reverse(string_agg(match_status,'-')) as last_3_match_status
from cte 
where rw <=3
group by team_name

