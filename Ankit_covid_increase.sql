--create table Ankit_covid(city varchar(50),days date,cases int);
--delete from Ankit_covid;
--insert into Ankit_covid values('DELHI','2022-01-01',100);
--insert into Ankit_covid values('DELHI','2022-01-02',200);
--insert into Ankit_covid values('DELHI','2022-01-03',300);

--insert into Ankit_covid values('MUMBAI','2022-01-01',100);
--insert into Ankit_covid values('MUMBAI','2022-01-02',100);
--insert into Ankit_covid values('MUMBAI','2022-01-03',300);

--insert into Ankit_covid values('CHENNAI','2022-01-01',100);
--insert into Ankit_covid values('CHENNAI','2022-01-02',200);
--insert into Ankit_covid values('CHENNAI','2022-01-03',150);

--insert into Ankit_covid values('BANGALORE','2022-01-01',100);
--insert into Ankit_covid values('BANGALORE','2022-01-02',300);
--insert into Ankit_covid values('BANGALORE','2022-01-03',200);
--insert into Ankit_covid values('BANGALORE','2022-01-04',400);

--select * from Ankit_covid

;with cte_1 as 
(
select *, rank() over (partition by city order by days)  Date_Rank_1,
rank() over (partition by city order by cases)  Case_Rank_2,
rank() over (partition by city order by days)  - rank() over (partition by city order by cases)  Case_Rank_3
from Ankit_covid
--order by city, days
)
select city   from cte_1 where Case_Rank_3 =0 
group by city 
having count(Case_Rank_3) >=3