use meanlifestudies 

create table numbers (
    id int primary key,
    num int
)
insert into numbers values (1, 3),(2, 8),(3, 2),
(4, 10),(5, 14),(6, 3),(7, 20),(8, 15),(9, 4),(10, 8),
(11, 6),(12, 3),(13, 10),(14, 22),(15, 3),(16, 8)

select * from numbers 

------25) Find Mean, Mode, and Median of the given set of numbers.

--mean: sum(num)/count(num)          ========> avg(num)
select sum(num)/count(num) as mean_of_numbers from numbers

select avg(num) as mean from numbers

--mode: a number that occures more frequently or more number of times 
select num from(
select  top 1 num, count(*) as number_of_times from numbers group by num order by 2 desc)a
--median: 1) odd ==> the middle number is a median 2) even ===> the average of middle two numbers is median

with cte as(
select num, row_number() over(order by num desc) as rn, count(*) over() total_count from numbers)
select top 1 case when total_count%2!=0 then (select num from cte where rn = (total_count+1 /2))
		else (select avg(num) from cte where rn in( total_count/2, total_count/2 +1))
		end as median from cte

1,2,3,4,5,6










