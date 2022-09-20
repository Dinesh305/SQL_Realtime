--create table Ankitplayers
--(player_id int,
--group_id int)

--insert into Ankitplayers values (15,1);
--insert into Ankitplayers values (25,1);
--insert into Ankitplayers values (30,1);
--insert into Ankitplayers values (45,1);
--insert into Ankitplayers values (10,2);
--insert into Ankitplayers values (35,2);
--insert into Ankitplayers values (50,2);
--insert into Ankitplayers values (20,3);
--insert into Ankitplayers values (40,3);

--create table Ankit_matches
--(
--match_id int,
--first_player int,
--second_player int,
--first_score int,
--second_score int)

--insert into Ankit_matches values (1,15,45,3,0);
--insert into Ankit_matches values (2,30,25,1,2);
--insert into Ankit_matches values (3,30,15,2,0);
--insert into Ankit_matches values (4,40,20,5,2);
--insert into Ankit_matches values (5,35,50,1,1);

------------------------------------------------------------------------------------------------------


--select * from ankitplayers
--Select * from ankit_matches


;with cte_1 as 
(
select first_player as player_id , first_score as score from ankit_matches
union all
select second_player as player_id , second_score as scotre from ankit_matches
)
,cte_2 as 
(
select a.player_id, sum(score) as score,b.group_id from cte_1 a join ankitplayers b on a.player_id=b.player_id
group by a.player_id,b.group_id
)
,cte_3 as 
(
select *,row_number() over (partition by group_id order by score desc,player_id ) rk from cte_2
)
select * from cte_3 where rk =1