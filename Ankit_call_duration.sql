--create table Ankit_call_details  (
--call_type varchar(10),
--call_number varchar(12),
--call_duration int
--);

--insert into Ankit_call_details
--values ('OUT','181868',13),('OUT','2159010',8)
--,('OUT','2159010',178),('SMS','4153810',1),('OUT','2159010',152),('OUT','9140152',18),('SMS','4162672',1)
--,('SMS','9168204',1),('OUT','9168204',576),('INC','2159010',5),('INC','2159010',4),('SMS','2159010',1)
--,('SMS','4535614',1),('OUT','181868',20),('INC','181868',54),('INC','218748',20),('INC','2159010',9)
--,('INC','197432',66),('SMS','2159010',1),('SMS','4535614',1);

-----------------------------------------------------------------------------------------------------------------

--select * from Ankit_call_details

;with cte_1 as 
(
select call_number, sum(case when call_type ='out' then call_duration end) outgoing_call 
,
sum(case when call_type ='inc' then call_duration end) Incoming_call from ankit_call_details
group by call_number
)
select * from cte_1 where outgoing_call is not null and Incoming_call is not null and Incoming_call<outgoing_call