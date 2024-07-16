use meanlifestudies

create table weather_data (
    date date,
    temperature int
);

insert into weather_data values ('2024-04-15', 40),('2024-04-16', 42),('2024-04-17', 38),
('2024-04-18', 36),('2024-04-19', 38), ('2024-04-20', 45),('2024-04-21', 46),('2024-04-22', 40),
('2024-04-23', 41),('2024-04-24', 43),('2024-04-25', 39),('2024-04-26', 37), ('2024-04-27', 42);

select * from weather_data

with cte as(
select a.*, b.temperature as one_day_prev_temp , c.temperature as two_day_before_temp from weather_data a left join weather_data b 
on datename(day,a.date) -1  = datename(day,b.date)  
left join weather_data c on datename(day,a.date) -2 = datename(day,c.date))
, cte2 as(
select date, temperature,(one_day_prev_temp + two_day_before_temp)/2 as avg_prev_two_day_temp
 from cte)
 select date from cte2 where temperature > avg_prev_two_day_temp

 with cte as(
 select *, lag(temperature, 1)  over(order by date) as one_day_pre_temp, 
 lag(temperature, 2) over(order by date) as two_day_pre_temp from 
 weather_data)
 select date from cte where temperature > (one_day_pre_temp + two_day_pre_temp)/2 

 with cte as(
 select *, 
 avg(temperature) over(order by date rows between 2 preceding and 1 preceding) as avg_two_day_temp, 
 count(temperature) over(order by date rows between 2 preceding and 1 preceding) as count_not_null
 from weather_data)
 select date from cte where temperature > avg_two_day_temp and count_not_null = 2


