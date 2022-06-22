drop table if exists products
create table ankit_products
(
product_id varchar(20) ,
cost int
);
insert into ankit_products values ('P1',200),('P2',300),('P3',500),('P4',800);
;
drop table if exists ankit_customer_budget
create table ankit_customer_budget
(
customer_id int,
budget int);
insert into ankit_customer_budget values (100,400),(200,800),(300,1500);
-----------------------------------------------------------------------------------------

