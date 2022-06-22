Drop table if exists google_company_users 
create table google_company_users 
(
company_id int,
user_id int,
language varchar(20)
);

insert into google_company_users values (1,1,'English')
,(1,1,'German')
,(1,2,'English')
,(1,3,'German')
,(1,3,'English')
,(1,4,'English')
,(2,5,'English')
,(2,5,'German')
,(2,5,'Spanish')
,(2,6,'German')
,(2,6,'Spanish')
,(2,7,'English');
-------------------------
;with cte_1 as 
(
select company_id,user_id,count(user_id) cnt from google_company_users where language in ('english' , 'german')
group by company_id,user_id
having count(user_id) >=2
)
select company_id,count(company_id) user_count from cte_1 
group by company_id
having count(company_id) >=2