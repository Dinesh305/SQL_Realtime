;with cte_1 as 
(
SELECT * FROM [dinesh].[dbo].[entries]
)
,cte_2 as 
(
select name,count(*) cnt ,STRING_AGG(resources,',') within group(order by name ) res from cte_1
group by name
),
cte_3 as 
(
select name,floor,count(floor) floor_visited , rank() over (partition by name order by count(floor) desc) res1 from entries
group by name,floor
)
select a.name,a.cnt,a.res,b.floor from cte_2 a join  cte_3 b on a.name=b.name where res1 =1 