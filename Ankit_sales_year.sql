--create table Ankit_sales (
--product_id int,
--period_start date,
--period_end date,
--average_daily_sales int
--);

--insert into Ankit_sales values(1,'2019-01-25','2019-02-28',100),(2,'2018-12-01','2020-01-01',10),(3,'2019-12-01','2020-01-31',1);
---------------------------------------------------------------------------------------------------------------------------------
--select * from Ankit_sales



;with cte_1 as 
(
select min(period_start) as start_date,max(period_end) as end_date from Ankit_sales
union all 
select DATEADD(DAY,1,start_date) start_date , end_date from cte_1
where start_date< end_date
)
select year(start_date) as start_date,product_id,sum(average_daily_sales) from cte_1 
join Ankit_sales on start_date between period_start and period_end 
group by year(start_date),product_id
option (maxrecursion 1000)