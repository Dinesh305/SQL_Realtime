--create table Ankit_UserActivity
--(
--username      varchar(20) ,
--activity      varchar(20),
--startDate     Date   ,
--endDate      Date
--);

--insert into Ankit_UserActivity values 
--('Alice','Travel','2020-02-12','2020-02-20')
--,('Alice','Dancing','2020-02-21','2020-02-23')
--,('Alice','Travel','2020-02-24','2020-02-28')
--,('Bob','Travel','2020-02-11','2020-02-18');

--------------------------------------------------------------------------------------------

--select * from Ankit_UserActivity

--;with cte as (
--select *,row_number() over(partition by username order by startdate desc) rn,
--count(*) over(partition by username) cnt
--from Ankit_UserActivity )
--select *
--from cte
--where rn = 2  or cnt = 1