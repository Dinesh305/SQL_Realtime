select * from event_status;


;with cte_1 as 
(
select *, lag(status,1,status) over (order by event_time) pre_status from event_status
)
,cte_2 as 
(
select *,
row_number() over (order by event_time) - 
sum(case when status ='on' and pre_status='off' then 0 else 1 end) over (order by event_time) res
from cte_1
)
select min(event_time) log_in, max(event_time) log_out ,count(res) -1 cnt from cte_2
group by res

--------------------------------------------

;with cte_1 as 
(
select *, lag(status,1,status) over (order by event_time) pre_status from event_status
)
,cte_2 as 
(
select *,sum(case when status ='on' and pre_status ='off' then 1 else 0 end ) over (order by event_time)  cnt from cte_1
)
select min(event_time) log_in, max(event_time) log_out ,count(cnt)-1 count from cte_2 
group by cnt