--create table Ankit_event_status
--(
--event_time varchar(10),
--status varchar(10)
--);
--insert into Ankit_event_status 
--values
--('10:01','on'),('10:02','on'),('10:03','on'),('10:04','off'),('10:07','on'),('10:08','on'),('10:09','off')
--,('10:11','on'),('10:12','off');
---------------------------------------------------------------------------------------------------------

--select * ,row_number() over (order by event_time) res from Ankit_event_status


;with cte_1 as 
(
select *,lag(status,1,status) over (order by event_time) prev from Ankit_event_status
)
,cte_2 as 
(
select event_time,prev, sum(case when status ='on' and prev ='off' then 1 else 0 end ) over(order by event_time )as res from cte_1
)
select  min(event_time) minimum, max(event_time) minimum,count(*) -1 cnt from cte_2
group by res