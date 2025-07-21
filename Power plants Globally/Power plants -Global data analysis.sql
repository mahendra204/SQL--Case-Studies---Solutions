-- select * from ['Powerplants_Globally']
alter table ['Powerplants_Globally'] alter column commissioning_year nvarchar(255), int;
----- Q1)
select top 10
    country_code,
    country_name,
    round(sum(estimated_generation_gwh_2013 + 
		estimated_generation_gwh_2014 + 
		estimated_generation_gwh_2015 +
        estimated_generation_gwh_2016 + 
		estimated_generation_gwh_2017),2) as total_generation
from ['Powerplants_Globally']
group by country_code, country_name
order by 3 desc
----Q2)
with cte as (
    select 
        country_code,country_name,plant_name, capacity_mw,
        row_number() over(partition by country_code order by capacity_mw desc) as  plant_rank
   from ['Powerplants_Globally'])
select country_code, country_name, plant_name, capacity_mw
from cte
where plant_rank = 1 order by 4 desc

---Q3)
select
    type_of_plant,
   round(avg(capacity_mw),3) as avg_capacity_mw , rank() over( order by avg(capacity_mw) desc) as rnk
from  ['Powerplants_Globally']
group by Type_of_Plant

---Q4)
select 
    owner,
    count(distinct country_code) as num_countries
from ['Powerplants_Globally'] 
group by owner 
having count(distinct country_code) > 1 and owner is not null order by 2 desc

---Q4)
SELECT
    owner,
    COUNT(DISTINCT country_code) AS no_of_countries,
    STRING_AGG (DISTINCT country_name) AS corresponding_countries
FROM ['Powerplants_Globally']
WHERE owner IS NOT NULL
GROUP BY owner
HAVING COUNT(DISTINCT country_code) > 1
ORDER BY no_of_countries DESC;





--Q5)
Select top 1
    commissioning_year,
    sum (estimated_generation_gwh_2013 + estimated_generation_gwh_2014 + estimated_generation_gwh_2015 +
        estimated_generation_gwh_2016 + estimated_generation_gwh_2017) as total_generation
from ['Powerplants_Globally'] where commissioning_year is not null
group by commissioning_year
order by total_generation desc



--Q6)
select top 3
    owner,
    sum(estimated_generation_gwh_2013 + estimated_generation_gwh_2014 + estimated_generation_gwh_2015 +
        estimated_generation_gwh_2016 + estimated_generation_gwh_2017) as total_generation
FROM ['Powerplants_Globally'] where owner is not null 
group by owner
order by total_generation desc
--Q7)
with cte as (
    select
        country_code,country_name,commissioning_year,
        estimated_generation_gwh_2013,
        lag(estimated_generation_gwh_2013) over (partition by country_code order by commissioning_year)
		as prev_year_generation
    from ['Powerplants_Globally']
)
select
    country_code,country_name,commissioning_year,
    round(avg((estimated_generation_gwh_2013 - prev_year_generation) / prev_year_generation),2) as avg_growth_rate
from cte where commissioning_year is not null
group by country_code, country_name,
commissioning_year order by avg_growth_rate desc;

---Q8)
WITH cte AS (
    SELECT
        Type_of_Plant,
        Plant_name,
        capacity_mw,
        ROW_NUMBER() OVER (PARTITION BY Type_of_Plant ORDER BY capacity_mw DESC) AS plant_rank
    FROM ['Powerplants_Globally']
)
SELECT
    Type_of_Plant,
    Plant_name,
    capacity_mw
FROM cte
WHERE plant_rank = 1 order by 3 desc


---Q9)
select top 5
    source,Type_of_Plant,
    sum(estimated_generation_gwh_2013 + estimated_generation_gwh_2014 + estimated_generation_gwh_2015 +
        estimated_generation_gwh_2016 + estimated_generation_gwh_2017) as total_generation
from ['Powerplants_Globally']
group by source, Type_of_Plant
order by total_generation desc









































