--create table ankit_brands 
--(
--category varchar(20),
--brand_name varchar(20)
--);
--insert into ankit_brands values
--('chocolates','5-star')
--,(null,'dairy milk')
--,(null,'perk')
--,(null,'eclair')
--,('Biscuits','britannia')
--,(null,'good day')
--,(null,'boost');
-----------------------------------------------------------
--select * from ankit_brands



;WITH CTE AS
(
SELECT *, ROW_NUMBER() OVER(order by (select null)) as rn FROM ankit_brands
) 
,CTE1 AS 
(
SELECT *, SUM(CASE WHEN category is NULL THEN 0 ELSE 1 END) OVER(ORDER BY rn) as sm FROM CTE
)

--select * from cte1;
SELECT first_value(category) OVER(PARTITION BY sm ORDER BY rn) as Brands,brand_name FROM CTE1;
