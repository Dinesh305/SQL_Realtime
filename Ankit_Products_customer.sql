--create table products
--(
--product_id varchar(20) ,
--cost int
--);
--insert into products values ('P1',200),('P2',300),('P3',500),('P4',800);
--drop table if exists customer_budget;
--create table customer_budget
--(
--customer_id int,
--budget int
--);
--insert into customer_budget values (100,400),(200,800),(300,1500);


;with cte_1 as
(
select product_id,sum(cost) over (order by product_id) s_cost from products
)
select customer_id,budget,STRING_AGG(product_id, ',') agg  from cte_1 p 
join customer_budget c on c.budget >p.s_cost
group by budget,customer_id
