--CREATE TABLE Ankit_subscriber (
-- sms_date date ,
-- sender varchar(20) ,
-- receiver varchar(20) ,
-- sms_no int
--);
---- insert some values
--INSERT INTO Ankit_subscriber VALUES ('2020-4-1', 'Avinash', 'Vibhor',10);
--INSERT INTO Ankit_subscriber VALUES ('2020-4-1', 'Vibhor', 'Avinash',20);
--INSERT INTO Ankit_subscriber VALUES ('2020-4-1', 'Avinash', 'Pawan',30);
--INSERT INTO Ankit_subscriber VALUES ('2020-4-1', 'Pawan', 'Avinash',20);
--INSERT INTO Ankit_subscriber VALUES ('2020-4-1', 'Vibhor', 'Pawan',5);
--INSERT INTO Ankit_subscriber VALUES ('2020-4-1', 'Pawan', 'Vibhor',8);
--INSERT INTO Ankit_subscriber VALUES ('2020-4-1', 'Vibhor', 'Deepak',50);

------------------------------------------------------------------------------------------

select * from Ankit_subscriber;

;with cte_1 as 
(
select sms_date, (case when sender < receiver then sender else receiver  end) as p1,
(case when sender > receiver then sender else receiver end) as p2,sms_no from ankit_subscriber
)
select sms_date,p1,p2,sum(sms_no) total from cte_1
group by sms_date,p1,p2