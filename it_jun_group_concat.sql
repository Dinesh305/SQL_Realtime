--drop table if exists it_jun_Emp_Details
--CREATE TABLE it_jun_Emp_Details (
--EMPID int,
--Gender varchar,
--EmailID varchar(30),
--DeptID int)


--INSERT INTO it_jun_Emp_Details VALUES (1001,'M','YYYYY@gmaix.com',104)
--INSERT INTO it_jun_Emp_Details VALUES (1002,'M','ZZZ@gmaix.com',103)
--INSERT INTO it_jun_Emp_Details VALUES (1003,'F','AAAAA@gmaix.com',102)
--INSERT INTO it_jun_Emp_Details VALUES (1004,'F','PP@gmaix.com',104)
--INSERT INTO it_jun_Emp_Details VALUES (1005,'M','CCCC@yahu.com',101)
--INSERT INTO it_jun_Emp_Details VALUES (1006,'M','DDDDD@yahu.com',100)
--INSERT INTO it_jun_Emp_Details VALUES (1007,'F','E@yahu.com',102)
--INSERT INTO it_jun_Emp_Details VALUES (1008,'M','M@yahu.com',102)
--INSERT INTO it_jun_Emp_Details VALUES (1009,'F','SS@yahu.com',100)

---------------------------------------------------------------------

select deptid,STRING_AGG(emailid, ';') group_concat from it_jun_Emp_Details
group by deptid
