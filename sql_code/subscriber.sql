--CREATE TABLE subscriber (
-- sms_date date ,
-- sender varchar(20) ,
-- receiver varchar(20) ,
-- sms_no int
--);
---- insert some values
--INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Vibhor',10);
--INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Avinash',20);
--INSERT INTO subscriber VALUES ('2020-4-1', 'Avinash', 'Pawan',30);
--INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Avinash',20);
--INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Pawan',5);
--INSERT INTO subscriber VALUES ('2020-4-1', 'Pawan', 'Vibhor',8);
--INSERT INTO subscriber VALUES ('2020-4-1', 'Vibhor', 'Deepak',50);
-----------------------------------------------------------------------
--select * from subscriber
;with cte_1 as 
(
select sms_date,case when sender>receiver then sender else receiver end result1,
case when receiver>sender then sender else receiver end result2,
sms_no
from subscriber
)
select  sms_date,result1,result2,sum(sms_no) total_count from cte_1
group by sms_date,result1,result2
order by total_count