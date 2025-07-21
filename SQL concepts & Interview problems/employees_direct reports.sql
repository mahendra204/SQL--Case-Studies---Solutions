use meanlifestudies

select * from employees_info

---Q)return manager ids who have two employees.
---23. Find Managers who had two direct reports from employees.
--24. Find Managers whose salary is higher than the average salaries of their direct reporting employees.

select mgrid from(
select mgrid, count(empid) number_of_employees from employees_info group by mgrid having count(empid) =2)a

with cte as(
select a.*, b.empname as manager_name from employees_info a join employees_info b 
on a.mgrid = b.empid and a.mgrid ! = a.empid)
, cte2 as(
select manager_name, count(empid) numberof_direct_reportings from cte group by manager_name having count(empid) =2)
select manager_name from cte2

with cte as(
select a.*, b.empname as manager_name, b.salary as manager_salary from employees_info a join employees_info b 
on a.mgrid = b.empid and a.mgrid ! = a.empid)
, cte2 as(
select manager_name, manager_salary, avg(salary) avg_salary_employees from cte group by manager_name, manager_salary)
select manager_name from cte2 where manager_salary > avg_salary_employees










