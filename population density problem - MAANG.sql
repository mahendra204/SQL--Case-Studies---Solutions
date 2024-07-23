use meanlifestudies


drop table cities_population_info

create table cities_population_info(
    cityid int primary key,
    cityname  varchar(20),
    population int,
    area int
)

insert into cities_population_info values
(1, 'Mumbai', 20411000, 603),
(2, 'Delhi', 16787941, 1484),
(3, 'Bangalore', 8425970, 709),
(4, 'Hyderabad', 6809970, 650),
(5, 'Ahmedabad', 5570585, 464),
(6, 'Chennai', 4646732, 426),
(7, 'Kolkata', 4486679, 185),
(8, 'Surat', 4467797, 326),
(9, 'Pune', 3115431, 331),
(10, 'Jaipur', 3073350, 485),
(11, 'Lucknow', 2817105, 631),
(12, 'Kanpur', 2768057, 403),
(13, 'Nagpur', 2405665, 217),
(14, 'Indore', 1964086, 530),
(15, 'Thane', 1818872, 147),
(16, 'Bhopal', 1798218, null),
(17, 'Visakhapatnam', 1730320, 681),
(18, 'Patna', 1684222, null),
(19, 'Vadodara', 1670806, 300),
(20, 'Ghaziabad', 1648643, null);


select * from cities_population_info

select population_density_level, count(*) number_of_cities
from (
select *, case when population_density < avg_val then 'below_avg_density' 
			when population_density > avg_val then 'above_avg_density' 
			else 'avg_density' end as population_density_level 
from(
select *, avg(population_density) over() as avg_val from(
select *, population/area as population_density from cities_population_info)a)b)c 
group by population_density_level
