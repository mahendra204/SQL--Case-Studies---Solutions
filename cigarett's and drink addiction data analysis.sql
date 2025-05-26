select column_name from information_schema.columns where table_name = 'cigarettes_alcohol_dataset'

select education_level, count(id) as number_of_people from cigarettes_alcohol_dataset
group by education_level order by 2


select marital_status, count(id) as number_of_people from cigarettes_alcohol_dataset
group by marital_status order by 2


select exercise_frequency, count(id) as number_of_people from cigarettes_alcohol_dataset
group by exercise_frequency order by 2

select diet_quality, count(id) as number_of_people from cigarettes_alcohol_dataset
group by diet_quality order by 2 desc

select therapy_history, count(id) as number_of_people from cigarettes_alcohol_dataset
group by therapy_history order by 2 desc



select has_health_issues, count(id) as number_of_people from cigarettes_alcohol_dataset
group by has_health_issues order by 2

select mental_health_status, count(id) as number_of_people from cigarettes_alcohol_dataset
group by mental_health_status order by 2



select social_support, count(id) as number_of_people from cigarettes_alcohol_dataset
group by social_support order by 2















select count(id) as number_of_people from cigarettes_alcohol_dataset

select distinct gender from cigarettes_alcohol_dataset

select count(distinct country) number_of_countries from cigarettes_alcohol_dataset




select top 15 country, count(id) number_of_people
from cigarettes_alcohol_dataset group by country
order by 2 desc









select count(distinct city) number_of_cities from cigarettes_alcohol_dataset

select distinct education_level from cigarettes_alcohol_dataset

select distinct employment_status from cigarettes_alcohol_dataset


















select distinct marital_status from cigarettes_alcohol_dataset

select distinct children_count from cigarettes_alcohol_dataset



select distinct smokes_per_day from cigarettes_alcohol_dataset order by 1




select distinct drinks_per_week from cigarettes_alcohol_dataset order by 1

select distinct attempts_to_quit_smoking from cigarettes_alcohol_dataset order by 1

select distinct attempts_to_quit_drinking from cigarettes_alcohol_dataset order by 1




select distinct has_health_issues from cigarettes_alcohol_dataset

select distinct mental_health_status from cigarettes_alcohol_dataset

select distinct exercise_frequency from cigarettes_alcohol_dataset




select distinct diet_quality from cigarettes_alcohol_dataset

select distinct social_support from cigarettes_alcohol_dataset

select distinct therapy_history from cigarettes_alcohol_dataset

select gender, count(id) number_of_people
from cigarettes_alcohol_dataset group by gender order by 2 desc

select employment_status, count(id) number_of_people
from cigarettes_alcohol_dataset group by employment_status
order by 2 desc








