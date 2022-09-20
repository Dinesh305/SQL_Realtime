select * from [int_orders]
-----------------------------------------------------------------------------------------------------
;with cte_1 as 
(
select *, row_number() over  (partition by salesperson_id order by amount desc) res from [int_orders]
)
select * from cte_1 where res =1 
------------------------------------------------------------------------------------------------------
