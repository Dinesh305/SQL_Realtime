--Drop table if exists Ankit_Orders;
--CREATE TABLE [dbo].Ankit_Orders(
-- [order_number] [int] NOT NULL,
-- [order_date] [date] NOT NULL,
-- [cust_id] [int] NOT NULL,
-- [salesperson_id] [int] NOT NULL,
-- [amount] [float] NOT NULL
--) ON [PRIMARY];

--INSERT INTO [dbo].Ankit_Orders ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (30, CAST('1995-07-14' AS Date), 9, 1, 460);

--INSERT into [dbo].Ankit_Orders ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (10, CAST('1996-08-02' AS Date), 4, 2, 540);

--INSERT INTO [dbo].Ankit_Orders ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (40, CAST('1998-01-29' AS Date), 7, 2, 2400);

--INSERT INTO [dbo].Ankit_Orders ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (50, CAST('1998-02-03' AS Date), 6, 7, 600);

--INSERT into [dbo].Ankit_Orders ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (60, CAST('1998-03-02' AS Date), 6, 7, 720);

--INSERT into [dbo].Ankit_Orders ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (70, CAST('1998-05-06' AS Date), 9, 7, 150);

--INSERT into [dbo].Ankit_Orders ([order_number], [order_date], [cust_id], [salesperson_id], [amount]) VALUES (20, CAST('1999-01-30' AS Date), 4, 8, 1800);

---------------------------------------------------------------------------------------------------------------

--select * from Ankit_Orders

;with cte_1 as 
(
select *, row_number() over (partition by salesperson_id order by amount desc) result from ankit_orders
)
select * from cte_1 where result=1
order by order_number