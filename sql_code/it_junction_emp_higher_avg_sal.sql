--drop table if exists it_junction_Employee;
--CREATE Table it_junction_Employee
--(
--EmpID INT,
--EmpName Varchar(30),
--Salary Float,
--DeptID INT
--)

--INSERT INTO it_junction_Employee VALUES(1001,'Mark',60000,2)
--INSERT INTO it_junction_Employee VALUES(1002,'Antony',40000,2)
--INSERT INTO it_junction_Employee VALUES(1003,'Andrew',15000,1)
--INSERT INTO it_junction_Employee VALUES(1004,'Peter',35000,1)
--INSERT INTO it_junction_Employee VALUES(1005,'John',55000,1)
--INSERT INTO it_junction_Employee VALUES(1006,'Albert',25000,3)
--INSERT INTO it_junction_Employee VALUES(1007,'Donald',35000,3)

---------------------------------------------------------------------

--select * from it_junction_Employee

--;with cte_1 as 
--(
--select *,avg(salary) over (partition by deptid order by deptid) result from it_junction_Employee
--)
--select * from cte_1 where salary > result