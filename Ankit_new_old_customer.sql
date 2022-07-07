--drop table if exists customer_orders ;
--create table customer_orders (
--order_id integer,
--customer_id integer,
--order_date date,
--order_amount integer
--);
--insert into customer_orders values(1,100,cast('2022-01-01' as date),2000),(2,200,cast('2022-01-01' as date),2500),(3,300,cast('2022-01-01' as date),2100)
--,(4,100,cast('2022-01-02' as date),2000),(5,400,cast('2022-01-02' as date),2200),(6,500,cast('2022-01-02' as date),2700)
--,(7,100,cast('2022-01-03' as date),3000),(8,400,cast('2022-01-03' as date),1000),(9,600,cast('2022-01-03' as date),3000)

-------------------------------------------------------------------------------------

--select * from customer_orders

;with cte_1 as 
(
select *, row_number() over (partition by customer_id order by customer_id ,order_date) res from customer_orders
)
select order_date , sum(case when res = 1 then 1 else 0 end )new_customer,
sum(case when res >1 then 1 else 0 end )old_customer
from cte_1
group by order_date