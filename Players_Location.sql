--select * from players_location;


;with cte_1 as 
(
select *, row_number() over (partition by city order by name) resu from players_location
)
select resu,min(case when city = 'Bangalore' then name end ) Banglore,
min(case when city = 'Delhi' then name end ) delhi,
min(case when city = 'Mumbai' then name end ) Mumbai
from cte_1
group by resu