select * from employees 

--Q) Given employees details. 
-----Return Employees who earn higher salary than the average of all employees
-- in the organization without using either of these concepts listed below.
----(subqueries, joins, CTEs, window functions). 


select * from employees where salary > (select avg(salary) from employees)

select id, name, department, salary, location from(
select * from employees 
cross join 
(select avg(salary) avg_salary from employees)a)b
where salary > avg_salary 


with cte as(
select avg(salary) as avg_salary from employees)
select * from employees where salary > (select avg_salary from cte)

select * from (
select *, avg(salary) over() avg_salary from employees)a 
where salary > avg_salary

declare @avg_salary int
set @avg_salary = (select avg(salary) from employees)
select * from employees where salary > @avg_salary 


