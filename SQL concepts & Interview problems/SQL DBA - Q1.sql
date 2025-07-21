create database Meanlifestudies





create table employees(information varchar(30))
insert into employees values ('101'), ('mahendra'), ('400'), ('Data Engineer'), 
('Data Analyst'), ('500'), ('vishal'),('102'), ('700'), ('usha'), ('MLEngineer'), 
('103'), ('800'),('Data Scientist'), ('das'), ('104')
select * from employees 
 





with cte as(
select case when information like '1%' then cast(information as int) end as employee_id, 
	case when information in ('Data Engineer', 'Data Analyst', 'MLEngineer', 'Data Scientist')
			then information end as department,
	case when information in ('400', '500', '700', '800')
			then information end as dept_id,
	case when information not in ('Data Engineer', 'Data Analyst', 'ML Engineer', 'Data Scientist')
	and information not like '%data%' and information not like '%engineer%' and 
	information like '%a%' then information 
	end as employee_name 
from employees
), 
dept_ids as(
select distinct dept_id, row_number() over(order by dept_id) as rn from cte where dept_id is not null),
empids as(
select distinct employee_id, row_number() over(order by employee_id desc) as rn from cte where employee_id is not null)
, dept_names as(
select distinct department,  row_number() over(order by department) as rn from cte where department is not null) 
, emp_names as(
select employee_name, row_number() over(order by employee_name) as rn from cte where employee_name is not null)
--- jonining all sub CTEs
select employee_id, employee_name, dept_id, department
from empids join emp_names on empids.rn = emp_names.rn 
join dept_ids on dept_ids.rn = emp_names.rn join dept_names on 
dept_names.rn = dept_ids.rn order by 1 








