--DAY - 1
===========
--- from, join, where, group by, having, order by, limit

----agg.functions
-----------------
f(x)-> 20
f(x+4x3..) ==> 
f(x, y)

--sum, avg, min, max, count

select * from employees_details;

select  location, count(emp_id), count(location), sum(salary),
count(emp_id) * count(location) * sum(salary) from employees_details
group by department, location;

select * from employees_details;

select department, count(emp_id) from employees_details where age < 40 
group by department having count(emp_id) = 1;


select location, sum(salary), count(emp_id) from employees_details group by location
having sum(salary) < 100000;

select location, count(emp_id) from employees_details group by location having count(emp_id) > 3;

select location, avg(salary), count(emp_id) 
from employees_details where age > 30 group by location having count(emp_id) > 3 or avg(salary) > 50000
order by location;


----agg.fun --> dif..use case
--- log.exc sql query
----. order 
--- group by 
-- having 

create schema mahendra1;

create table mahendra1.mahima (id int);

select sum(salary) total_salary from employees_details;

select count(emp_id) from employees_details;

select avg(salary) from employees_details;

select min(salary) from employees_details;

select sum(salary) as total_salary, avg(salary) as average_salary, 
min(salary) as least_salary, max(salary) as highest_salary, count(emp_id) as
number_of_employees from employees_details;


select count(distinct department) from employees_details;

select distinct department from employees_details order by department desc;

select location, department, avg(salary) avg_salary,  
count(emp_id) as number_employees, 
sum(salary) total_salary_dept
from employees_details group by location, department;

insert into employees_details values ( 11, 'manju', 55000, 54, 'Data', 'Bangalore'),
(12, 'sanju', 43000, 43, 'IT', 'Bangalore');

-- DAY - 2
===================

----Window functions or analytical functions (extension of agg.functions)
-------------------------------------------------------------------------

select * from employees_details

---1. return those employees details whose salary is higher than the average of all employees salaries.

select * from employees_details where salary >  (select avg(salary) from employees_details)

---2. return those employees details whose salary is higher
--- than their respective department salaries.

select * from table1 join table2 on table1.ref_column = table2.ref_column

select * from 
(select e1.*,  e2.avg_dept_salary
from employees_details e1
join(
select department, avg(salary) as avg_dept_salary from employees_details
group by department) e2 on e1.department = e2.department)a
where a.salary > a.avg_dept_salary;

select sum(salary) from employees_details;

select department, sum(salary) from employees_details 
group by department;

select *, sum(salary) from employees_details
group by emp_id, name, salary, age, department, location;

---case I -> over()

select * from (
select *, sum(salary) over() as total_salary,
avg(salary) over() avg_salary from employees_details

select *, count(emp_id) over(), min(salary) over() from employees_details;

---case II- over(order by)
---running, cummulative, rolling
select *, sum(salary) over(order by emp_id) from employees_details;

select *, avg(salary) over(order by emp_id) from employees_details;

select *, count(emp_id) over(order by emp_id, age) from employees_details;

select *, min(salary) over(order by salary) from employees_details;

---case III: over(partition by)

select * from (
select *, avg(salary) over(partition by department) avg_dept_salary
from employees_details)a where a.salary > a.avg_dept_salary;

select *, min(salary) over(partition by location) from employees_details;

---case IV: over(partition by order by)
select a.location, sum(a.salary) from (
select *, sum(salary)  over(partition by location, department order by age desc) 
total_salary from employees_details
)a group by a.location;


---over(), over(order by), over(partition by), over(partition by order by)

--DAY - 3
=================
---- range of records concepts, RANK, DENSE RANK, ROW NUMBER, LEAD, LAG, 
--- FIRST VALUE, LAST VALUE, NTILE 
















