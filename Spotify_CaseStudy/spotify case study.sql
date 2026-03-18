CREATE table activity
(
user_id varchar(20),
event_name varchar(20),
event_date date,
country varchar(20)
);

insert into activity values (1,'app-installed','2022-01-01','India')
,(1,'app-purchase','2022-01-02','India')
,(2,'app-installed','2022-01-01','USA')
,(3,'app-installed','2022-01-01','USA')
,(3,'app-purchase','2022-01-03','USA')
,(4,'app-installed','2022-01-03','India')
,(4,'app-purchase','2022-01-03','India')
,(5,'app-installed','2022-01-03','SL')
,(5,'app-purchase','2022-01-03','SL')
,(6,'app-installed','2022-01-04','Pakistan')
,(6,'app-purchase','2022-01-04','Pakistan');

select * from activity

--Q: find total active users each day.

select event_date, count(distinct(user_id)) from activity group by event_date

--Q: find total active users each week.
select datepart(week,event_date) as week_number, count(distinct user_id) as total_active_users  from activity 
group by datepart(week,event_date)

--Q: find date wise total number of users who made the purchase same day they installed the app.
--------------------------- using CTE method ----------------------------------------

with cte as (
select user_id,event_date,count(distinct event_name) as no_of_events from activity 
group by user_id,event_date having count(distinct event_name)=2)

select event_date, count(user_id) as no_of_users from cte group by event_date

--------------------------- usning subquery method -----------------------------------

select event_date, count(distinct user_id) as no_of_users from (
	select user_id,event_date,count(distinct event_name) as 
	no_of_events from activity group by user_id, event_date
	having count(distinct event_name)=2) x group by event_date


---------------using case statements-------------------
select event_date, count(new_users) as no_of_users from (
select user_id, event_date,
	case when count(distinct event_name)=2 then user_id else null end as new_users from activity
	group by user_id,event_date) x 
group by event_date


---Q: percentage of paid users in India, USA and any other countries should be tagged as others 
with cte as (select  
case when country in ('USA', 'India') then country else 'others' end as new_country, count(distinct user_id) as no_of_paid_users from activity
where event_name ='app-purchase' group by case when country in ('USA', 'India') then country else 'others' end) , 
total as (select sum(no_of_paid_users) as total_users from cte)

select new_country,cast((no_of_paid_users * 1.0 /total_users *100) as int) as percent_users  from cte, total


--Q: among all the users who installed the app on a given day, how many users did app purchased on the very next day.
with cte as (
select *
,lag(event_name, 1) over(partition by user_id order by event_date) as previous_event_name
,lag(event_date, 1) over(partition by user_id order by event_date) as previous_event_date 
from activity)
select event_date, count(distinct user_id)as count_users from cte 
where event_name='app-purchase' and 
previous_event_name= 'app-installed' and 
datediff(day,previous_event_date,event_date)=1 group by event_date
