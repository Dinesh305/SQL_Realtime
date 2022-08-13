--drop table if exists Ankit_products;
--create table Ankit_products
--(
--product_id varchar(20) ,
--cost int
--);
--insert into Ankit_products values ('P1',200),('P2',300),('P3',500),('P4',800);

--drop table if exists Ankit_customer_budget
--create table Ankit_customer_budget
--(
--customer_id int,
--budget int
--);
--insert into Ankit_customer_budget values (100,400),(200,800),(300,1500);

-----------------------------------------------------------------------------------

;with cte_1 as 
(
select *,sum(cost) over (order by product_id) running_cost from Ankit_products
)
,cte_2 as
(
select * from cte_1 a join Ankit_customer_budget b on a.running_cost<b.budget
--order by customer_id
)
select customer_id, budget,count(*) cnt , STRING_AGG(product_id,' ') maxi from cte_2
group by customer_id,budget