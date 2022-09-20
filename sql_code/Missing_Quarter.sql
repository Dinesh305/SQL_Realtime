--select * from ankit_bms

--CREATE TABLE Ankit_STORES (
--Store varchar(10),
--Quarter varchar(10),
--Amount int);

--INSERT INTO Ankit_STORES (Store, Quarter, Amount)
--VALUES ('S1', 'Q1', 200),
--('S1', 'Q2', 300),
--('S1', 'Q4', 400),
--('S2', 'Q1', 500),
--('S2', 'Q3', 600),
--('S2', 'Q4', 700),
--('S3', 'Q1', 800),
--('S3', 'Q2', 750),
--('S3', 'Q3', 900);

------------------------------------------------------------------------------------------------------

--select * from Ankit_STORES

;with cte_1 as 
(
select *, cast(SUBSTRING([Quarter],2,1 ) as int) sep from Ankit_STORES
)

,cte_2 as 
(
select Store,10-sum(sep) cnt from cte_1
group by Store
)
select Store , 'Q' + cast(cnt as char(3)) as missing from cte_2