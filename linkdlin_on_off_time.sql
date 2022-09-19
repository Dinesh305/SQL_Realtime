--CREATE TABLE linkdlin_electric_items(
--id int,
--type varchar(20),
--status varchar(20),   
--time_res int
--);

--INSERT INTO linkdlin_electric_items VALUES(1,'light','on',100),
--(1,'light','off',110),
--(2,'fan','on',80),
--(2,'fan','off',120),
--(1,'light','on',150),
--(1,'light','off',200);

select * from linkdlin_electric_items



;WITH all_details AS(
SELECT id,type,status,time_res,
LAG(time_res,1) OVER(ORDER BY (SELECT NULL)) prev_time_res
FROM linkdlin_electric_items
)

--select * ,time_res-prev_time_res from all_details

-- 𝘚𝘵𝘦𝘱-2: 𝘍𝘪𝘯𝘥𝘪𝘯𝘨 𝘵𝘩𝘦 𝘛𝘰𝘵𝘢𝘭 "𝘰𝘯" 𝘵𝘪𝘮𝘦
SELECT id,type,SUM(time_res - prev_time_res) total_duration
FROM all_details
WHERE status='off'
GROUP BY id,type
ORDER BY id;
