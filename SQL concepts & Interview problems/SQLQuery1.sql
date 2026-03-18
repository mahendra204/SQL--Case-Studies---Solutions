--Q) Given an employees table as a single column as information. 
---convert into proper table with emp_id, name, dept_id, and department name.

select * from employees 

with cte as(
select case when information in ('101', '102', '103', '104') then 
	cast(information as int) else null end emp_id, 
	case when information in ('400', '500', '700', '800') then 
	cast(information as int) else null end as dept_id, 
	case when information in ('Data Engineer', 'Data Analyst', 
	'MLEngineer', 'Data Scientist') then information else null end
	department_name, 
	case when information not in ('Data Engineer', 'Data Analyst', 
	'MLEngineer', 'Data Scientist') and information like '%a%' then
	information else null  end as emp_name
	from employees), 
emp_ids as(
select emp_id, row_number() over(order by emp_id) as rn
	from cte where emp_id is not null), 
emp_names as(
select emp_name, row_number() over(order by emp_name) as rn
	from cte where emp_name is not null), 
dept_ids as(
select dept_id, row_number() over(order by dept_id) as rn
	from cte where dept_id is not null), 
department_names as(
select department_name, row_number() over(order by department_name) as rn
	from cte where department_name is not null)
select * from emp_ids join emp_names on emp_ids.rn = emp_names.rn 













