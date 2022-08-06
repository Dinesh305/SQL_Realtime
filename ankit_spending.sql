--create table Ankit_spending 
--(
--user_id int,
--spend_date date,
--platform varchar(10),
--amount int
--);

--insert into Ankit_spending values(1,'2019-07-01','mobile',100),(1,'2019-07-01','desktop',100),(2,'2019-07-01','mobile',100)
--,(2,'2019-07-02','mobile',100),(3,'2019-07-01','desktop',100),(3,'2019-07-02','desktop',100);


---------------------------------------------------------------------------------------

--Select * from ankit_spending


;with cte_1 
as
(
select distinct spend_date , user_id,max(platform) plt ,sum(amount) total from ankit_spending
group by  spend_date,user_id
having count (distinct PLATFORM) =1
union all 
select distinct spend_date , user_id, 'both' as plt  ,sum(amount) total from ankit_spending
group by  spend_date,user_id
having count (distinct PLATFORM) =2
union all
select distinct spend_date,Null as user_id , 'both' as plt,0 as total from ankit_spending
)
select distinct spend_date,count(plt) platform ,max(plt) plat,sum(total) total from cte_1 
group by spend_date,plt