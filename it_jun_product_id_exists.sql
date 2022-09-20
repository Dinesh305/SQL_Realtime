--CREATE TABLE it_jun_Order_Tbl(
-- [ORDER_DAY] date,
-- [ORDER_ID] varchar(10) ,
-- [PRODUCT_ID] varchar(10) ,
-- [QUANTITY] int ,
-- [PRICE] int 
--) 

--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-01','ODR1', 'PROD1', 5, 5)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-01','ODR2', 'PROD2', 2, 10)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-01','ODR3', 'PROD3', 10, 25)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-01','ODR4', 'PROD1', 20, 5)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-02','ODR5', 'PROD3', 5, 25)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-02','ODR6', 'PROD4', 6, 20)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-02','ODR7', 'PROD1', 2, 5)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-02','ODR8', 'PROD5', 1, 50)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-02','ODR9', 'PROD6', 2, 50)
--INSERT INTO it_jun_Order_Tbl  VALUES ('2015-05-02','ODR10','PROD2', 4, 10)

-----------------------------------------------------------------------------------------------------

--select * from it_jun_Order_Tbl

--1
select  product_id,count(product_id) cnt from it_jun_Order_Tbl
group by product_id
having count(product_id)> 1

--2

select product_id from it_jun_Order_Tbl where order_day ='2015-05-02' and product_id not in (
select product_id from it_jun_Order_Tbl where order_day = '2015-05-01'
)
