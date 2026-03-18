use casestudy

select * from [startups]

---Q) number of startups.
select count(distinct name) from [startups]

----Q) number of startups location wise
select location, count(distinct name) no_of_startups from [startups] 
	group by location order by no_of_startups desc

---Q) number of distinct categories and no.of each categories
select count(distinct category) from startups 
select category, count(category) as no_of_startups from startups group by category order by 2 desc

----Q) category wise no.of startups 
select category, count(distinct name) as no_of_startups from [startups] 
group by category order by no_of_startups desc

---Q) location wise total no.of employees working in startups, lag, lead total_no.of employees and cummilative total_no_of_employees
with cte as(
	select location, sum(employees) total_no_of_employees from startups 
	group by location)
select location, total_no_of_employees,  
	lag(total_no_of_employees) over(order by total_no_of_employees desc) as prev_no_of_employees,
	lead(total_no_of_employees) over(order by total_no_of_employees desc) as ahead_no_of_employees,
	sum(total_no_of_employees) over(order by total_no_of_employees desc ROWS BETWEEN UNBOUNDED PRECEDING AND 0 PRECEDING ) 
	cumilative_no_of_employees from cte 

---Q) Average employees working in each location wise and with more than 500 employees working 
select location, avg(employees) average_no_of_employees from startups 
	group by location --order by 2  desc 
	having avg(employees)>500 order by 2 desc
---Q) Average employees working in each category wise and with more than 500 employees working in each category
select category, round(avg(employees),2) average_no_of_employees from startups 
	group by category ---order by 2  desc 
	having avg(employees)>500 order by 2 desc

--Q) list the records related to cloud computing or data analytics or e-commerce categories
select * from startups where category = 'cloud computing' or category= 'Data Analytics' or category= 'E-commerce'


--Q) highest  and lowers fund raised startups details list top 5 
select top 5 name, Fund_raised from startups order by 2 desc
select top 5 name, Fund_raised from startups

---Q) high and low valued startups top 10 
select top 10 name, valuation from startups order by 2 desc 
select top 10 name, valuation from startups 

---Q) total value of all startups 
select sum(valuation) as toal_value from startups

----Q) average valuation of all startups and catgory wise
select avg(valuation) as average_valuation from startups
select category, round(avg(valuation),2) as average_valuation from startups group by category order by 2 desc

---Q) startups and their stages  and stage wise no.of startups
select name, stage from startups
select stage, count(name) as no_of_startups from startups group by stage order by 2 desc

---Q) early and recent founded startups
select name, founded from( select name, founded, rank() over(order by founded) as rnk, 
	dense_rank() over(order by founded) as dense_rnk,
	row_number() over(order by founded) as row_numr from startups )a where rnk=1 or dense_rnk =1 

select name, founded from( select name, founded, rank() over(order by founded desc) as rnk, 
	dense_rank() over(order by founded desc) as dense_rnk,
	row_number() over(order by founded desc) as row_numr from startups )a
 where rnk=1 or dense_rnk =1 










