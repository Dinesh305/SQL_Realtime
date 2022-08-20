--drop table if exists Ankit_players_location;
--create table Ankit_players_location
--(
--name varchar(20),
--city varchar(20)
--);
--insert into Ankit_players_location
--values ('Sachin','Mumbai'),('Virat','Delhi') , ('Rahul','Bangalore'),('Rohit','Mumbai'),('Mayank','Bangalore');

--select * from Ankit_players_location


select max(case when city ='delhi' then name end) as delhi,
max(case when city ='mumbai' then name end) as mumbai,
min(case when city ='Bangalore' then name end) as banglore from
(
select *, row_number() over (partition by city order by name) res from Ankit_players_location
) A
group by res