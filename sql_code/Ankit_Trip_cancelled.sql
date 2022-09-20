--Create table  Trips (id int, client_id int, driver_id int, city_id int, status varchar(50), request_at varchar(50));
--Create table Users (users_id int, banned varchar(50), role varchar(50));
--Truncate table Trips;
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('1', '1', '10', '1', 'completed', '2013-10-01');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('2', '2', '11', '1', 'cancelled_by_driver', '2013-10-01');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('3', '3', '12', '6', 'completed', '2013-10-01');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('4', '4', '13', '6', 'cancelled_by_client', '2013-10-01');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('5', '1', '10', '1', 'completed', '2013-10-02');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('6', '2', '11', '6', 'completed', '2013-10-02');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('7', '3', '12', '6', 'completed', '2013-10-02');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('8', '2', '12', '12', 'completed', '2013-10-03');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('9', '3', '10', '12', 'completed', '2013-10-03');
--insert into Trips (id, client_id, driver_id, city_id, status, request_at) values ('10', '4', '13', '12', 'cancelled_by_driver', '2013-10-03');
--Truncate table Users;
--insert into Users (users_id, banned, role) values ('1', 'No', 'client');
--insert into Users (users_id, banned, role) values ('2', 'Yes', 'client');
--insert into Users (users_id, banned, role) values ('3', 'No', 'client');
--insert into Users (users_id, banned, role) values ('4', 'No', 'client');
--insert into Users (users_id, banned, role) values ('10', 'No', 'driver');
--insert into Users (users_id, banned, role) values ('11', 'No', 'driver');
--insert into Users (users_id, banned, role) values ('12', 'No', 'driver');
--insert into Users (users_id, banned, role) values ('13', 'No', 'driver');

--------------------------------------------------------------------------------------------------------------------------------------------
--select  * from users

--select * from trips

;with cte_1 as 
(
select b.* ,a.banned,a.users_id from users a join trips b on a.users_id =b.client_id 
--join trips c on
--c.driver_id=a.users_id
where banned = 'no'
)
,cte_2 as 
(
select request_at, sum(case when status in ('cancelled_by_client' , 'cancelled_by_driver') then 1 else 0 end) as cancelld_trip 
--,case when status ='completed' then 1 else 0 end/count(case when status ='completed' then 1 else 0 end) as tot
,count(*) total_trips
from cte_1
group by request_at
)
select *
--,100* (cancelld_trip/total_trips * 1.0) res
,1.0*(cancelld_trip *(100/total_trips)) as cancel_percentage
from cte_2