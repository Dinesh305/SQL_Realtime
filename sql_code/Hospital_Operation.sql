--create table business_city (
--business_date date,
--city_id int
--);
--delete from business_city;
--insert into business_city
--values(cast('2020-01-02' as date),3),(cast('2020-07-01' as date),7),(cast('2021-01-01' as date),3),(cast('2021-02-03' as date),19)
--,(cast('2022-12-01' as date),3),(cast('2022-12-15' as date),3),(cast('2022-02-28' as date),12);
--select * from business_city 
----------------------------------------------------------------------------------------------------
;with cte AS
(
select DATEPART(year,business_date) year,city_id, row_number() over (partition by city_id order by business_date) result from business_city
)
select  year, sum(result) cnt from cte where result =1
group by year