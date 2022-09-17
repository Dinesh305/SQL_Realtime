--CREATE TABLE [dbo].it_jun_Transaction_Tbl(
-- [CustID] [int] ,
-- [TranID] [int] ,
-- [TranAmt] [float] ,
-- [TranDate] [date] 
--) 

--INSERT it_jun_Transaction_Tbl ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20001, 10000, CAST('2020-04-25' AS Date))
--INSERT it_jun_Transaction_Tbl ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20002, 15000, CAST('2020-04-25' AS Date))
--INSERT it_jun_Transaction_Tbl ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20003, 80000, CAST('2020-04-25' AS Date))
--INSERT it_jun_Transaction_Tbl ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1001, 20004, 20000, CAST('2020-04-25' AS Date))
--INSERT it_jun_Transaction_Tbl ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30001, 7000, CAST('2020-04-25' AS Date))
--INSERT it_jun_Transaction_Tbl ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30002, 15000, CAST('2020-04-25' AS Date))
--INSERT it_jun_Transaction_Tbl ([CustID], [TranID], [TranAmt], [TranDate]) VALUES (1002, 30003, 22000, CAST('2020-04-25' AS Date))

----------------------------------------------------------------------------------------------

--select * from it_jun_Transaction_Tbl


select *,max(tranamt) over (partition by custid) maximum,
tranamt/max(tranamt) over(partition by custid order by custid) ratio
from it_jun_Transaction_Tbl

