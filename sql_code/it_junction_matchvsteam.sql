--drop table if exists it_junction_team;
--Create Table it_junction_team(
--ID INT,
--TeamName Varchar(50)
--);

--INSERT INTO it_junction_team VALUES(1,'India'),(2,'Australia'),(3,'England'),(4,'NewZealand');

--------------------------------------------------------------------------


select concat(t1.teamname , ' vs ' , t2.teamname) team from it_junction_team t1 join it_junction_team t2 on t1.teamname<t2.teamname