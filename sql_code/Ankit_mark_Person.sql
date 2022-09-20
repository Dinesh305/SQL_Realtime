/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT * FROM Friend
--select * from person
;with cte_1 as 
(
select a.PersonID,sum(b.score) Scor,count(*) no_of_friends from friend a join person b on a.FriendID=b.PersonID
group by a.PersonID
having sum(b.score) > 100
)
select a.*, b.name as name from cte_1 a join person b on a.PersonID=b.PersonID