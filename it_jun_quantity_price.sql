--select * from it_jun_Order_Tbl 

--1
;with cte_1 as 
(
select *,(quantity*price) total from it_jun_Order_Tbl
)
,cte_2 as
(
select *, ROW_NUMBER() over (partition by order_day order by total desc) res from cte_1 
)
select * from cte_2 where res =1

--2

--select * from it_jun_Order_Tbl


select product_id, sum(case when order_day ='2015-05-01' then (quantity*price) else 0 end) total_sales_01,
sum(case when order_day ='2015-05-02' then (quantity*price) end) total_sales_02 from it_jun_Order_Tbl
group by product_id